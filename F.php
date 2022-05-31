<?php

include "idconexion.php";
$idConexion = mysqli_connect($hostname, $nombreUsuario, $contrasena);
    if (mysqli_connect_errno() != 0) {
        die("Error de conexión: " . mysqli_connect_error());
    }

mysqli_select_db( $idConexion , $BD);

error_reporting(0);
ini_set('display_errors', 0);

$usu=$_REQUEST['nomusu'];
$consul="SELECT * FROM Usuarios WHERE NomUsu='" . $usu . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);

$consul = "UPDATE Usuarios SET activo = 'No' WHERE NomUsu = '" . $usu . "'";

$hey = mysqli_query( $idConexion, $consul );
if ( $hey == TRUE ) {
    echo "";
    } else {
        echo "<h1>Error al insertar datos " . mysqli_error($idConexion) . "</h1>";
    }

?>

<html>
    <head>
        <style>
            img {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
        <img src="logo.png">
        <style>
            .centro {
                background-color: orange;
                text-align: center;
                width: 400px;
                height: 300px;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <style>
            body {
                background-image: url('illo.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <div class="centro">
            <h1>Ha sido un placer, <?php echo $fila['Nombre']; ?></h1>
            <h2>Recuerde que podr&aacute; activar su cuenta de nuevo aportando su DNI</h2>
            <form method="post" action="index.html">
                <br><br><button type="submit" name="conf" value="listar">Salir</button><br>
            </form>
        </div>
    </body>
</html>

