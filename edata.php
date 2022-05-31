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
$consul2="SELECT * FROM Ciudad";
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
                height: 550px;
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
            <h1>Inserte nuevos datos</h1>
            <form method="post" action="edata2.php">
                <label><b>Nombre:</label></b></label><br>
                <input type="text" name="nom" value="<?php echo $fila['Nombre']; ?>" size="35" maxlength="50" required /><br><br>
                <label><b>Nombre de usuario:</label></b></label><br>
                <input type="text" name="usu" value="<?php echo $fila['NomUsu']; ?>" size="35" maxlength="50" required /><br><br>
                <label><b>Contrase&ntilde;a:</label></b></label><br>
                <input type="password" name="contra" value="<?php echo $fila['Contra']; ?>" size="35" maxlength="35" minlength="8" required /><br><br>
                <label><b>Tel&eacute;fono:</label></b></label><br>
                <input type="tel" name="tlf" value="<?php echo $fila['tlf']; ?>" size="35" maxlength="9" pattern="[1-9]{1}[0-9]{8}" title="Debe poner 9 n&uacute;meros" required /><br><br>
                <label><b>Email:</label></b></label><br>
                <input type="email" name="email" value="<?php echo $fila['email']; ?>" size="35" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required /><br><br>
                <label><b>Ciudad:</label></b></label><br>
                <select name="ciudad">
                <?php
                foreach ($resul2 as $r2): ?>
                <option value="<?php echo $r2['id_ciudad']; ?>"><?php echo $r2['Nombre']; ?></option>
                <?php
                endforeach; ?>
                </select>
                <br><br><br><form method="post" action="edata2.php">
                <button type="submit" name="edata2" value="edata2">Seguir</button><br>
                <input type="hidden" name="nomusu" value="<?php echo $fila['NomUsu']; ?>" />
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