<?php

include "idconexion.php";
$idConexion = mysqli_connect($hostname, $nombreUsuario, $contrasena);
    if (mysqli_connect_errno() != 0) {
        die("Error de conexión: " . mysqli_connect_error());
    }

mysqli_select_db( $idConexion , $BD);

error_reporting(0);
ini_set('display_errors', 0);

$dni=$_REQUEST['dni'];
$consul="SELECT * FROM Usuarios WHERE DNI='" . $dni . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);

if ($dni == $fila['DNI']){
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
                width: 450px;
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
            <h1>Bienvenido de vuelta <?php echo $fila['NomUsu']; ?></h1>
            <form method="post" action="recibe.php">
                <br><br><button type="submit" name="conf" value="listar">Inicio</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="contra" value="<?php echo $fila['Contra']; ?>" />
            </form>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>
<?php
$consul2="UPDATE Usuarios SET activo='Sí' WHERE DNI='" . $dni . "'";
$hey = mysqli_query( $idConexion, $consul2 );
if ( $hey == TRUE ) {
    echo "";
    } else {
        echo "<h1>Error al insertar datos " . mysqli_error($idConexion) . "</h1>";
    }
} else {
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
            <h1>DNI incorrecto</h1>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>
<?php
}
?>