using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvcshopping.EDM;

namespace mvcshopping.Controllers
{

    public class MainController : Controller
    {

        shoppingdbEntities dc = new shoppingdbEntities();
        // GET: Main
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(tbladmin obj)
        {
            var p = dc.tbladmins.Where(c => c.username == obj.username && c.password == obj.password).ToList();

            if(p.Count == 1)
            {
                Session["adminid"] = p.FirstOrDefault().id;
      
                return RedirectToAction("Dashboard", "Admin");

            }
            else
            {

                ViewBag.msg = "Invalid User Name Or Password";
            }

            return View();

        }
    }
}