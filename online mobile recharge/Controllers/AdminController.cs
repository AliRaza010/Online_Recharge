using online_mobile_recharge.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace online_mobile_recharge.Controllers
{
    public class AdminController : Controller
    {
        rechargefunctionsEntities1 db = new rechargefunctionsEntities1();
        // GET: Admin
        public ActionResult Index()
        {
            Session["total user"] = db.loginfo.Count();
            Session["transaction total amount "] = db.transaction_table.Count();
            Session["total user balance"] = db.loginfo.Count();
            return View();
        }
        public ActionResult VIEWUSER()
        {
            Session["total user"] = db.loginfo.Count();
            var data = db.loginfo.ToList();
            @Session["usercount"] = null;
            return View(data);
        }
        public ActionResult ViewTransactionHistory()
        {
            Session["total"]=db.transaction_table.Count();

            return View(db.transaction_table.ToList());
        }
     
        public JsonResult GetSearchingData(string SearchBy, string SearchValue)
        {
            List<transaction_table> StuList = new List<transaction_table>();
            if (SearchBy == "Account_No ")
            {
                try
                {
                    string Id = SearchValue;
                    StuList = db.transaction_table.Where(x => x.Account_No == Id || SearchValue == null).ToList();
                }
                catch (FormatException)
                {
                    Console.WriteLine("{0} Is Not A ID ", SearchValue);
                }
                return Json(StuList, JsonRequestBehavior.AllowGet);
            }
            else if (SearchBy == "date")
            {
                try
                {
                    string DATE = SearchValue;
                    StuList = db.transaction_table.Where(x => x.date == DATE || SearchValue == null).ToList();
                }
                catch (FormatException)
                {
                    Console.WriteLine("{0} Is Not A ID ", SearchValue);
                }
                return Json(StuList, JsonRequestBehavior.AllowGet);
            }

            else
            {
                StuList = db.transaction_table.Where(x => x.Transaction_Name.StartsWith(SearchValue) || SearchValue == null).ToList();
                return Json(StuList, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult inbox()
        {
            var data = db.contactus.OrderByDescending(a=>a.id).ToList();
            @Session["count"] = null;
            return View(data);
        }
        public ActionResult VIEWFEEDBACK()
        {

            var data = db.feedback.OrderByDescending(a => a.id).ToList();
            @Session["feedbackcount"] = null;
            return View(data);
        }
        public ActionResult REPLAY(int id)
        {
            var data = db.contactus.Where(a => a.id == id).FirstOrDefault();
                
            return View(data);
        }
        [HttpPost]
        public ActionResult REPLAY(adminreplay ar, contactus c)
        {

           
            ar.sender = "ADMIN";
            db.Entry(c).State = System.Data.Entity.EntityState.Modified;
            c.replay = string.Empty;
            db.SaveChanges();
            ar.sender = "ADMIN";
            ar.accountno = c.PHONE;

            db.adminreplay.Add(ar);
            if (db.SaveChanges() > 0)
            {
                Session["replay"] = "REPLAY DELIEVERED";
                ModelState.Clear();
                
            }

            return View();
        }
        public ActionResult AddOffers()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Addoffers(offers o)
        {
      

            if (ModelState.IsValid)
            {
                db.offers.Add(o);
                db.SaveChanges();
                Session["offer"] = "OFFERS added Suceesfully";
                ModelState.Clear();
                return View();
            }



            return View();
        }

   

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loginfo loginfo = db.loginfo.Find(id);
            if (loginfo == null)
            {
                return HttpNotFound();
            }
            return View(loginfo);
        }

     



    }
}