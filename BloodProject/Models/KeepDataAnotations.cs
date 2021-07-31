using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BloodProject.Models
{


    [MetadataType(typeof(donordataanotation))]

    public partial class Donation
    {


    }
    class donordataanotation
    {
   
        [Required]
        public string Name { get; set; }
        [Required]
        public Nullable<int> place { get; set; }
        public string address { get; set; }
        [Required]
        public Nullable<int> BloodType { get; set; }
        [Required]
        public bool gender { get; set; }
        [Required]
        [Phone]
        public string phone { get; set; }
       
        public string Email { get; set; }

        public Nullable<System.DateTime> LastDon { get; set; }
        [Required]
        public Nullable<bool> isFree { get; set; }

    }





    [MetadataType(typeof(dAccdataanotation))]
    public partial class AcceptorAccess
    {
    }
    class dAccdataanotation
    {
       [Required]
        public int DonorId { get; set; }
        [Required]

        public string name { get; set; }
        [Required]
        [Phone]
        public string phone { get; set; }


    }



    [MetadataType(typeof(Noteataanotation))]

    public partial class Note
    {


    }



    class Noteataanotation
    {

        [Required]
        public string text { get; set; }




    }





    [MetadataType(typeof(Placeataanotation))]

    public partial class Place
    {


    }



    class Placeataanotation
    {

        [Required]
        public string Name { get; set; }




    }





    [MetadataType(typeof(Userataanotation))]

    public partial class User
    {


    }



    class Userataanotation
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string password { get; set; }
        [EmailAddress]
        [Required]
        public string username { get; set; }




    }




    [MetadataType(typeof(Bloodtypeataanotation))]

    public partial class BloodType
    {


    }



    class Bloodtypeataanotation
    {
        [Required]
        public string Name { get; set; }
    




    }


    [MetadataType(typeof(Conracttypeataanotation))]

    public partial class Contact
    {


    }
    class Conracttypeataanotation
    {
        [Required]
        [EmailAddress]
        public string Email { get; set;
        }
        [Required]

        public string Name { get; set; }
        [Required]

        public string Message { get; set; }





    }



}