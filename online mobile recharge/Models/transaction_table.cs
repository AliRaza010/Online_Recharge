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
    
    public partial class transaction_table
    {
        public int Transaction_id { get; set; }
        public string Transaction_Name { get; set; }
        public string Type { get; set; }
        public string Account_No { get; set; }
        public string mpin { get; set; }
        public Nullable<int> amount { get; set; }
        public string date { get; set; }
        public string time { get; set; }
        public string offer_recharge_consumer_numbers { get; set; }
        public string paymentmethod { get; set; }
        public string operators_ { get; set; }
    }
}
