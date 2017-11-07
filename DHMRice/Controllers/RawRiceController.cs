using DHMRice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DHMRice.Controllers
{
    public class RawRiceController : Controller
    {

        private ApplicationDbContext db = new ApplicationDbContext();
        // GET: RawRice
        public ActionResult Index()
        {
            
            return View(db.RarRices.Where(m=>m.Status).ToList());
        }
        public ActionResult AddNew()
        {

            ViewBag.Party_Id = new SelectList(db.Parties.Where(m => m.Status == true).ToList(), "Party_Id", "Party_Name");

            ViewBag.Broker_Id = new SelectList(db.Brokers.Where(m => m.Status == true).ToList(), "Broker_Id", "Broker_Name");

            ViewBag.Rice_category_Id = new SelectList(db.Rice_Categories.Where(m => m.Status == true).ToList(), "Rice_category_Id", "Rice_Category_Name");

            ViewBag.Packing_Id = new SelectList(db.Packings.ToList(), "Packing_Id", "Packing_Type");
            return View();
        }
        [HttpPost]
        public ActionResult AddNew(RawRice rawRice,List<RawRiceExpense> RawRiceExpense,Pricing pricing,List<RawRice> RawRice_Remaining,List<decimal> Previous_Remainings, FormCollection form)
        {
            decimal payedamount = Convert.ToDecimal(form["Payed_Amount"]);
            if (RawRice_Remaining != null&& Previous_Remainings!=null)
            {
                for (int i = 0; i < RawRice_Remaining.Count; i++)
                {
                    Transaction rem_trans = new Transaction();
                    rem_trans.Transaction_item_id = RawRice_Remaining[i].RawRice_id;
                    rem_trans.Transaction_item_type = "RawRice";
                    rem_trans.Transaction_Description = "Pay Remaining Amount of " + RawRice_Remaining[i].Item_Name;
                    rem_trans.Transaction_DateTime = DateTime.Now;
                    if (form["isBankAccount"] != null)
                    {
                        rem_trans.BankAccountNo = db.Parties.Find(rawRice.Party_Id).Party_ACcountNo;
                    }
                    else if (form["isCheckbook"] != null)
                    {
                        rem_trans.checkno = Convert.ToInt32(form["CheckNo"]);
                        rem_trans.BankAccountNo = db.Parties.Find(rawRice.Party_Id).Party_ACcountNo;
                    }
                    else if (form["isCash"] != null)
                    {
                        rem_trans.isByCash = true;
                    }
                    foreach (var item in db.Opening_ClosingDays)
                    {
                        if (item.Date.ToShortDateString() == DateTime.Now.ToShortDateString() && !item.isClosed)
                        {
                            rem_trans.Opening_ClosingDays_id = item.Opening_ClosingDays_id;
                            break;
                        }
                    }
                    rem_trans.Debit = Previous_Remainings[i];
                    rem_trans.Credit = 0;
                    rem_trans.status = true;
                    db.Transaction.Add(rem_trans);
                    db.SaveChanges();
                    payedamount =payedamount- Previous_Remainings[i];

                }
            }

            rawRice.Status = true;
            rawRice.Date = DateTime.Now;
            rawRice.Bags_Sold_qty = 0;
            db.RarRices.Add(rawRice);
            db.SaveChanges();
            var rawrice_id = db.RarRices.Max(m => m.RawRice_id);

            foreach (var item in RawRiceExpense)
            {
                item.RawRice_id = rawrice_id;                
                db.RawRiceExpense.Add(item);
                db.SaveChanges();
            }

            pricing.item_id = rawrice_id;
            pricing.item_Type = "RawRice";
            pricing.Pricing_Date = DateTime.Now;
            pricing.Status = true;
            db.Pricing.Add(pricing);
            db.SaveChanges();

            Transaction trans = new Transaction();
            if (form["isBankAccount"] != null)
            {
                trans.BankAccountNo = db.Parties.Find(rawRice.Party_Id).Party_ACcountNo;
            }
            else if (form["isCheckbook"] != null)
            {
                trans.checkno = Convert.ToInt32(form["CheckNo"]);
                trans.BankAccountNo = db.Parties.Find(rawRice.Party_Id).Party_ACcountNo;
            }
            else if(form["isCash"]!=null)
            {
                trans.isByCash = true;
            }
            foreach (var item in db.Opening_ClosingDays)
            {
                if (item.Date.ToShortDateString() == DateTime.Now.ToShortDateString() && !item.isClosed)
                {
                    trans.Opening_ClosingDays_id = item.Opening_ClosingDays_id;
                    break;
                }
            }
            trans.Transaction_DateTime = DateTime.Now;
            trans.Transaction_Description = "Purchase " + rawRice.Item_Name + " from Party " + db.Parties.Find(rawRice.Party_Id).Party_Name;
            trans.Transaction_item_id = rawrice_id;
            trans.Transaction_item_type = "RawRice";
            trans.Debit = payedamount;
            trans.Credit = 0;
            trans.status = true;
            db.Transaction.Add(trans);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult GetPartyRemainings(int Party_Id)
        {
            var rawRice = db.RarRices.Where(m => m.Party_Id == Party_Id).ToList();
            var transactions = new List<Transaction>();
            List<Tuple<RawRice, decimal>> jsonret = new List<Tuple<RawRice, decimal>>();
            foreach (var item in rawRice)
            {
               decimal Payed = db.Transaction.Where(m => m.Transaction_item_id == item.RawRice_id).Sum(m=>m.Debit);
                decimal remaining = db.Pricing.Where(m => m.item_id == item.RawRice_id).Max(m => m.Pricing_NetTotal) - Payed;
                if(remaining>0)
                jsonret.Add(new Tuple<RawRice, decimal>(item,remaining));
            }

            
           
            //var temp = from rr in db.RarRices
            //           //from tr in db.Transaction
            //           //from pr in db.Pricing
            //           join tr_op in db.Transaction on rr.RawRice_id equals tr_op.Transaction_item_id
            //           join pr_po in db.Pricing on rr.RawRice_id equals pr_po.item_id
            //           where rr.Party_Id == Party_Id && tr_op.Transaction_item_type == "RawRice" && pr_po.item_Type == "RawRice"
            //           select new { rr, tr_op, pr_po };
           
           

            //var RawRice = db.RarRices.Where(m => m.Party_Id == Party_Id /*&& m.pricing.Pricing_NetTotal != m.transaction. */&& m.Status).ToList();
            return Json(jsonret.ToList(), JsonRequestBehavior.AllowGet);           
        }
    }
}