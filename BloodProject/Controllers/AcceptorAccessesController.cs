using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BloodProject.Models;

namespace BloodProject.Controllers
{
    public class AcceptorAccessesController : Controller
    {
        private BloodDatabaseEntities db = new BloodDatabaseEntities();

        // GET: AcceptorAccesses
        public ActionResult Index()
        {
            return View(db.AcceptorAccesses.ToList());
        }

        // GET: AcceptorAccesses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AcceptorAccess acceptorAccess = db.AcceptorAccesses.Find(id);
            if (acceptorAccess == null)
            {
                return HttpNotFound();
            }
            return View(acceptorAccess);
        }

        // GET: AcceptorAccesses/Create
        public ActionResult Create(string donid)
        {
            AcceptorAccess acc = new Models.AcceptorAccess() { DonorId = Convert.ToInt32(donid) };

            //check cokie
            if (Request.Cookies["bloodAcc"]!=null)
            {
               string id = Request.Cookies["bloodAcc"].Value;
                int x;
                if (int.TryParse(id, out x))
                {
                    AcceptorAccess DBacc = db.AcceptorAccesses.Find(x);
                    if (DBacc != null)
                    {
                        acc.name = DBacc.name;
                        acc.phone = DBacc.phone;
                    }
                }
            }

         
           

            return PartialView("Create",acc);
        }

        // POST: AcceptorAccesses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,DonorId,name,phone,accesscount")] AcceptorAccess acceptorAccess)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    int? sum= (from od in db.AcceptorAccesses
                                         where od.phone == acceptorAccess.phone
                                         select od.accesscount).Sum();
                    if (sum+1>20)
                    {
                        return Content("<h2> You have exceeded the Access limit! </h2>");

                    }
                }
                catch (Exception)
                {
                }


                AcceptorAccess acc = db.AcceptorAccesses.Where(a => a.phone == acceptorAccess.phone&&a.DonorId==acceptorAccess.DonorId).FirstOrDefault();
                int accid = 0;
                if (acc!=null)
                {
                  

                    acc.accesscount += 1;
                    db.Entry(acc).State = EntityState.Modified;
                    db.SaveChanges();

                    accid = acc.id;
                }
                else
                {
                    acceptorAccess.accesscount = 0;
                    db.AcceptorAccesses.Add(acceptorAccess);
                    db.SaveChanges();
                    accid = acceptorAccess.id;
                }



                Donation donation = db.Donations.Find(acceptorAccess.DonorId);
                Response.Cookies.Add(CreateStudentCookie(accid));

             return PartialView("~/Views/Donations/Details.cshtml", donation);

            }
            return PartialView("Create", new AcceptorAccess() { DonorId = acceptorAccess.DonorId });
          //  return View();
        }


        private HttpCookie CreateStudentCookie(int id)
        {
            HttpCookie bloodAcc = new HttpCookie("bloodAcc");
            bloodAcc.Value = id.ToString();
            bloodAcc.Expires = DateTime.Now.AddHours(1);
            return bloodAcc;

        }
        //some action method
        // GET: AcceptorAccesses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AcceptorAccess acceptorAccess = db.AcceptorAccesses.Find(id);
            if (acceptorAccess == null)
            {
                return HttpNotFound();
            }
            return View(acceptorAccess);
        }

        // POST: AcceptorAccesses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,DonorId,name,phone,accesscount")] AcceptorAccess acceptorAccess)
        {
            if (ModelState.IsValid)
            {
                db.Entry(acceptorAccess).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(acceptorAccess);
        }

        // GET: AcceptorAccesses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AcceptorAccess acceptorAccess = db.AcceptorAccesses.Find(id);
            if (acceptorAccess == null)
            {
                return HttpNotFound();
            }
            return View(acceptorAccess);
        }

        // POST: AcceptorAccesses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AcceptorAccess acceptorAccess = db.AcceptorAccesses.Find(id);
            db.AcceptorAccesses.Remove(acceptorAccess);
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
