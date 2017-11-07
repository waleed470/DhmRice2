﻿using System;
using DHMRice.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DHMRice.ViewModels
{
    public class ProductionViewModel
    {
        public IEnumerable<RawRice> RawRices { get; set; }
        public IEnumerable<Pricing> Pricings { get; set; }
       
    }
}