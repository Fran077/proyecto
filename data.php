<?php

include "idconexion.php";
$idConexion = mysqli_connect($hostname, $nombreUsuario, $contrasena);
    if (mysqli_connect_errno() != 0) {
        die("Error de conexión: " . mysqli_connect_error());
    }

mysqli_select_db( $idConexion , $BD);

error_reporting(0);
ini_set('display_errors', 0);

$usu=$_REQUEST['usu'];
$consul="SELECT * FROM Usuarios WHERE NomUsu='" . $usu . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);
$consul2="SELECT * FROM Ciudad WHERE id_ciudad='" . $fila['id_ciudad'] . "'";
$resul2=mysqli_query($idConexion, $consul2);
$fila2=mysqli_fetch_array($resul2);

if ($usu == $fila['NomUsu'] ) {
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
                height: 630px;
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
            <h1>Mostrando datos de <?php echo $fila['NomUsu']; ?></h1>
            <form method="post" action="edata.php">
                <label><b>DNI:</label></b></label><br>
                <input type="text" name="dni" value="<?php echo $fila['DNI']; ?>" readonly /><br><br>
                <label><b>Nombre:</label></b></label><br>
                <input type="text" name="nom" value="<?php echo $fila['Nombre']; ?>" size="35" readonly /><br><br>
                <label><b>Nombre de usuario:</label></b></label><br>
                <input type="text" name="usu" value="<?php echo $fila['NomUsu']; ?>" size="35" readonly /><br><br>
                <label><b>Contrase&ntilde;a:</label></b></label><br>
                <input type="password" name="contra" value="<?php echo $fila['Contra']; ?>" size="35" readonly /><br><br>
                <label><b>Tel&eacute;fono:</label></b></label><br>
                <input type="tel" name="tlf" value="<?php echo $fila['tlf']; ?>" size="35" readonly /><br><br>
                <label><b>Email:</label></b></label><br>
                <input type="email" name="email" value="<?php echo $fila['email']; ?>" size="35" readonly /><br><br>
                <label><b>Ciudad:</label></b></label><br>
                <input type="text" name="ciudad" value="<?php echo $fila2['Nombre']; ?>" readonly /><br><br>
            </form>    
            <form method="post" action="edata.php">
                <button type="submit" name="edata" value="edata">Editar datos</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="ciudadusu" value="<?php echo $fila['id_ciudad']; ?>" />
            </form>
            <form method="post" action="miadop.php">
                <button type="submit" name="adop" value="adop">Mis adopciones</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="ciudadusu" value="<?php echo $fila['id_ciudad']; ?>" />
                <input type="hidden" name="dni" value="<?php echo $fila['DNI']; ?>" />
            </form>
            <form method="post" action="recibe.php">
                <button type="submit" name="atras" value="atras">Atr&aacute;s</button>
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
            <h1>Hubo un error</h1>
            <form method="post" action="index.html">
                <button type="submit" name="volver">Salir</button>
            </form>
        </div>
    </body>
</html>
<?php
}
?>