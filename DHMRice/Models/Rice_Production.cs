using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DHMRice.Models
{
    public class Rice_Production
    {
        [Key]
        public int Rice_Production_id { get; set; }

        public String Rice_Production_name { get; set; }

        public int Packing_Id { get; set; }
        public virtual Packing packing { get; set; }

        public decimal Rice_Production_TotalRate { get; set; }

        public int Rice_Production_TotalBags { get; set; }

        public int Rice_Production_Bags { get; set; }

        public decimal Rice_Production_TotalWieght { get; set; }

        public decimal Rice_Production_Average { get; set; }

        public decimal Rice_Production_TotalWorth { get; set; }

        public decimal Rice_Production_ShortFall_total { get; set; }

        public decimal Rice_Production_TotalExpense { get; set; }

        public decimal Rice_Production_StockWorth { get; set; }

        public decimal Rice_Production_TotalByProductWorth { get; set; }

        public decimal FactoryCost { get; set; }

        public decimal Rice_Production_perBagPrice { get; set; }

        public decimal MarketPrice { get; set; }

       

    }
}