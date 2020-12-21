//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace online_mobile_recharge.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class loginfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public loginfo()
        {
            this.adminreplay = new HashSet<adminreplay>();
            this.cash_deposit = new HashSet<cash_deposit>();
            this.roletable = new HashSet<roletable>();
            this.userlogin = new HashSet<userlogin>();
        }
    
        public string username { get; set; }
        public string Account_No { get; set; }
        public string Email { get; set; }
        [DataType(DataType.Password)]
        public string password { get; set; }
        [DataType(DataType.Password)]
        public string confirm_password { get; set; }
        public string Address { get; set; }
        [DataType(DataType.Password)]
        public string mpin { get; set; }
        public string image_locations { get; set; }
        public Nullable<int> Balance { get; set; }
        public string Transaction_Name { get; set; }
        public string Type { get; set; }
        [DataType(DataType.Password)]
        public string mpincheck { get; set; }
        public Nullable<int> amount { get; set; }
        public string date { get; set; }
        public string time { get; set; }
        public string offer_recharge_consumer_numbers { get; set; }
        public string paymentmethod { get; set; }
        public string operators { get; set; }
        public string accountno { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<adminreplay> adminreplay { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cash_deposit> cash_deposit { get; set; }
        public virtual loginfo loginfo1 { get; set; }
        public virtual loginfo loginfo2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<roletable> roletable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<userlogin> userlogin { get; set; }
    }
}
