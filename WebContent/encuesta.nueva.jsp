<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="favicon.ico">

        <title>Nuevo cuestionario</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>

        <!-- Custom styles for this template -->
        <style><!--
            body {
                padding-top: 50px;
            }
            .starter-template {
                padding: 40px 15px;
                text-align: center;
            }
            --></style>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Project name</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">

            <div class="starter-template">
                <h1>Bootstrap starter template</h1>
                <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
            </div>
            <!--
            
            
            
            -->


            <div id="preguntas">



            </div>
            <!--
            
            
            
            -->

            <div class="form-group">
                <button id="bt_nueva_pregunta" type="submit" class="btn btn-primary">Nueva pregunta</button>
            </div>

        </div><!-- /.container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/bootstrap.min.js"></script>
        <script>

            $(document).ready(function () {
                //Inicializamos la primera pregunta      
                Insertar_pregunta();

                //configuramos y damos el evento click al boton de insertar nueva pregunta
                x = $("#bt_nueva_pregunta");
                x.click(Insertar_pregunta);

            });

            function MoverAbajo() {
                //obtenemos la altura del documento
                //Código que controla la interacción al agregar una nueva 
                //pregunta
                var alto = $(document).height();
                $("html, body").animate({scrollTop: alto + "px"});
                return false;
            }


            function RetornaTipoCampo(sel, fila) {
                console.log(sel.value);
                $('#lista_respuesta_' + fila).html('');
                var html = '';
                var tipo, opcion;


                var campo = 0;
                while ($('#campo_' + fila + '_' + campo + '').length) {
                    //Aquí pondríamos el código que queremos ejecutar
                    campo++;
                }

                opcion = '<a onclick="Clonar(' + fila + ',' + sel.value + ')" role="button" class="" data-toggle="modal"><i class="icon-plus"></i><span class="label label-info">Añadir</span></a>';


                switch (sel.value) {
                    case '1':
                        tipo = RetornaTipo('1');
                        html += RetornaCamposRadio(fila, tipo, opcion, campo);

                        break;

                    case '2':
                        tipo = RetornaTipo('2');
                        html += RetornaCamposSelect(fila, tipo, opcion, campo);
                        break;

                    case '3':
                        tipo = RetornaTipo('3');
                        html += RetornaTextArea(fila, tipo, opcion);

                        break;

                }

                $('#lista_respuesta_' + fila).append(html);

            }

            function RetornaCamposRadio(fila, tipo, opcion, campo) {
                var RadioHtml;

                RadioHtml = '<div id="campo_' + fila + '_' + campo + '" class="campo form-group">' +
                        '<label class="sr-only" for="exampleInputAmount"></label>' +
                        '<div class="input-group">' +
                        '<div class="input-group-addon">' + tipo + '</div>' +
                        '<input type="text" class="form-control" id="exampleInputAmount" placeholder="">' +
                        '<div class="input-group-addon">' + opcion + '</div>' +
                        '</div>' +
                        '</div>';
                return RadioHtml;
            }
            function RetornaTipo(tipo) {

                var html_tipo;
                switch (tipo) {
                    case '1':

                        html_tipo = '<input type="radio" value="" disabled>';
                        break;

                    case '2':
                        html_tipo = '<input type="checkbox" value="" disabled>';
                        break;

                    case '3':
                        html_tipo = 'textarea';
                        break;
                }

                return html_tipo;
            }
            function Clonar(fila, tipo) {
                var campo = 0;
                while ($('#campo_' + fila + '_' + campo + '').length) {
                    //Aquí pondríamos el código que queremos ejecutar
                    campo++;
                }

                var opcion = '<a onclick="EliminarItem(\'campo_' + fila + '_' + campo + '\')" role="button" class="" data-toggle="modal"><i class="icon-plus"></i><span class="label label-danger">Eliminar</span></a>';
                tipo = RetornaTipo('' + tipo + '');
                campo = RetornaCamposRadio(fila, tipo, opcion, campo);
                $('#lista_respuesta_' + fila).append(campo);
            }
            function EliminarItem(item) {
                $('#' + item).remove();
            }
            function RetornaCamposSelect(fila, tipo, opcion, campo) {

                var Html;

                Html = '<div id="campo_' + fila + '_' + campo + '" class="campo form-group">' +
                        '<label class="sr-only" for="exampleInputAmount"></label>' +
                        '<div class="input-group">' +
                        '<div class="input-group-addon">' + tipo + '</div>' +
                        '<input type="text" class="form-control" id="exampleInputAmount" placeholder="">' +
                        '<div class="input-group-addon">' + opcion + '</div>' +
                        '</div>' +
                        '</div>';
                return Html;
            }

            function RetornaTextArea(id) {
                TextareaHtml = '<textarea class="form-control" rows="3"></textarea>';
                return TextareaHtml;
            }

            function Insertar_pregunta()
            {

                var cant_filas = 0;


                while ($('#src_pregunta_' + cant_filas).length) {
                    //Aquí pondríamos el código que queremos ejecutar
                    cant_filas++;

                }


                var html = '<div id="src_pregunta_' + cant_filas + '" class="fila panel panel-default">' +
                        ' <div class="panel-body">' +
                        '     <div class="form-group">' +
                        '         <label for="exampleInputEmail1">Escriba la pregunta...</label>' +
                        ' <button onclick="EliminarItem(\'src_pregunta_' + cant_filas + '\')" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                        '         <input type="text" name="titulo" class="form-control" id="exampleInputEmail1" placeholder="Escriba Aquí la pregunta">' +
                        '     </div>' +
                        '     <div class="form-group">' +
                        '         <select onchange="RetornaTipoCampo(this, ' + cant_filas + ');" onselect="RetornaTipoCampo(this, ' + cant_filas + ');" id="tipo" name="tipo" class="tipo_preg form-control">' +
                        '             <option>Seleccione un de respuesta</option>' +
                        '             <option value="1">Opciones ùnicas</option>' +
                        '             <option value="2">Opciones mùltiples</option>' +
                        '             <option value="3">Respuesta libre</option>' +
                        '         </select>' +
                        '     </div>' +
                        '     <div>' +
                        '         <div class="panel" id="lista_respuesta_' + cant_filas + '">' +
                        '         </div>' +
                        '      </div>' +
                        '   </div>' +
                        '</div>';


                $("#preguntas").append(html);
                MoverAbajo();
            }

        </script>

    </body>
</html>
