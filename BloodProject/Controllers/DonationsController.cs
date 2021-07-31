using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BloodProject.Models;
using System.Text;

namespace BloodProject.Controllers
{
    public class DonationsController : Controller
    {
        private BloodDatabaseEntities db = new BloodDatabaseEntities();

        // GET: Donations
        public ActionResult Index()
        {
            return View(db.Donations.ToList());
        }
        public ActionResult DonationListView()
        {
            ViewBag.Places = new SelectList(db.Places.ToList(), "ID", "Name");
            ViewBag.BloodTypes = new SelectList(db.BloodTypes.ToList(), "ID", "Name");

            return View(new List<Donation>());
        }
        public PartialViewResult Search(string place,string Bloodtype)
        {
            List<Donation> model = new List<Donation>();


            
            try
            {
                BloodType b = db.BloodTypes.Find(Convert.ToInt32(Bloodtype));
            //    var list = (from bl in b.BloodTypes1
                                   
                //         select new  { bl.id } ).ToList();
                //var x = new { id = Convert.ToInt32(Bloodtype) };

                foreach (var item in b.BloodTypes1)
                {
                    if (place!="")
                    {
                        model.AddRange(db.Donations.Where(d => d.BloodType == item.id && d.place.ToString() == place).ToList());

                    }
                    else
                    {
                        model.AddRange(db.Donations.Where(d => d.BloodType == item.id ).ToList());

                    }
                }

            }
            catch (Exception )
            {

            }
            return PartialView("DonationPartial", model);

        }
 

        // GET: Donations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation donation = db.Donations.Find(id);
            if (donation == null)
            {
                return HttpNotFound();
            }
            return View(donation);
        }

        // GET: Donations/Create
        public ActionResult Create()
        {

            ViewBag.Places = new SelectList(db.Places.ToList(), "ID", "Name");
            ViewBag.BloodTypes = new SelectList(db.BloodTypes.ToList(), "ID", "Name");

            return View();
        }

        // POST: Donations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,place,address,BloodType,gender,phone,Email,LastDon,isFree")] Donation donation)
        {
            if (ModelState.IsValid)
            {

                string sb = "x";

                if (donation.LastDon != null)
                {

                    DateTime date = (DateTime)donation.LastDon;
                    //     sb.AppendLine("Thank You For Donation");
                    int varuance = ((DateTime.Now.Year - date.Year) * 12) + DateTime.Now.Month - date.Month;
                    if (varuance < 3)
                    {
                        //sb.AppendLine("You must wait three months between donations, ");
                        //sb.AppendLine("you have about " + varuance + "months left for the next donation ");
                        sb = (3 - varuance).ToString();
                    }
                }



                if (donation.Email == null||donation.Email=="")
                {
                    donation.Email = "Not Set";
                }
                if (donation.LastDon == null)
                {
                    donation.LastDon = DateTime.Now.Date;
                }
                db.Donations.Add(donation);
                db.SaveChanges();
              

                return RedirectToAction("Index", "Home", new { mes = sb.ToString() });
            }

            return View(donation);
        }

        // GET: Donations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation donation = db.Donations.Find(id);
            if (donation == null)
            {
                return HttpNotFound();
            }
            return View(donation);
        }

        // POST: Donations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,place,address,BloodType,gender,phone,Email,LastDon,isFree")] Donation donation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(donation);
        }

        // GET: Donations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation donation = db.Donations.Find(id);
            if (donation == null)
            {
                return HttpNotFound();
            }
            
            return View(donation);
        }

        // POST: Donations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            Donation donation = db.Donations.Find(id);
            donation.AcceptorAccesses.Clear();
            db.SaveChanges();
            db.Donations.Remove(donation);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
