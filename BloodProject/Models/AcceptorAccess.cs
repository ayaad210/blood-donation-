//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BloodProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class AcceptorAccess
    {
        public int id { get; set; }
        public int DonorId { get; set; }
        public string name { get; set; }
        public string phone { get; set; }
        public Nullable<int> accesscount { get; set; }
    
        public virtual Donation Donation { get; set; }
    }
}
