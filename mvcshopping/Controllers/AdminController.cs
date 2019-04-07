using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvcshopping.EDM;

namespace mvcshopping.Controllers
{
    
    public class AdminController : Controller
    {
        shoppingdbEntities dc = new shoppingdbEntities();
        // GET: Admin
        public ActionResult Dashboard()
        {

            return View();
        }
        public ActionResult categories()
        {

            var p = dc.tblcats.ToList();
            List<SelectListItem> catlist = new List<SelectListItem>();

            foreach (var item in p)
            {
                SelectListItem obj = new SelectListItem();
                obj.Text = item.cat_name;
                obj.Value = item.cat_id.ToString();
               
                catlist.Add(obj);

            }

            ViewData["temp"] = catlist;
            return View();


        }
        [HttpPost]
        public ActionResult categories(FormCollection fc)
        {
            try
            {
                tblcat obj = new tblcat();
                obj.cat_name = fc["catname"];
                dc.tblcats.Add(obj);
                dc.SaveChanges();
                ViewBag.msg = "Category Added Successfully ..";
            }
            catch(Exception ex)
            {

                ViewBag.msg = "Not Inserted";
            }
            return View();
        }
        [HttpPost]
        public ActionResult subcat(FormCollection fc)
        {
            ViewBag.msg = "Not Inserted";
            return View();
        }
    }
}