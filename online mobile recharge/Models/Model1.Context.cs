﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class rechargefunctionsEntities1 : DbContext
    {
        public rechargefunctionsEntities1()
            : base("name=rechargefunctionsEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<adminreplay> adminreplay { get; set; }
        public virtual DbSet<CallerTune> CallerTune { get; set; }
        public virtual DbSet<cash_deposit> cash_deposit { get; set; }
        public virtual DbSet<contactus> contactus { get; set; }
        public virtual DbSet<feedback> feedback { get; set; }
        public virtual DbSet<loginfo> loginfo { get; set; }
        public virtual DbSet<offer> offer { get; set; }
        public virtual DbSet<offers> offers { get; set; }
        public virtual DbSet<roletable> roletable { get; set; }
        public virtual DbSet<transaction_table> transaction_table { get; set; }
        public virtual DbSet<userlogin> userlogin { get; set; }
    }
}