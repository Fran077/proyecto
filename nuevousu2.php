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
$nom=$_REQUEST['nom'];
$usu=$_REQUEST['usu'];
$contra=$_REQUEST['contra'];
$tlf=$_REQUEST['tlf'];
$email=$_REQUEST['email'];
$ciudad=$_REQUEST['ciudad'];
$consul3="SELECT * FROM Ciudad WHERE id_ciudad='" . $ciudad . "'";
$resul3=mysqli_query($idConexion, $consul3);
$fila3=mysqli_fetch_array($resul3);

$consul2="INSERT INTO Usuarios (DNI, Nombre, NomUsu, Contra, tlf, email, activo, id_ciudad) VALUES ('" . $dni . "', '" . $nom . "', '" . $usu . "', '" . $contra . "', '" . $tlf . "', '" . $email . "', 'Sí', '" . $ciudad . "')";
$hey = mysqli_query( $idConexion, $consul2 );
$consul="SELECT * FROM Usuarios WHERE DNI='" . $dni . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);
if ( $hey == TRUE ) {
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
            <h1>Bienvenido <?php echo $fila['NomUsu']; ?></h1>
            <form method="post" action="recibe.php">
                <br><br><button type="submit" name="conf" value="listar">Ir a inicio</button><br>
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
} else { ?>
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
            <?php echo "<h1>Error al crear usuario " . mysqli_error($idConexion) . "</h1>";?>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>
<?php
}
?>