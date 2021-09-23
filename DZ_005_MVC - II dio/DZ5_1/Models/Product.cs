using System;
using System.Collections.Generic;

#nullable disable

namespace DZ5_1.Models
{
    public partial class Product
    {
        public Product()
        {
            Orderdetails = new HashSet<Orderdetail>();
        }

        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public string ProductLine { get; set; }
        public string ProductScale { get; set; }
        public string ProductVendor { get; set; }
        public string ProductDescription { get; set; }
        public short QuantityInStock { get; set; }
        public double BuyPrice { get; set; }
        public double Msrp { get; set; }

        public virtual ICollection<Orderdetail> Orderdetails { get; set; }
    }
}
