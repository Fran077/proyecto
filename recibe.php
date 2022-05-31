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
$contra=$_REQUEST['contra'];
$consul="SELECT * FROM Usuarios WHERE NomUsu='$usu' AND Contra='$contra'";
$resul=mysqli_query($idConexion, $consul);

// El usuario existe
if ($fila=mysqli_fetch_array($resul)) {
    $usu = $fila['NomUsu'];
    $contra = $fila['Contra'];
    
    // el usuario está activo.
    if( $fila['activo'] == 'Sí'){

  
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
                height: 330px;
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
            <h1>Bienvenid@ <?php echo $fila['Nombre']; ?></h1>
            <h2>&iquest;Qu&eacute; desea hacer?</h2>
            <form method="post" action="listado.php">
                <button type="submit" name="listar" value="listar">Ver lista de adopci&oacute;n</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="ciudadusu" value="<?php echo $fila['id_ciudad']; ?>" />
            </form>
            <form method="post" action="miadop.php">
                <button type="submit" name="adop" value="adop">Mis adopciones</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="ciudadusu" value="<?php echo $fila['id_ciudad']; ?>" />
                <input type="hidden" name="dni" value="<?php echo $fila['DNI']; ?>" />
            </form>
            <form method="post" action="data.php">
                <button type="submit" name="data" value="data">Ver mis datos</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu'] ?>" />
            </form>
            <form method="post" action="borrarusu.php">
                <button type="submit" name="borra" value="borra">Suspender mi usuario</button>
                <input type="hidden" name="dniusu" value="<?php echo $fila['DNI']; ?>" />
            </form>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>

    <?php
    // Existe, pero no activo.
    } elseif ($fila['activo'] == 'No') {
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
            <h1>Usuario no se encuentra activo</h1>
            <form method="post" action="index.html">
                <button type="submit" name="volver">Volver a la p&aacute;gina anterior</button>
            </form>
            <form method="post" action="activar.html">
                <button type="submit" name="activar">Activar usuario</button>
            </form>
        </div>
    </body>
</html>
<?php
    }
} 
// else para el primer if: usuario no existe
else{
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
            <h1>Usuario incorrecto</h1>
            <form method="post" action="index.html">
                <button type="submit" name="volver">Volver a la p&aacute;gina anterior</button>
            </form>
        </div>
    </body>
</html>
<?php
}

?>