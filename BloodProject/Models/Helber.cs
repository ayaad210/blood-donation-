using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodProject.Models
{
    public static class Helber
    {


        public  static bool isllowedfor(this BloodType th, int id)
        {

            BloodType b = new BloodDatabaseEntities().BloodTypes.Find(Convert.ToInt32(id));
            if (b != null)
            {
                if (b.BloodTypes1.Where(t => t.id == th.id).Count() > 0)
                {
                    return true;
                }
            }

            return false;
        }
    }
}