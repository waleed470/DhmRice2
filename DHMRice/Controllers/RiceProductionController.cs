using DHMRice.Models;
using DHMRice.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DHMRice.Controllers
{
    public class RiceProductionController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        // GET: RiceProduction
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddNew()
        {

            ViewBag.Party_Id = new SelectList(db.Parties.Where(m => m.Status == true).ToList(), "Party_Id", "Party_Name");

            ViewBag.RawRice_id = new SelectList(db.RarRices.Where(m => m.Status == true).ToList(), "RawRice_id", "Item_Name");

            var Pricing = db.Pricing.Where(m => m.Status == true).ToList();

            var RawRice = db.RarRices.Where(m => m.Status == true).ToList();

            ViewBag.Rice_category_Id = new SelectList(db.Rice_Categories.Where(m => m.Status == true).ToList(), "Rice_category_Id", "Rice_Category_Name");

            ViewBag.Packing_Id = new SelectList(db.Packings.ToList(), "Packing_Id", "Packing_Type");

            var viewModel = new ProductionViewModel
            {
                RawRices = RawRice,
                Pricings = Pricing
               
            };
            return View(viewModel);
        }

        public JsonResult GetRice()
        {
            var list = db.RarRices.Where(c => c.Status == true).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetProductData(string RawRice_id)
        {
            if(RawRice_id == "null")
            {
                return Json(new { success = false });

            }
            int riceid = Convert.ToInt32(RawRice_id);
            RawRice product = db.RarRices.Find(riceid);
            Packing packing = db.Packings.Find(product.Packing_Id);
            var rate = db.Pricing.Where(m => m.item_id == riceid).SingleOrDefault();
            
            
            if (product != null)
            {
                return Json(new { success = true, Bags_qty = product.Bags_qty, Packing_Id = packing.Packing_Type, PerBagPrice = rate.PerBagPrice });
            }
            
            return Json(new { success = false });

        }
    }
}