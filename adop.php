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
$poke=$_REQUEST['poke'];
$consul="SELECT * FROM Usuarios WHERE NomUsu='" . $usu . "'";
$resul=mysqli_query($idConexion, $consul);
$fila=mysqli_fetch_array($resul);
$consul2="SELECT * FROM Pokemon WHERE id_pkmn='" . $poke . "'";
$resul2=mysqli_query($idConexion, $consul2);
$fila2=mysqli_fetch_array($resul2);

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
                height: 580px;
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
            <table>
                <tr>
                    <td><img src="pokemon/<?php echo $fila2['Nombre']; ?>.png" width="90%" height="90%"></td>
                    <td><h1>&iquest;Quieres adoptar a <?php echo $fila2['Nombre']; ?>?</h1></td>
                </tr>
            </table>
            <form method="post" action="adop2.php">
                <button type="submit" name="next">Confirmar</button>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="poke" value="<?php echo $fila2['id_pkmn']; ?>" />
            </form>
            <form method="post" action="recibe.php">
                <button type="submit" name="borra" value="borra">Inicio</button><br>
                <input type="hidden" name="usu" value="<?php echo $fila['NomUsu']; ?>" />
                <input type="hidden" name="contra" value="<?php echo $fila['Contra']; ?>" />
            </form>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>