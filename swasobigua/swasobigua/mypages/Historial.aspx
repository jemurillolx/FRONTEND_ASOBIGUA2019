<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="swasobigua.mypages.Historial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="disenio/logo.ico">

    <title></title>

    <!-- Bootstrap core CSS -->
    <link href="disenio/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="disenio/docs/4.0/examples/carousel.css" rel="stylesheet">
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="container-login100" style="background-image: url('images/fondo.jpg');"></div>
            <header>
                <nav class="navbar navbar-expand-md navbar-dark fixed-top  bg-dark">
                    <a>
                        <asp:ImageButton ID="imgbtnHome" runat="server" ImageUrl="images/asobigua-logo.png" OnClick="imgbtnHome_Click" Width="200px" />
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav mr-auto">

                            <li class="nav-item active"></li>

                            <li class="nav-item"></li>

                            <li class="nav-item active"></li>

                            <li class="nav-item"></li>

                        </ul>

                    </div>
                    <a id="username" class="navbar-brand" href="#">
                        <asp:Label ID="lblUsuario" runat="server" Text="USUARIO"></asp:Label></a>

                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" class="btn  btn-danger" OnClick="btnCerrarSesion_Click" />

                </nav>
                <style>
                    body {
                        /* Ubicación de la imagen */
                        background-image: url("images/fondo.jpg");
                        /* Para dejar la imagen de fondo centrada, vertical y

              horizontalmente */
                        background-position: center center;
                        /* Para que la imagen de fondo no se repita */
                        background-repeat: no-repeat;
                        /* La imagen se fija en la ventana de visualización para que la altura de la imagen no supere a la del contenido */
                        background-attachment: fixed;
                        /* La imagen de fondo se reescala automáticamente con el cambio del ancho de ventana del navegador */
                        background-size: cover;
                    }
                </style>
            </header>
            <script type="text/javascript">


                function fbackstrokePauses(backstrokePauses, z) {
                    let grafico1 = {
                        x: z,
                        y: backstrokePauses,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('myDiv', data, {}, { showSendToCloud: true });
                }

                function fFinesses(Finesses, z) {
                    let grafico1 = {
                        x: z,
                        y: Finesses,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('Finesses', data, {}, { showSendToCloud: true });
                }


                function fFinish(Finish, z) {
                    let grafico1 = {
                        x: z,
                        y: Finish,
                        type: 'scatter'
                    };

                    var data = [grafico1];
                    Plotly.newPlot('Finish', data, {}, { showSendToCloud: true });
                }
                function fFollowThrough(FollowThrough, z) {
                    let grafico1 = {
                        x: z,
                        y: FollowThrough,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('FollowThrough', data, {}, { showSendToCloud: true });
                }

                function fJab(Jab, z) {
                    let grafico1 = {
                        x: z,
                        y: Jab,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('Jab', data, {}, { showSendToCloud: true });
                }
                function fShotInterval(ShotInterval, z) {
                    let grafico1 = {
                        x: z,
                        y: ShotInterval,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('ShotInterval', data, {}, { showSendToCloud: true });
                }
                function fStraightness(Straightness, z) {
                    let grafico1 = {
                        x: z,
                        y: Straightness,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('Straightness', data, {}, { showSendToCloud: true });
                }
                function fTipSteer(TipSteer, z) {
                    let grafico1 = {
                        x: z,
                        y: TipSteer,
                        type: 'scatter'
                    };
                    var data = [grafico1];
                    Plotly.newPlot('TipSteer', data, {}, { showSendToCloud: true });
                }
                function minmax(value, min, max) {
                    if (parseInt(value) < min || isNaN(parseInt(value)))
                        return min;
                    else if (parseInt(value) > max)
                        return max;
                    else return value;
                }

            </script>
            <main role="main">

                <div>
                    <br>
                    <br>
                    <br>
                </div>
                <!-- Marketing messaging and featurettes
      ================================================== -->
                <!-- Wrap the rest of the page in another container to center all the content. -->

                <div class="container marketing">

                    <!-- Three columns of text below the carousel -->
                    <!-- /grafica del meta del brazo -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Nombres</div>
                                <div class="panel-body">
                                    <p>
                                        <asp:TextBox ID="tbxName" runat="server" CssClass="form-control input-lg " placeholder="Nombres"></asp:TextBox>
                                    </p>
                                </div>
                            </div>

                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Apellidos</div>
                                <div class="panel-body">
                                    <p>
                                        <asp:TextBox ID="tbxLastname" runat="server" CssClass="form-control input-lg " placeholder="Apellidos"></asp:TextBox>
                                    </p>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Nombre del Entrenador</div>
                                <div class="panel-body">
                                    <p>
                                        <asp:TextBox ID="tbxTrainerName" runat="server" CssClass="form-control input-lg " placeholder="Nombres"></asp:TextBox>
                                    </p>
                                </div>
                            </div>


                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Apellidos Entrenador</div>
                                <div class="panel-body">
                                    <p>
                                        <asp:TextBox ID="tbxTrainerLastName" runat="server" CssClass="form-control input-lg " placeholder="Apellidos"></asp:TextBox>
                                    </p>
                                </div>
                            </div>


                        </div>


                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Límite</div>
                                <div class="panel-body">
                                    <p>
                                        <asp:TextBox ID="tbxLimite" TextMode="Number" runat="server" CssClass="form-control input-lg "></asp:TextBox>
                                    </p>
                                </div>
                            </div>


                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-6">
                            <p>
                                <asp:Button ID="btncountshots" runat="server" Text="Cargar Historial" OnClick="btncountshots_Click" class="btn  btn-succes" />

                            </p>
                        </div>


                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Pausa Atrás</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="myDiv" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                     <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Sutileza</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="Finesses" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Finalización</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="Finish" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Seguimiento al Taco</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="FollowThrough" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Golpe</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="Jab" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Intervalo de Tiró</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="ShotInterval" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Rectitud</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="Straightness" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                     <div class="row">
                         <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Dirección de la Punta</div>
                            </div>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="TipSteer" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /grafica del Straightnes del brazo -->


                    <!-- /.row -->


                    <!-- START THE FEATURETTES -->


                    <hr class="featurette-divider" />

                    <!-- /END THE FEATURETTES -->

                </div>
                <!-- /.container -->


                <!-- FOOTER -->
                <footer class="container">
                    <p class="float-right"><a href="#" style="color: ghostwhite">Ir a arriba</a></p>
                    <p style="color: ghostwhite">&copy; Todos los derechos reservados.</p>
                </footer>
            </main>
        </div>
        <!-- Bootstrap core JavaScript
    ================================================== -->

        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>




        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="disenio/assets/js/vendor/popper.min.js"></script>
        <script src="disenio/dist/js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="disenio/assets/js/vendor/holder.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        </div>
    </form>
</body>
</html>
