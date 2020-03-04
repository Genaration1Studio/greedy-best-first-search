using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreedyBestFirstSearch
{
    public partial class index : System.Web.UI.Page
    {
        int loop;
        int delay;
        int count;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            greedy();
        }

        protected void btn_Strat_ServerClick(object sender, EventArgs e)
        {
            if(checkSorce())
            {
                imgMap.ImageUrl = "images/City/" + ddl_Source.SelectedValue.ToString() + "/0.png";
                btn_Start.Enabled = false;
                ddl_Source.Enabled = false;
                Timer1.Interval = int.Parse(myRange.Value);
                Timer1.Enabled = true;
                lenghCity();
            }
        }

        protected void btn_Reset_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }

        public void greedy()
        {
            if(Session["loop"] == null)
            {
                Session["loop"] = loop;
            }       
            if(Session["count"]==null)
            {
                count = 1;
                Session["count"] = count;
            }

            loop = int.Parse(Session["loop"].ToString());
            count = int.Parse(Session["count"].ToString());
            if(count <= loop)
            {
                imgMap.ImageUrl = "images/City/" + Session["source"].ToString() + "/" + count + ".png";
                imgGr.ImageUrl = "images/Gp/" + Session["source"].ToString() + "/" + count + ".png";
                //lbl_path.InnerText += " "+;
            }else
            {
                Session.Abandon();
                btn_Start.Enabled = true;
                ddl_Source.Enabled = true;
                Timer1.Enabled = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "success('" + ddl_Source.SelectedItem.Text + "');", true);
            }
            count++;
            Session["count"] = count;
        }

        public void lenghCity()
        {
            Session["source"] = ddl_Source.SelectedValue.ToString();
            string x = Session["source"].ToString();
            switch (x)
            {
                case "a" : Session["loop"] = 4; break;
                case "c" : Session["loop"] = 3; break;
                case "d" : Session["loop"] = 4; break;
                case "e" : Session["loop"] = 4; break;
                case "f" : Session["loop"] = 2; break;
                case "g" : Session["loop"] = 2; break;
                case "h" : Session["loop"] = 3; break;
                case "i" : Session["loop"] = 4; break;
                case "l" : Session["loop"] = 6; break;
                case "m" : Session["loop"] = 5; break;
                case "n" : Session["loop"] = 5; break;
                case "o" : Session["loop"] = 4; break;
                case "p" : Session["loop"] = 2; break;
                case "r" : Session["loop"] = 3; break;
                case "s" : Session["loop"] = 3; break;
                case "t" : Session["loop"] = 7; break;
                case "u" : Session["loop"] = 2; break;
                case "v" : Session["loop"] = 3; break;
                case "z" : Session["loop"] = 5; break;              
            }
        }

        public Boolean checkSorce()
        {
            if(ddl_Source.SelectedIndex != 0)
            {
                return true;
            }else
            {
                ddl_Source.Focus();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "errorSouce('');", true);
                return false;
            }           
        }
    }
}