﻿using System;
using System.Collections.Generic;

#nullable disable

namespace AA_2.Models
{
    public partial class Payment
    {
        public int CustomerNumber { get; set; }
        public string CheckNumber { get; set; }
        public DateTime PaymentDate { get; set; }
        public double Amount { get; set; }
    }
}
