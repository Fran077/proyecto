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
            <h1><?php echo $fila['NomUsu']; ?>, est&aacute; suspendiendo su cuenta</h1>
            <h2>Recuerde que podr&aacute; activarla de nuevo apotando su DNI</h2>
            <form method="post" action="F.php">
                <br><br><button type="submit" name="conf" value="listar">Suspender cuenta</button><br>
                <input type="hidden" name="nomusu" value="<?php echo $fila['NomUsu']; ?>" />
            </form>
            <form method="post" action="recibe.php">
                <button type="submit" name="borra" value="borra">Volver atr&aacute;s</button>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="contra" value="<?php echo $fila['Contra']; ?>" />
            </form>
        </div>
    </body>
</html>

<?php