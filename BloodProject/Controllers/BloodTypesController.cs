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
    public class BloodTypesController : Controller
    {
        private BloodDatabaseEntities db = new BloodDatabaseEntities();

        // GET: BloodTypes
        public ActionResult Index()
        {
            return View(db.BloodTypes.ToList());
        }

        // GET: BloodTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodType bloodType = db.BloodTypes.Find(id);
            if (bloodType == null)
            {
                return HttpNotFound();
            }
            return View(bloodType);
        }

        // GET: BloodTypes/Create
        public ActionResult Create()
        {
            return View();
        }
        // POST: BloodTypes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name")] BloodType bloodType)
        {
            if (ModelState.IsValid)
            {
                db.BloodTypes.Add(bloodType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bloodType);
        }

        // GET: BloodTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodType bloodType = db.BloodTypes.Find(id);
            if (bloodType == null)
            {
                return HttpNotFound();
            }
            return View(bloodType);
        }
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name")] BloodType bloodType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bloodType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bloodType);
        }

        // GET: BloodTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodType bloodType = db.BloodTypes.Find(id);
            if (bloodType == null)
            {
                return HttpNotFound();
            }
            return View(bloodType);
        }

        // POST: BloodTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BloodType bloodType = db.BloodTypes.Find(id);
            db.BloodTypes.Remove(bloodType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public PartialViewResult AllowedBloodTypes(string bloodid)
        {
           var model= db.BloodTypes.ToList();
            ViewBag.bloodtypeid_ = bloodid;
            return PartialView("AowedBloodTypes",model);
        }
        [HttpPost]
        public PartialViewResult AllowBloodTypes(List<string> ids, string BloodTypeid)
        {
            int x;
            if (int.TryParse(BloodTypeid, out x))
            {
                BloodType bloodType = db.BloodTypes.Find(x);
                if (bloodType != null)
                {
                    bloodType.BloodTypes1.Clear();
                    if (ids != null)
                    {
                        foreach (var item in ids)
                        {
                            try
                            {
                                bloodType.BloodTypes1.Add(db.BloodTypes.Find(Convert.ToInt32(item)));
                            }
                            catch (Exception)
                            {
                                continue;
                            }
                        }
                    }
                    db.SaveChanges();

                }
            }

            return AllowedBloodTypes(BloodTypeid);
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
