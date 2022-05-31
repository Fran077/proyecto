<?php

include "idconexion.php";
$idConexion = mysqli_connect($hostname, $nombreUsuario, $contrasena);
    if (mysqli_connect_errno() != 0) {
        die("Error de conexión: " . mysqli_connect_error());
    }

mysqli_select_db( $idConexion , $BD);

error_reporting(0);
ini_set('display_errors', 0);

$consul="SELECT * FROM Ciudad";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);

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
                height: 575px;
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
            <h1>Inserte sus datos</h1>
            <form method="post" action="nuevousu2.php">
                <label><b>DNI:</label></b></label><br>
                <input type="text" name="dni" placeholder="Escriba aqu&iacute; su DNI" size="30" maxlength="9" pattern="[1-9]{1}[0-9]{7}[A-Za-z]{1}" title="Debe poner 8 n&uacute;meros y una letra." required /><br><br>
                <label><b>Nombre:</label></b></label><br>
                <input type="text" name="nom" placeholder="Escriba aqu&iacute; nombre completo" size="30" maxlength="50" required /><br><br>
                <label><b>Nombre de usuario:</label></b></label><br>
                <input type="text" name="usu" placeholder="Escriba aqu&iacute; su nombre de usuario" size="30" maxlength="35" required /><br><br>
                <label><b>Contrase&ntilde;a:</label></b></label><br>
                <input type="password" name="contra" placeholder="Escriba aqu&iacute; su contrase&ntilde;a" size="30" maxlength="35" minlength="8" required /><br><br>
                <label><b>Tel&eacute;fono:</label></b></label><br>
                <input type="tel" name="tlf" placeholder="Escriba aqu&iacute; su tel&eacute;fono" size="30" maxlength="9" pattern="[1-9]{1}[0-9]{8}" title="Debe poner 9 n&uacute;meros" required /><br><br>
                <label><b>Email:</label></b></label><br>
                <input type="email" name="email" placeholder="Escriba aqu&iacute; su email" size="30" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required /><br><br>
                <label><b>Ciudad:</label></b></label><br>
                <select name="ciudad">
                <?php
                foreach ($resul as $r): ?>
                <option value="<?php echo $r['id_ciudad']; ?>"><?php echo $r['Nombre']; ?></option>
                <?php
                endforeach; ?>
                </select>
                <br><br><br><button type="submit" name="siguiente" value="siguiente">Continuar</button>
            </form>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Cancelar</button>
            </form>
        </div>
    </body>
</html>