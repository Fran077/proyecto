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
$consul="SELECT * FROM Ciudad WHERE id_ciudad='" . $ciudad . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);

$consul2="UPDATE Usuarios SET Nombre='" . $nom . "', NomUsu='" . $usu . "', Contra='" . $contra . "', tlf='" . $tlf . "', email='" . $email . "', id_ciudad='" . $ciudad . "' WHERE DNI='" . $dni . "'";
$hey=mysqli_query($idConexion, $consul2);
$consul3="SELECT * FROM Usuarios WHERE DNI='" . $dni . "'";
$resul3=mysqli_query($idConexion, $consul3);
$fila3=mysqli_fetch_array($resul3);
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
                height: 525px;
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
            <h1>Usuario: <?php echo $fila3['NomUsu']; ?> actualizado</h1>
            <form method="post" action="index.html">
                <label><b>DNI:</label></b></label><br>
                <input type="text" name="dni" value="<?php echo $fila3['DNI']; ?>" readonly /><br><br>
                <label><b>Nombre:</label></b></label><br>
                <input type="text" name="nom" value="<?php echo $fila3['Nombre']; ?>" size="35" readonly /><br><br>
                <label><b>Nombre de usuario:</label></b></label><br>
                <input type="text" name="usu" value="<?php echo $fila3['NomUsu']; ?>" size="35" readonly /><br><br>
                <label><b>Contrase&ntilde;a:</label></b></label><br>
                <input type="password" name="contra" value="<?php echo $fila3['Contra']; ?>" size="35" readonly /><br><br>
                <label><b>Tel&eacute;fono:</label></b></label><br>
                <input type="tel" name="tlf" value="<?php echo $fila3['tlf']; ?>" size="35" readonly /><br><br>
                <label><b>Email:</label></b></label><br>
                <input type="email" name="email" value="<?php echo $fila3['email']; ?>" size="35" readonly /><br><br>
                <label><b>Ciudad:</label></b></label><br>
                <input type="text" name="ciudad" value="<?php echo $fila['Nombre']; ?>" readonly /><br><br>
            </form>
            <form method="post" action="recibe.php">
                <button type="submit" name="aceptar" value="aceptar">Aceptar</button>
                <input type="hidden" name="usu" value="<?php echo $fila3['NomUsu']; ?>" />
                <input type="hidden" name="contra" value="<?php echo $fila3['Contra']; ?>" />
            </form>
        </div>
    </body>
</html>
<?php
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
            <h1>Error al actualizar</h1>
            <form method="post" action="index.html">
                <button type="submit" name="volver">Volver a la p&aacute;gina anterior</button>
            </form>
        </div>
    </body>
</html>
<?php
}
?>