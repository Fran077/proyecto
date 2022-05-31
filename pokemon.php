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
$poke=$_REQUEST['pokemon'];
$ciu=$_REQUEST['ciudad'];
$consul="SELECT * FROM Usuarios WHERE NomUsu='" . $usu . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);
$consul2="SELECT * FROM Pokemon WHERE id_pkmn='" . $poke . "'";
$resul2=mysqli_query($idConexion, $consul2);
$fila2=mysqli_fetch_array($resul2);
$consul3="SELECT * FROM Ciudad WHERE id_ciudad='" . $ciu . "'";
$resul3=mysqli_query($idConexion, $consul3);
$fila3=mysqli_fetch_array($resul3);

if ( $fila2['adoptado'] == 'No') {
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
                width: 1000px;
                height: 520px;
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
            <h1>Mostrando ficha de <?php echo $fila2['Nombre']; ?></h1>
            <table>
                <tr>
                    <td><img src="pokemon/<?php echo $fila2['Nombre']; ?>.png" width="90%" height="90%"></td>
                    <td><h2>Altura: <?php echo $fila2['altura']; ?> metros</h2> 
                        <h2>Peso: <?php echo $fila2['peso']; ?> Kilogramos<h2>
                        <h2>Ciudad: <?php echo $fila3['Nombre']; ?></h2>
                        <h3><?php echo $fila2['info']; ?></h3>
                        </td>
                </tr>
            </table>
            <form method="post" action="adop.php">
                <button type="submit" name="next">Adoptar</button>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="poke" value="<?php echo $fila2['id_pkmn']; ?>" />
            </form>
            <form method="post" action="recibe.php">
                <button type="submit" name="borra" value="borra">Atr&aacute;s</button><br>
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
                width: 1000px;
                height: 520px;
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
            <h1>Mostrando ficha de <?php echo $fila2['Nombre']; ?></h1>
            <table>
                <tr>
                    <td><img src="pokemon/<?php echo $fila2['Nombre']; ?>.png" width="90%" height="90%"></td>
                    <td><h2>Altura: <?php echo $fila2['altura']; ?> metros</h2> 
                        <h2>Peso: <?php echo $fila2['peso']; ?> Kilogramos<h2>
                        <h2>Ciudad: <?php echo $fila3['Nombre']; ?></h2>
                        <h3><?php echo $fila2['info']; ?></h3>
                        <h2>ADOPTADO</h2>
                        </td>
                </tr>
            </table>
            <form method="post" action="recibe.php">
                <button type="submit" name="borra" value="borra">Atr&aacute;s</button><br>
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
}
?>