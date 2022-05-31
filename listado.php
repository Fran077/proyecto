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
$consul="SELECT P.* FROM Pokemon P 
        JOIN poke_ciudad PC ON PC.id_pkmn = P.id_pkmn 
        JOIN Ciudad C ON C.id_ciudad = PC.id_ciudad 
        AND PC.id_ciudad='$ciudad'
        ORDER BY P.peso desc";

$resul=mysqli_query($idConexion, $consul);
$filapkmn=mysqli_fetch_array($resul);

$consul2="SELECT * FROM Usuarios WHERE NomUsu='" . $usu . "'";
$resul2=mysqli_query($idConexion, $consul2);
$fila2=mysqli_fetch_array($resul2);
$consul3="SELECT * FROM Ciudad WHERE id_ciudad='" . $ciudad . "'";
$resul3=mysqli_query($idConexion, $consul3);
$fila3=mysqli_fetch_array($resul3);
$consulpkmn2="SELECT * FROM Pokemon";
$resulpkmn2=mysqli_query($idConexion, $consulpkmn2);
$filapkmn2=mysqli_fetch_array($resulpkmn2);
$consul4="SELECT * FROM usupoke WHERE id_pkmn='" . $filapkmn2['id_pkmn'] . "'";
$resul4=mysqli_query($idConexion, $consul4);
$fila4=mysqli_fetch_array($resul4);

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
                height: 3270px;
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
                   
            <h1>Lista de Pok&eacute;mon que buscan hogar</h1>
            <?php while ( ( $filapkmn = mysqli_fetch_array( $resul ) ) != NULL ) {
            ?>
            <div class="column">
            <table>
                <tr>
                    <td><img src="pokemon/<?php echo $filapkmn['Nombre']; ?>.png" width="100%" height="100%"></td>
                    <td>
                        <h1><?php echo $filapkmn['Nombre']; ?></h1><br>
                        <h2>Altura: <?php echo $filapkmn['altura']; ?> metros</h2> 
                        <h2>Peso: <?php echo $filapkmn['peso']; ?> Kilogramos<h2>
                        <?php if ( ( $filapkmn['adoptado'] ) == 'Sí' ) {
                            ?>
                            <h2>Adoptado</h2>
                            <?php 
                        } else {
                            ?>
                            <h2>No Adoptado</h2>
                            <?php
                        }
                        ?>
                        <form method="post" action="pokemon.php">
                            <button type="submit" name="next" value="poke" >Ver perfil</button><br>
                            <input type="hidden" name="usu" value="<?php echo $fila2['NomUsu']; ?>" />
                            <input type="hidden" name="pokemon" value="<?php echo $filapkmn['id_pkmn']; ?>" />
                            <input type="hidden" name="ciudad" value="<?php echo $ciudad; ?>" />

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