using online_mobile_recharge.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace online_mobile_recharge.Controllers
{
    public class UserController : Controller
    {
        rechargefunctionsEntities1 db = new rechargefunctionsEntities1();
        // GET: User
        static int usercount = 0;
        
        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(loginfo l,roletable r,userlogin u)
        {
            if (ModelState.IsValid)
            {
               
                    var username = db.loginfo.Where(a => a.username == l.username).FirstOrDefault();
                    if (username == null)
                    {

                        l.Balance = 0;
                        db.loginfo.Add(l);

                        db.SaveChanges();

                    ViewBag.balance = l.Balance;
                    ViewBag.usercount = usercount += 1;
                    ViewBag.msg = "USER REGISTERED SUCCESSFULLY";
                    ViewBag.mpin = l.mpin;
                    ViewBag.user = l.Account_No;
                        r.user_id = l.Account_No;
                        r.Role = "User";
                        db.roletable.Add(r);
                        db.SaveChanges();



                        

                    }
                    else
                    {
                    ViewBag.du = "This username is already exists";
                    }
                

















            }
         
           
            return View();
        }

        public ActionResult Loginpage()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Loginpage(userlogin u, string ReturnUrl)
        {


            if(u.username=="Admin" && u.password == "Admin")
            {
                return RedirectToAction("Index", "Admin");
            }
            if (ModelState.IsValid)
            {
                var user = db.loginfo.Where(x => x.username == u.username && x.password == u.password).FirstOrDefault();

                if (user != null)
                {

                    FormsAuthentication.SetAuthCookie(u.username, false);
                    Session["uname"] = u.username.ToString();
                    Session["ID"] = user.Account_No;
                    Session["balance"] = user.Balance;
                    Session["pass"] = user.password;
                    Session["mpin"] = user.mpin;
                    if (ReturnUrl != null)
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return Redirect("/Home/Index");
                    }
                }
                else
                {
                    ViewBag.ERROR = "USERNAME AND PASSWORD INVALID ";
                }
            }
            else
            {
                ViewBag.empty = "All Fields Required";
            }
            return View();
        }
       



       
        [Authorize(Roles = "User")]
        public ActionResult POSTPAID_BILLS()
        {
            var data = db.offer.ToList();
            return View(data);
        }
        public ActionResult Edit(string id)
        {
            var data = db.offer.Where(a => a.offercode == id ).FirstOrDefault();
            return View(data);

        }
        [HttpPost]
        public ActionResult Edit(offer o, transaction_table t,loginfo l)
        {
            if (ModelState.IsValid)
            {

                t.Transaction_Name = "POSTPAIDBILL";
                t.Type = "Postpaid";
                t.time = System.DateTime.Now.ToShortTimeString();
                t.date = System.DateTime.Now.ToShortDateString();
                t.offer_recharge_consumer_numbers = o.offercode;
                db.transaction_table.Add(t);
                if (db.SaveChanges() > 0)
                {
                    Session["offer"] = "OFFER GET SUCCESSFULLY";
                    o.Account_No = string.Empty;
                    o.amount = string.Empty;
                    o.mpin = string.Empty;
                    db.Entry(o).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    ModelState.Clear();


                    l.Balance = l.Balance - t.amount;
                    db.Entry(l).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();

                    







                }
            }
            else
            {

                Session["BILL"] = "*ALL FIELDS MUST FILLED";
            }
            return View();
        }
        [Authorize(Roles = "User")]
        public ActionResult CALLERTUNE()
        {
            var tune = db.CallerTune.ToList();
            return View(tune);
        }
        [Authorize(Roles = "User")]
        public ActionResult ACTIVATE(string ID)
        {
            var data = db.CallerTune.Where(a => a.TUNE_CODE == ID).FirstOrDefault();
            return View(data);
          
        }
        [HttpPost]
        public ActionResult ACTIVATE(CallerTune c , transaction_table t)
        {
            if (ModelState.IsValid)
            {
                t.paymentmethod = c.payment_method; 
                t.Transaction_Name = "CALLERTUNE";
                t.Type = "SONGS";
                t.time = System.DateTime.Now.ToShortTimeString();
                t.date = System.DateTime.Now.ToShortDateString();
                t.offer_recharge_consumer_numbers = c.TUNE_CODE;
                db.transaction_table.Add(t);
                if (db.SaveChanges() > 0)
                {

                    c.payment_method = string.Empty;
                    c.amount = string.Empty;
                    c.Account_No = string.Empty;
                    db.Entry(c).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    ModelState.Clear();
                    Session["TUNE"] = "CALLER TUNE SUCCESSFULLY ACTIVATED";
                    return View();
                }
            }
            else
            {

                Session["CALLER"] = "*ALL FIELDS MUST FILLED";
            }
            return View();
            
        }

        [Authorize(Roles = "User")]
        public ActionResult Moneytransfer()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Moneytransfer(transaction_table t)
        {
            if (ModelState.IsValid)
            {





                t.Transaction_Name = "MONEYTRANSFER";
                t.Type = "BY CNIC";
                t.time = System.DateTime.Now.ToShortTimeString();
                t.date = System.DateTime.Now.ToShortDateString();
                db.transaction_table.Add(t);





                if (db.SaveChanges() > 0)
                {

                    Session["money"] = "MONEY TRANSFER SUCESSFULLY";

                    return View();

                }



            }
            else
            {

                Session["TRANSFER"] = "*ALL FIELDS MUST FILLED";
            }
            return View();
        }

        [Authorize(Roles = "User")]
        public ActionResult Viewoffers()
        {
            var data = db.offers.ToList();
            return View(data);
        }
        [Authorize(Roles = "User")]

        public ActionResult Editoffers(int id)
        {
            var data = db.offers.Where(a => a.ID == id).FirstOrDefault();
            return View(data);

        }
        [HttpPost]
        public ActionResult Editoffers(offers o, transaction_table t)
        {
            if (ModelState.IsValid)
            {




                t.mpin = "1122";
                t.operators_ = o.Network;

                t.Transaction_Name = "Special Offers";
                t.Type = o.Network;
                t.time = System.DateTime.Now.ToShortTimeString();
                t.date = System.DateTime.Now.ToShortDateString();
                t.offer_recharge_consumer_numbers = o.Reciever_Mobile_No;
           
                t.paymentmethod = o.Payment_Methods;
                db.transaction_table.Add(t);
               if (db.SaveChanges() > 0)
                {
                    o.Transaction_name = string.Empty;
                    o.Type = o.Network;
                    o.Payment_Methods = string.Empty;
                    o.amount = string.Empty;
                    o.Reciever_Mobile_No = string.Empty;
                    o.account_no = string.Empty;

                    db.Entry(o).State = System.Data.Entity.EntityState.Modified;
                 
                    db.SaveChanges();
                    ModelState.Clear();
                    Session["offers"]= "OFFER GETTED SUCCESSFULLY";
                }


            }
            else
            {

                Session["OFF"] = "*ALL FIELDS MUST FILLED";
            }
            return View();
        }



    


                
            
        
           
        





        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["uname"] = null;
            return Redirect("LoginPage");
        }
    }
}