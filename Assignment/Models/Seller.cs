//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assignment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Seller
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Seller()
        {
            this.Products = new HashSet<Product>();
        }
    
        public string Seller_ID { get; set; }
        public string Seller_Name { get; set; }
        public string Seller_Phone { get; set; }
        public string Seller_Email { get; set; }
        public string Seller_IC { get; set; }
        public Nullable<double> Seller_Rate { get; set; }
        public string Seller_Gender { get; set; }
        public string Seller_Pass { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
    }
}
