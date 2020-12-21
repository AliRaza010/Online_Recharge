using online_mobile_recharge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace online_mobile_recharge.Controllers
{
    public class HomeController : Controller
    {
        rechargefunctionsEntities1 db = new rechargefunctionsEntities1();
        static int count = 0;
        static int feedbackcount = 0;
      
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = "User")]
        public ActionResult Deposit(string id)
        {
            var data = db.loginfo.Where(a => a.Account_No == id).FirstOrDefault();
            return View(data);
        }
        [HttpPost]
        public ActionResult Deposit(loginfo l, transaction_table t)
        {


            if (ModelState.IsValid)
            {


                t.Account_No = l.accountno;
                t.offer_recharge_consumer_numbers = l.accountno;
                t.operators_ = "DEPOSIT THROUGH RECHARE.CO";
                t.Transaction_Name = "Cash Depost";
                t.Type = "Deposit";
                t.time = System.DateTime.Now.ToShortTimeString();
                t.date = System.DateTime.Now.ToShortDateString();
                db.transaction_table.Add(t);
                if (db.SaveChanges() > 0)
                {
                   
                    l.password = l.password;
                    l.confirm_password = l.confirm_password;
                    l.mpin = l.mpin;
                    Session["deposit"] = "depost successfully";
                    l.Balance = l.amount + l.Balance;
                    db.Entry(l).State = System.Data.Entity.EntityState.Modified;
                    l.amount = null;
                    l.accountno = string.Empty;
                    l.mpincheck = string.Empty;
                    db.SaveChanges();
                    Session["Balance"] = l.Balance;

                }
                else
                {
                    Session["deposit"] = null;
                }


            }
         






            return View();
        }
        [Authorize(Roles = "User")]

        public ActionResult onlinerecharge(string id)
        {
            var data = db.loginfo.Where(a => a.Account_No == id).FirstOrDefault();
            return View(data);
        }
        [HttpPost]
        public ActionResult onlinerecharge(loginfo l, transaction_table t)
        {
            Session["RECHARGE"] = null;
            if (ModelState.IsValid)
            {
                if (l.paymentmethod == "RECHARGE.COM")
                {

                    if (l.mpincheck == l.mpin)
                    {



                        if (l.Balance >= l.amount)
                        {
                            l.Balance = l.Balance - l.amount;

                            db.Entry(l).State = System.Data.Entity.EntityState.Modified;
                            l.accountno = t.Account_No;
                            l.amount = null;
                            l.accountno = string.Empty;
                            l.mpincheck = string.Empty;
                            l.offer_recharge_consumer_numbers = string.Empty;

                            if (db.SaveChanges() > 0)
                            {
                                t.operators_ = l.operators;
                                t.Account_No = l.Account_No;
                                t.Transaction_Name = "Online Recharge";
                                t.Type = "Recharge";
                                t.time = System.DateTime.Now.ToShortTimeString();
                                t.date = System.DateTime.Now.ToShortDateString();
                                db.transaction_table.Add(t);
                                db.SaveChanges();
                                Session["RECHARGE"] = "Recharge successfully";
                                Session["PIN"] = null;
                                Session["er"] = null;
                                ModelState.Clear();
                            }

                           
                            Session["Balance"] = l.Balance;

                        }
                        else
                        {
                            Session["er"] = " NOT ENOUGH BALANCE";
                            Session["PIN"] = null;
                            Session["RECHARGE"] = null;
                        }


                    }
                    else
                    {
                        Session["PIN"] = "MPIN IS INVALID";
                        Session["er"] = null;
                        Session["RECHARGE"] = null;
                        return View();
                    }


                }

                else
                {

                    t.Transaction_Name = "Online Recharge";
                    t.Type = "Recharge";
                    t.time = System.DateTime.Now.ToShortTimeString();
                    t.date = System.DateTime.Now.ToShortDateString();
                    db.transaction_table.Add(t);
                    db.SaveChanges();
                    Session["RECHARGE"] = "Recharge successfully";

                }



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
            var data = db.offer.Where(a => a.offercode == id).FirstOrDefault();

            return View(data);

        }
        [HttpPost]
        public ActionResult Edit(offer o, transaction_table t)
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










                }
            }
         
            return View();
        }



        [Authorize(Roles = "User")]
        public ActionResult Moneytransfer(string id)
        {
            var data = db.loginfo.Where(a => a.Account_No == id).FirstOrDefault();
            return View(data);

        }
        [HttpPost]
        public ActionResult Moneytransfer(transaction_table t,loginfo l)
        {
            Session["MONEY"] = null;

            if (ModelState.IsValid) {

                if (l.paymentmethod == "RECHARGE.COM")
                {
                    if (l.mpincheck == l.mpin)
                    {



                        if (l.Balance >= l.amount)
                        {
                            l.Balance = l.Balance - l.amount;
                            l.accountno = t.Account_No;
                            db.Entry(l).State = System.Data.Entity.EntityState.Modified;
                            l.amount = null;
                            l.accountno = string.Empty;
                            l.mpincheck = string.Empty;
                            l.offer_recharge_consumer_numbers = string.Empty;

                            if (db.SaveChanges() > 0)
                            {
                              
                                t.Account_No = l.Account_No;
                                t.Transaction_Name = "MONEY TRANSFER";
                                t.Type = "BY CNIC";
                                t.time = System.DateTime.Now.ToShortTimeString();
                                t.date = System.DateTime.Now.ToShortDateString();
                                db.transaction_table.Add(t);
                                db.SaveChanges();
                                Session["MONEY"] = "MONEY TRANSFER SUCCESSFULLY";
                                Session["PIN"] = null;
                                Session["ER"] = null;

                                ModelState.Clear();
                            }
                            Session["Balance"] = l.Balance;

                        }
                        else
                        {
                            Session["ER"] = " NOT ENOUGH BALANCE";
                            Session["MONEY"] = null;
                            Session["PIN"] = null;
                        }


                    }
                    else
                    {
                        Session["PIN"] = "MPIN IS INVALID";
                        Session["ER"] = null;
                        Session["MONEY"] = null;
                        return View();
                    }


                }

                else
                {
                    t.Account_No = l.Account_No;
                    t.Transaction_Name = "MONEY TRANSFER";
                    t.Type = "BY CNIC";
                    t.time = System.DateTime.Now.ToShortTimeString();
                    t.date = System.DateTime.Now.ToShortDateString();
                    db.transaction_table.Add(t);
                    db.SaveChanges();
                    Session["MONEY"] = "MONEY TRANSFER SUCCESSFULLY";

                }






























            }
            else
            {

                Session["TRANSFER"] = "*ALL FIELDS MUST FILLED";
            }
            return View();
        }


        public ActionResult CustomerCare()
        {
            return View();
        }


        public ActionResult AboutUs()
        {
            return View();
        }

        public ActionResult Feedbackpage()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Feedbackpage(feedback f)
        {
            if (ModelState.IsValid)
            {
                db.feedback.Add(f);
                if (db.SaveChanges() > 0)
                {
                   
                    Session["feedbackcount"] = feedbackcount += 1;
                    ModelState.Clear();
                    return Json("FEEDBACK SUBMITED SUCCESSFULLY");
                   
                    
                }

            }
            else
            {

                return Json(" All Field Must Fill");
            }
            return View();
        }
        public ActionResult ContactUs()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ContactUs(contactus c)
        {
            if (ModelState.IsValid)
            {
                
                db.contactus.Add(c);
                 db.SaveChanges();
                
                    ModelState.Clear();
                    Session["count"] = count += 1;
                    return Json( "Message send successfully");
                    
                

                
               

            }
            else 
            {
                
                return Json(" All Field Must Fill");
            }
          
        }
        public ActionResult INBOX(adminreplay ar, string id)
        {
            List<adminreplay> StuList = new List<adminreplay>();
            
               
            

            return View(StuList = db.adminreplay.Where(x => x.accountno == id).OrderByDescending(a => a.id).ToList());
        }
        public ActionResult SiteMap()
        {
            return View();
        }








    }

}