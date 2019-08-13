﻿using swasobigua.mypages.Models;
using swasobigua.mypages.Services;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace swasobigua.mypages
{
    public partial class tiro : System.Web.UI.Page
    {

        protected static readonly PlayerService playerService = new PlayerService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["user"] == null || Session["user"].ToString() == "")
                {
                    Response.Redirect("login.aspx");
                }
                if (Session["Shot"] == null || Session["Shot"].ToString() == "")
                {
                    Response.Redirect("login.aspx");
                }

                lblUsuario.Text = Session["user"].ToString();
                //create files 
                try
                {
                    var pageAsyncTask = new PageAsyncTask(x => ShotDataAsync(x, Session["Shot"].ToString()));
                    this.RegisterAsyncTask(pageAsyncTask);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Mensaje", "swal('¡Advertencia!', '" + "Error en la carga de datos, por favor vuelva al menú principal." + "', 'error');", true);
                }
                
            }
        }


        protected async Task ShotDataAsync(CancellationToken cancellationToken, string idshot)
        {
            var result = await playerService.GetAllDataShotByPlayerAsync(idshot);

            if (result.HttpResponseStatusCode.Equals(HttpStatusCode.OK))
            {
                shotdata data = result.Value;
                tbxName.Text = data.Player.Name;
                tbxLastname.Text = data.Player.Lastname;
                tbxTrainerName.Text = data.Trainer.Name;
                tbxTrainerLastName.Text = data.Trainer.Lastname;
                var dt = Convert.ToDateTime(data.TimeStamp);
                tbxFecha.Text = dt.ToString("MM/dd/yyyy HH:mm:ss");

                string mu = "'{  \"shotXYZ\": { ";
                string at = mu;
                string pr = mu; //mu - mu;eca. at - antebrazo, pr de pierna
                string contiene = "", contiene2 = contiene, contiene3 = contiene;
                int i = 0, a = 0, p = 0;

               
                #region Metamotions
                foreach (xyzShots ite in data.XyzShots)
                {
                    if (ite.XYZShotPosition.ToUpper().CompareTo("MUÑECA") == 0)
                    {
                        contiene = contiene + "\"" + i.ToString() + "\":{\"x\":\"" + ite.X.ToString() + "\",\"y\":\"" + ite.Y.ToString() + "\",\"z\":\"" + ite.Z.ToString() + "\",\"timeStamp\":\"" + ite.TimeStamp + "\"},";
                        i++;
                    }
                    if (ite.XYZShotPosition.ToUpper().CompareTo("ANTEBRAZO") == 0)
                    {
                        contiene2 = contiene2 + "\"" + a.ToString() + "\":{\"x\":\"" + ite.X.ToString() + "\",\"y\":\"" + ite.Y.ToString() + "\",\"z\":\"" + ite.Z.ToString() + "\",\"timeStamp\":\"" + ite.TimeStamp + "\"},";
                        a++;
                    }
                    if (ite.XYZShotPosition.ToUpper().CompareTo("PIERNA") == 0)
                    {
                        contiene3 = contiene3 + "\"" + p.ToString() + "\":{\"x\":\"" + ite.X.ToString() + "\",\"y\":\"" + ite.Y.ToString() + "\",\"z\":\"" + ite.Z.ToString() + "\",\"timeStamp\":\"" + ite.TimeStamp + "\"},";
                        p++;
                    }
                }
                string axc = "";
                if (i > 0)
                {
                    axc = contiene.Substring(0, contiene.ToCharArray().Length - 1);

                    mu = mu + axc + " } }'";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "mu", "mu(" + mu + ");", true);

                }
                if (a > 0)
                {
                    axc = "";

                    axc = contiene2.Substring(0, contiene2.ToCharArray().Length - 1);
                    at = at + axc + " } }'";

                    ScriptManager.RegisterStartupScript(this, typeof(string), "at", "at(" + at + ");", true);
                }
                if (p > 0)
                {
                    axc = "";
                    axc = contiene3.Substring(0, contiene3.ToCharArray().Length - 1);
                    pr = pr + axc + " } }'";

                    ScriptManager.RegisterStartupScript(this, typeof(string), "pr", "pr(" + pr + ");", true);
                }
                #endregion
                //make a circle
                double px = Double.Parse(data.ImpactX);
                double py =( Double.Parse(data.ImpactY))*-1;
                switch (data.TipSteerDir)
                {
                    case "L":
                        if (px > 0)
                        {
                            px = ((px * 0.25 / 2 + 0.25) * 0.25)*-1;
                        }
                        else
                        {
                            px = ((px * 0.25 / 2 + 0.25) * 0.25);
                        }
                        break;

                    case "R":
                        if (px < 0)
                        {
                            px = ((px * 0.25 / 2 + 0.25) * 0.25) * -1;
                        }
                        else
                        {
                            px = ((px * 0.25 / 2 + 0.25) * 0.25);
                        }
                        break;
                    default:
                        px = ((px * 0.25 / 2 + 0.25) * 0.25);
                        break;
                }
               
                py = (py * 0.25 / 2 + 0.25) * 0.25;

                ScriptManager.RegisterStartupScript(this, typeof(string), "digi", "digi("+  data.Finish + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fBackstrokePause", "fBackstrokePause(" + data.BackstrokePause  + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fshotInterval", "fshotInterval(" + data.ShotInterval + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fJab", "fJab(" + data.Jab + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fFollowThrough", "fFollowThrough(" + data.FollowThrough + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fTipSteer", "fTipSteer(" + data.TipSteer + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fStraightness", "fStraightness(" + data.Straightness + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fFinesse", "fFinesse(" + data.Finesse + ");", true);
                //makeCircule
                ScriptManager.RegisterStartupScript(this, typeof(string), "makeCircule", "makeCircule(" +px.ToString() + " , " + py.ToString()+ ");", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Mensaje", "swal('¡Advertencia!', '" + result.Message + "', 'error');", true);
            }

        }
        protected void imgbtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["user"] = "";
            Session["rol"] = "";
            Response.Redirect("login.aspx");

        }
    }
}