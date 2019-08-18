using swasobigua.mypages.Models;
using swasobigua.mypages.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace swasobigua.mypages
{
    public partial class Historial : System.Web.UI.Page
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
                if (Session["Player"] == null || Session["Player"].ToString() == "")
                {
                    Response.Redirect("index.aspx");
                }
                if (Session["Shot"] == null || Session["Shot"].ToString() == "")
                {
                    Response.Redirect("login.aspx");
                }
                lblUsuario.Text = Session["user"].ToString();
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

        protected async Task ShotHistoryDataAsync(CancellationToken cancellationToken, string player, int count, int day1, int day2, int year1, int year2, int month1, int month2)
        {
            int caseSelect = 0;
            string vdate1, vdate2;
            if (year1 > 1 && year2 > 1)
            {
                caseSelect = 2;
                if (count == 0)
                {
                    caseSelect = 3;
                }
                vdate1 = year1.ToString() + month1.ToString();

                if (month1 < 10)
                {
                    vdate1 = year1.ToString() + "0" + month1.ToString();
                }
                vdate2 = year2.ToString() + month2.ToString();
                if (month2 < 10 )
                {
                    vdate2 = year2.ToString()+"0" + month2.ToString();
                }
                
                if (day1 < 10)
                {
                    vdate1 = vdate1 + "0";
                }
                if (day2 < 10)
                {
                    vdate2 = vdate2 + "0";
                }
                vdate1 = vdate1 + day1;
                vdate2 = vdate2 + day2;
            }
            else
            {
                vdate2 = vdate1 = "0";
                caseSelect = 4;
                if (count > 0)
                {
                    caseSelect = 1;
                }

            }
           
           
            var result = await playerService.GetHistoryDataShotByPlayerAsync(player, count,vdate1,vdate2,caseSelect);
            if (result.HttpResponseStatusCode.Equals(HttpStatusCode.OK))
            {
                List<shotdatahistory> history = result.Value;
                //get all value to array list 
                List<String> LbackstrokePause = history.Select(x => x.BackstrokePause).ToList<String>();
                List<String> LFinesse = history.Select(x => x.Finesse).ToList<String>();
                List<String> LFinish = history.Select(x => x.Finish).ToList<String>();
                List<String> LFollowThrough = history.Select(x => x.FollowThrough).ToList<String>();
                List<String> LJab = history.Select(x => x.Jab).ToList<String>();
                List<String> LShotInterval = history.Select(x => x.ShotInterval).ToList<String>();
                List<String> LStraightness = history.Select(x => x.Straightness).ToList<String>();
                List<String> LTimeStamp = history.Select(x => x.TimeStamp).ToList<String>();
                List<String> LTipSteer = history.Select(x => x.TipSteer).ToList<String>();

                string backstrokePauses = "[" + String.Join(", ", LbackstrokePause.ToArray()) + "]";
                //fbackstrokePauses
                ScriptManager.RegisterStartupScript(this, typeof(string), "fbackstrokePauses", "fbackstrokePauses(" + backstrokePauses + ");", true);
                string Finesses = "[" + String.Join(", ", LFinesse.ToArray()) + "]";
                ScriptManager.RegisterStartupScript(this, typeof(string), "fFinesses", "fFinesses(" + Finesses + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fFinish", "fFinish(" + "[" + String.Join(", ", LFinish.ToArray()) + "]" + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fFollowThrough", "fFollowThrough(" + "[" + String.Join(", ", LFollowThrough.ToArray()) + "]" + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fJab", "fJab(" + "[" + String.Join(", ", LJab.ToArray()) + "]" + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fShotInterval", "fShotInterval(" + "[" + String.Join(", ", LShotInterval.ToArray()) + "]" + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fStraightness", "fStraightness(" + "[" + String.Join(", ", LStraightness.ToArray()) + "]" + ");", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "fTipSteer", "fTipSteer(" + "[" + String.Join(", ", LTipSteer.ToArray()) + "]" + ");", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Mensaje", "swal('¡Advertencia!', '" + result.Message + "', 'error');", true);
            }

        }

        protected void btncountshots_Click(object sender, EventArgs e)
        {
            if (tbxLimite.Text.ToString().Trim() == "")
            {
                tbxLimite.Text = "0";
            }
            if (tbxLimite.Text.ToString().Trim() != "")
            {   if (Int32.Parse(tbxLimite.Text) < 0)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Mensaje", "swal('¡Advertencia!', '" + "Ingrese una cantidad mayor a 0 en el límite." + "', 'error');", true);
                    return;
                }
                try
                {
                    int ini =fechaINI.SelectedDate.Day;
                    int fin = FechaFin.SelectedDate.Day;
                    int validateYear1 = fechaINI.SelectedDate.Year;
                    int validateYear2 = FechaFin.SelectedDate.Year;//null is 001
                    int month1 = fechaINI.SelectedDate.Month;
                    int month2 = FechaFin.SelectedDate.Month;
                    var pageAsyncTask = new PageAsyncTask(j => ShotHistoryDataAsync(j, Session["Player"].ToString(), Int32.Parse(tbxLimite.Text), ini,fin, validateYear1, validateYear2, month1, month2));
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
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Mensaje", "swal('¡Advertencia!', '" + result.Message + "', 'error');", true);
            }

        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["user"] = "";
            Session["rol"] = "";
            Response.Redirect("login.aspx");
        }

        protected void imgbtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}