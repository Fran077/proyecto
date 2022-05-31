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
$ciudad=$_REQUEST['ciudadusu'];
$dni=$_REQUEST['dni'];
//echo "Usuario: ".$usu." ciudad: ".$ciudad." dni".$dni;
// Consulta para obtener los pokemon asociados.

            /* usepoke: para obetener el dni;
                select p.* from
                usepoke as u, pokemon as p
                where u.id_pkmn = p.id_pkmn
                and u.dni = $dni;*/


$consul="SELECT p.* FROM usupoke UP JOIN pokemon P ON P.id_pkmn=UP.id_pkmn AND UP.dni='$dni'";
$resul=mysqli_query($idConexion, $consul);
//$fila=mysqli_fetch_array($resul);



$consul2="SELECT * FROM usuarios WHERE NomUsu='$usu'";
$resul2=mysqli_query($idConexion, $consul2);
$fila2=mysqli_fetch_array($resul2);


$consul3="SELECT * FROM ciudad WHERE id_ciudad='$ciudad'";
$resul3=mysqli_query($idConexion, $consul3);
$fila3=mysqli_fetch_array($resul3);
//echo "ciudad: ". $fila3['Nombre'];

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
                width: 50%;
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
        <style>
            .column {
                float: inline-start;
                width: 43%;
                padding: 5px;
            }

            * {
                box-sizing: border-box;
            }

            .row {
                content: "";
                clear: both;
                display: table;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 4px dotted #ddd;
            }

            th, td {
                text-align: center;
                padding: 1px;
                margin: auto;
            }
        </style>
        <div class="centro">
            <h1>Lista de Pok&eacute;mon que has adoptado</h1>
            <?php while ( $fila= mysqli_fetch_array($resul) )  {

                $id_pkmn = $fila['id_pkmn'];
               // echo "id_pkmn: ".$id_pkmn;

            ?>
            <div class="column">
            <table>
                <tr>
                    <td><img src="pokemon/<?php echo $fila['Nombre']; ?>.png" width="100%" height="100%"></td>
                    <td>
                        <h1><?php echo $fila['Nombre']; ?></h1><br>
                        <h2>Altura: <?php echo $fila['altura']; ?> metros</h2> 
                        <h2>Peso: <?php echo $fila['peso']; ?> Kilogramos<h2>
                        <form method="post" action="pokemon.php">
                            <button type="submit" name="next" value="poke" >Ver perfil</button><br>
                            <input type="hidden" name="usu" value="<?php echo $usu; ?>" />
                            <input type="hidden" name="pokemon" value="<?php echo $id_pkmn; ?>" />
                            <input type="hidden" name="ciudad" value="<?php echo $ciudad ?>" />
                        </form>
                    </td>
                </tr>
            </table>
            </div>
            <?php
            }
            ?>
            <form method="post" action="recibe.php">
                <button type="submit" name="borra" value="borra">Atr&aacute;s</button>
                <input type="hidden" name="usu" value="<?php echo $fila2['NomUsu']; ?>" />
                <input type="hidden" name="contra" value="<?php echo $fila2['Contra']; ?>" />
            </form>
            <form method="post" action="index.html">
                <button type="submit" name="salir" value="salir">Salir</button>
            </form>
        </div>
    </body>
</html>