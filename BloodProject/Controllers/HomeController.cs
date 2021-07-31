using BloodProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BloodProject.Controllers
{
    public class HomeController : Controller
    {
        private BloodDatabaseEntities db = new BloodDatabaseEntities();

        // GET: Home

        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User acc)
        {
            Clearsession();
            var list = db.Users.Where(u => u.username == acc.username && u.password == acc.password); ;
            if (list.Count()> 0)
            {
                session(list.FirstOrDefault().id);
                return RedirectToAction("index","Donations",null);

            }
            acc.password = "";
            return View(acc);
        }
        public ActionResult Logout()
        {
            Clearsession();
            return RedirectToAction("index");
        }

        public void session(int id)
        {         
                Session["user"] = id;
        }
        public void Clearsession()
        {
            Session["user"] = null;
        }

    }
}
