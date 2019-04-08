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

        public void bindcat()
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
        }
        public ActionResult categories()
        {
            bindcat();
            return View();
        }
        [HttpPost]
        public ActionResult categories(FormCollection fc)
        {
            try
            {
                var catname = fc["catname"];

                var p = dc.tblcats.Where(c => c.cat_name == catname).ToList().Count();

                if (p == 1)
                {
                    ViewBag.msg = "This Category is Already Exits ";
                  
                }
                else
                {

                    tblcat obj = new tblcat();
                    obj.cat_name = fc["catname"];
                    dc.tblcats.Add(obj);
                    dc.SaveChanges();
                    ViewBag.msg = "Category Added Successfully ..";
                }
               


            }
            catch(Exception ex)
            {

                ViewBag.msg = "Not Inserted.";
            }
            bindcat();
            return View();
        }
        [HttpPost]
        public ActionResult subcat(FormCollection fc)
        {
             try
            {
                var subcat_name = fc["subcatname"];
                var cat_id = fc["cat_id"];
                tblsubcat obj = new tblsubcat();
                obj.subcat_name = subcat_name;
                obj.cat_id = int.Parse(cat_id);
                dc.SaveChanges();
                ViewBag.msg = "Successfully...";

            }
            catch(Exception ex)
            {
                ViewBag.msg = "fail to Insert";

            }


            return RedirectToAction("categories");
        }
        public ActionResult displaycategory()
        {
            return View(dc.tblcats.ToList());
        }
    }
}