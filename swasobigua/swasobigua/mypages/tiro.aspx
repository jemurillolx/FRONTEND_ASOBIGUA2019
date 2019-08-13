<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="tiro.aspx.cs" Inherits="swasobigua.mypages.tiro" %>

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

                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" class="btn  btn-danger" />

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




                function digi(Finish) {
                    var layout = {
                        title: 'Finalización',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Finalización'],
                            y: [Finish],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('myDiv', data, layout, { responsive: true });
                }

                function fBackstrokePause(BackstrokePause) {
                    var layout = {
                        title: 'Pausa Atrás',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Pausa Atrás'],
                            y: [BackstrokePause],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('myBackstrokePause', data, layout, { responsive: true });
                }

                function fshotInterval(shotInterval) {
                    var layout = {
                        title: 'Intervalo de Tiró',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Intervalo de Tiró'],
                            y: [shotInterval],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('dshotInterval', data, layout, { responsive: true });
                }

                function fJab(Jab) {
                    var layout = {
                        title: 'Golpe',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Golpe'],
                            y: [Jab],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('djab', data, layout, { responsive: true });
                }
                function fFollowThrough(FollowThrough) {
                    var layout = {
                        title: 'Seguimiento al Taco',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Seguimiento al Taco'],
                            y: [FollowThrough],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('dFollowThrough', data, layout, { responsive: true });
                }

                function fTipSteer(TipSteer) {
                    var layout = {
                        title: 'Dirección de la Punta',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Dirección de la Punta'],
                            y: [TipSteer],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('dTipSteer', data, layout, { responsive: true });
                }
                function fStraightness(Straightness) {
                    var layout = {
                        title: 'Rectitud',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Rectitud'],
                            y: [Straightness],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('dStraightness', data, layout, { responsive: true });
                }

                function fFinesse(Finesse) {
                    var layout = {
                        title: 'Sutileza',
                        font: '{ size: 18}'
                    };
                    var data = [
                        {
                            x: ['Sutileza'],
                            y: [Finesse],
                            type: 'bar'
                        }
                    ];

                    Plotly.newPlot('dFinesse', data, layout, { responsive: true });
                }
                function mu(data) {
                    var s = data;
                    let b = JSON.parse(s);
                    let arrayX = new Array();
                    let arrayY = new Array();
                    let arrayZ = new Array();
                    let arrayColor = new Array();

                    if (Object.keys(b['shotXYZ']).length >= 1) {
                        for (let i = 0; i < Object.keys(b['shotXYZ']).length; i++) {
                            arrayX.push(b['shotXYZ'][i]['x']);
                            arrayY.push(b['shotXYZ'][i]['y']);
                            arrayZ.push(b['shotXYZ'][i]['z']);
                            arrayColor.push("0");
                        }
                    }
                    Plotly.d3.csv('https://raw.githubusercontent.com/plotly/datasets/master/3d-line1.csv', function (err, rows) {

                        var x = arrayX;
                        var y = arrayY;
                        var z = arrayZ;
                        var c = arrayColor;

                        Plotly.plot('graphm', [{
                            type: 'scatter3d',
                            mode: 'lines',
                            x: x,
                            y: y,
                            z: z,
                            opacity: 1,
                            line: {
                                width: 6,
                                color: c,
                                reversescale: false
                            }
                        }], {
                                height: 640
                            }, { showSendToCloud: true });
                    });
                }


                function at(data) {
                    var s = data;
                    let b = JSON.parse(s);
                    let arrayX = new Array();
                    let arrayY = new Array();
                    let arrayZ = new Array();
                    let arrayColor = new Array();

                    if (Object.keys(b['shotXYZ']).length >= 1) {
                        for (let i = 0; i < Object.keys(b['shotXYZ']).length; i++) {
                            arrayX.push(b['shotXYZ'][i]['x']);
                            arrayY.push(b['shotXYZ'][i]['y']);
                            arrayZ.push(b['shotXYZ'][i]['z']);
                            arrayColor.push("0");
                        }
                    }
                    Plotly.d3.csv('https://raw.githubusercontent.com/plotly/datasets/master/3d-line1.csv', function (err, rows) {

                        var x = arrayX;
                        var y = arrayY;
                        var z = arrayZ;
                        var c = arrayColor;

                        Plotly.plot('grapha', [{
                            type: 'scatter3d',
                            mode: 'lines',
                            x: x,
                            y: y,
                            z: z,
                            opacity: 1,
                            line: {
                                width: 6,
                                color: c,
                                reversescale: false
                            }
                        }], {
                                height: 640
                            }, { showSendToCloud: true });
                    });
                }

                function pr(data) {
                    var s = data;
                    let b = JSON.parse(s);
                    let arrayX = new Array();
                    let arrayY = new Array();
                    let arrayZ = new Array();
                    let arrayColor = new Array();

                    if (Object.keys(b['shotXYZ']).length >= 1) {
                        for (let i = 0; i < Object.keys(b['shotXYZ']).length; i++) {
                            arrayX.push(b['shotXYZ'][i]['x']);
                            arrayY.push(b['shotXYZ'][i]['y']);
                            arrayZ.push(b['shotXYZ'][i]['z']);
                            arrayColor.push("0");
                        }
                    }
                    Plotly.d3.csv('https://raw.githubusercontent.com/plotly/datasets/master/3d-line1.csv', function (err, rows) {

                        var x = arrayX;
                        var y = arrayY;
                        var z = arrayZ;
                        var c = arrayColor;

                        Plotly.plot('graphp', [{
                            type: 'scatter3d',
                            mode: 'lines',
                            x: x,
                            y: y,
                            z: z,
                            opacity: 1,
                            line: {
                                width: 6,
                                color: c,
                                reversescale: false
                            }
                        }], {
                                height: 640
                            }, { showSendToCloud: true });
                    });
                }

                function makeCircule(vx, vy) {

                    var trace1 = {
                        x: [0],
                        y: [0],
                        mode: 'markers',
                        type: 'scatter',
                        name: 'Bola',
                        text: ['Bola'],
                        marker: { size: 100 }
                    };

                    var trace2 = {
                        x: [vx],
                        y: [vy],
                        mode: 'markers',
                        type: 'scatter',
                        name: 'Impacto',
                        text: ['Tiro'],
                        marker: { size: 12 }
                    };

                    var data = [trace1, trace2];

                    var layout = {
                        xaxis: {
                            range: [-6, 5.25]
                        },
                        yaxis: {
                            range: [-6, 6]
                        },
                        title: 'Rectitud'
                    };

                    Plotly.newPlot('dCirculo', data, layout, { showSendToCloud: true });

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
                                <div class="panel-heading">Nombre Jugador</div>
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
                                <div class="panel-heading">Apellidos Jugador</div>
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
                                <div class="panel-heading">Nombre Entrenador</div>
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
                            <p>
                            </p>

                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Fecha Hora</div>
                                <div class="panel-body">
                                    <p>
                                         <asp:TextBox ID="tbxFecha" runat="server" CssClass="form-control input-lg " placeholder="Fecha"></asp:TextBox>
                                    </p>
                                </div>
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
                    <!-- /.BackstrokePause -->
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="myBackstrokePause" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /.shotInterval -->
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dshotInterval" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /.JAB -->
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="djab" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /.FollowThrough -->
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dFollowThrough" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dTipSteer" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dStraightness" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dFinesse" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="dCirculo" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /grafica del meta del brazo -->

                    <div class="row">
                        <div class="col-lg-12">
                           
                            <div class="panel panel-default">
                                <div class="panel-heading">Muñeca</div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="graphm" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                             <div class="panel panel-default">
                                <div class="panel-heading">Antebrazo</div>
                            </div>
                            

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="grapha" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Pierna</div>
                            </div>
                            

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <div id="graphp" width="100%" height="500px"></div>
                            </p>
                        </div>
                    </div>
                    <!-- /.row -->


                    <!-- START THE FEATURETTES -->


                    <hr class="featurette-divider">

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
