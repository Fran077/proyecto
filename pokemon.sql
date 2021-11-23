CREATE DATABASE IF NOT EXISTS Proyecto;
USE Proyecto

---------------------------------------------LAS TABLAS-------------------------------------

CREATE TABLE Tipos (
    id_tipo TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15)
);

CREATE TABLE Profesor (
    id_prof TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20),
    info LONGTEXT
);

CREATE TABLE Region (
    id_region TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(10)
);

CREATE TABLE Pokemon (
    Pokedex SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    info LONGTEXT,
    HP SMALLINT(3),
    ATAQUE SMALLINT(3),
    DEFENSA SMALLINT(3),
    A_ESPECIAL SMALLINT(3),
    D_ESPECIAL SMALLINT(3),
    VELOCIDAD SMALLINT(3),
    Total_Estat SMALLINT(3)
);

CREATE TABLE Evolucion (
    Pokedex SMALLINT,
    id_pkmn_evo SMALLINT,
    CONSTRAINT pokemon_fk4 FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    CONSTRAINT pokemon_fk5 FOREIGN KEY (id_pkmn_evo) REFERENCES Pokemon(Pokedex),
    PRIMARY KEY (Pokedex, id_pkmn_evo)
);

CREATE TABLE Pokemon_Tipo (
    Pokedex SMALLINT,
    id_tipo TINYINT,
    CONSTRAINT pkmn_fk3 FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    CONSTRAINT tipo_fk3 FOREIGN KEY (id_tipo) REFERENCES Tipos(id_tipo),
    PRIMARY KEY (Pokedex, id_tipo)
);

CREATE TABLE Iniciales (
    id_prof TINYINT,
    Pokedex SMALLINT,
    id_region TINYINT,
    CONSTRAINT inicial_fk FOREIGN KEY (id_prof) REFERENCES Profesor(id_prof),
    CONSTRAINT inicial_fk2 FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    CONSTRAINT inicial_fk3 FOREIGN KEY (id_region) REFERENCES Region(id_region),
    PRIMARY KEY (id_prof, Pokedex, id_region)
);

CREATE TABLE Ciudades (
    id_ciudad SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20),
    id_region TINYINT,
    info LONGTEXT,
    CONSTRAINT inicial_fk4 FOREIGN KEY (id_region) REFERENCES Region(id_region)
);

CREATE TABLE Lideres (
    id_lider TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15),
    info LONGTEXT,
    Medalla VARCHAR(15),
    id_ciudad SMALLINT,
    CONSTRAINT ciudad_fk FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE Pokemon_Lider (
    id_lider TINYINT,
    Pokedex SMALLINT,
    CONSTRAINT pokemon_fk FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    CONSTRAINT lider_fk3 FOREIGN KEY (id_lider) REFERENCES Lideres(id_lider),
    PRIMARY KEY (Pokedex, id_lider)
);

CREATE TABLE Rutas (
    id_ruta SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Número SMALLINT,
    id_region TINYINT,
    CONSTRAINT inicial_fk5 FOREIGN KEY (id_region) REFERENCES Region(id_region)
);

CREATE TABLE LugaresImp (
    id_lugarimp SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25),
    id_region TINYINT,
    info LONGTEXT,
    CONSTRAINT inicial_fk6 FOREIGN KEY (id_region) REFERENCES Region(id_region)
);

CREATE TABLE Ruta_Pokemon (
    id_ruta SMALLINT,
    Pokedex SMALLINT,
    CONSTRAINT ruta_fk FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    CONSTRAINT pkmn_fk FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    PRIMARY KEY (id_ruta, Pokedex)
);

CREATE TABLE LugaresImp_Pokemon (
    id_lugarimp SMALLINT,
    Pokedex SMALLINT,
    CONSTRAINT lugarimp_fk FOREIGN KEY (id_lugarimp) REFERENCES LugaresImp(id_lugarimp),
    CONSTRAINT pkmn_fk2 FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    PRIMARY KEY (id_lugarimp, Pokedex)
);

CREATE TABLE AltoMando (
    id_alto TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20),
    info LONGTEXT,
    id_lugarimp SMALLINT,
    CONSTRAINT alto_fk FOREIGN KEY (id_lugarimp) REFERENCES LugaresImp(id_lugarimp)
);

CREATE TABLE AltoMando_Pokemon (
    id_alto TINYINT,
    Pokedex SMALLINT,
    CONSTRAINT pokemon_fk2 FOREIGN KEY (Pokedex) REFERENCES Pokemon(Pokedex),
    CONSTRAINT alto_fk2 FOREIGN KEY (id_alto) REFERENCES AltoMando(id_alto),
    PRIMARY KEY (Pokedex, id_alto)
);

--------------------------------------LOS INSERTS -------------------------------------------
--id_tipo, nombre
INSERT INTO Tipos (Nombre) VALUES ('Acero');
INSERT INTO Tipos (Nombre) VALUES ('Agua');
INSERT INTO Tipos (Nombre) VALUES ('Bicho');
INSERT INTO Tipos (Nombre) VALUES ('Dragón');
INSERT INTO Tipos (Nombre) VALUES ('Eléctrico');
INSERT INTO Tipos (Nombre) VALUES ('Fantasma');
INSERT INTO Tipos (Nombre) VALUES ('Fuego');
INSERT INTO Tipos (Nombre) VALUES ('Hada');
INSERT INTO Tipos (Nombre) VALUES ('Hielo');
INSERT INTO Tipos (Nombre) VALUES ('Lucha');
INSERT INTO Tipos (Nombre) VALUES ('Normal');
INSERT INTO Tipos (Nombre) VALUES ('Planta');
INSERT INTO Tipos (Nombre) VALUES ('Psíquico');
INSERT INTO Tipos (Nombre) VALUES ('Roca');
INSERT INTO Tipos (Nombre) VALUES ('Siniestro');
INSERT INTO Tipos (Nombre) VALUES ('Tierra');
INSERT INTO Tipos (Nombre) VALUES ('Veneno');
INSERT INTO Tipos (Nombre) VALUES ('Volador');
--id_profesor, nombre
INSERT INTO Profesor (Nombre, info) VALUES ('Oak', 'Estudia a los Pokémon y es reconocido como la mayor eminencia en cuanto a Pokémon se refiere, por ello es conocido como el Profesor Pokémon. Al comenzar tu aventura te entrega uno de los Pokémon iniciales');
--id_region, nombre
INSERT INTO Region (Nombre) VALUES ('Kanto');
--id_pkmn, nombre, pokedex, hp, at, def, ae, de, vel, total_stat
--1º Gen
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bulbasaur', 'Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo.', 45, 49, 49, 65, 65, 45, 318);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ivysaur', 'Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre las patas traseras.', 60, 62, 63, 80, 80, 60, 405); 
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venusaur', 'La planta florece cuando absorbe energía solar, lo cual le obliga a buscar siempre la luz del sol.', 80, 82, 83, 100, 100, 80, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmander', 'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.', 39, 52, 43, 60, 50, 65, 309);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmeleon', 'Este Pokémon de naturaleza agresiva ataca en combate con su cola llameante y hace trizas al rival con sus afiladas garras.', 58, 64, 58, 80, 65, 80, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charizard', 'Escupe un fuego tan caliente que funde las rocas. Causa incendios forestales sin querer.', 78, 84, 78, 109, 85, 100, 534);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Squirtle', 'Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble.', 44, 48, 65, 50, 64, 43, 314);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wartortle', 'Se lo considera un símbolo de longevidad. Los ejemplares más ancianos tienen musgo sobre el caparazón.', 59, 63, 80, 65, 80, 58, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Blastoise', 'Para acabar con su enemigo, lo aplasta con el peso de su cuerpo. En momentos de apuro, se esconde en el caparazón.', 79, 83, 100, 85, 105, 78, 530);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Caterpie', 'Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos.', 45, 30, 35, 20, 20, 45, 195);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Metapod', 'Como en este estado solo puede endurecer su coraza, permanece inmóvil a la espera de evolucionar.', 50, 20, 55, 25, 25, 30, 205);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Butterfree', 'Aletea a gran velocidad para lanzar al aire sus escamas extremadamente tóxicas.', 60, 45, 50, 90, 80, 70, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weedle', 'El aguijón de la cabeza es muy puntiagudo. Se alimenta de hojas oculto en la espesura de bosques y praderas.', 40, 35, 30, 20, 20, 50, 195);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kakuna', 'Aunque es casi incapaz de moverse, en caso de sentirse amenazado puede envenenar a los enemigos con su aguijón.', 45, 25, 50, 25, 25, 35, 205);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Beedrill', 'Tiene tres aguijones venenosos, dos en las patas anteriores y uno en la parte baja del abdomen, con los que ataca a sus enemigos una y otra vez.', 65, 90, 40, 45, 80, 75, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgey', 'Su docilidad es tal que suelen defenderse levantando arena en lugar de contraatacar.', 40, 45, 40, 35, 35, 56, 251);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeotto', 'Su extraordinaria vitalidad y resistencia le permiten cubrir grandes distancias del territorio que habita en busca de presas.', 63, 60, 55, 50, 50, 71, 349);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeot', 'Este Pokémon vuela a una velocidad de 2 match en busca de presas. Sus grandes garras son armas muy peligrosas.', 83, 80, 75, 70, 70, 101, 479);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rattata', 'Es propenso a hincar los incisivos en cualquier cosa que se le ponga por delante. Si se ve alguno, seguramente haya cuarenta cerca.', 30, 56, 35, 25, 35, 72, 253);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raticate', 'Gracias a las pequeñas membranas de las patas traseras, puede nadar por los ríos para capturar presas.', 55, 81, 60, 50, 70, 97, 413);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Spearow', 'A la hora de proteger su territorio, compensa su incapacidad para volar a gran altura con una increíble velocidad.', 40, 60, 30, 31, 31, 70, 262);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Fearow', 'Este Pokémon ha existido desde tiempos remotos. Al menor atisbo de peligro, alza el vuelo y huye.', 65, 90, 65, 61, 61, 100, 442);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ekans', 'La longitud de este Pokémon aumenta con el tiempo. Por la noche, se enrosca en las ramas de los árboles para descansar.', 35, 60, 44, 40, 54, 55, 288);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arbok', 'Se han llegado a identificar hasta seis variaciones distintas de las espeluznantes dibujos de su piel.', 60, 95, 69, 65, 79, 80, 448);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pikachu', 'Cuanto más potente es la energía que genera este Pokémon, más suaves y elásticas se vuelven las bolsas de sus mejillas.', 35, 55, 40, 50, 50, 90, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raichu', 'Su larga cola le sirve como toma de tierra para protegerse a sí mismo del alto voltaje que genera su cuerpo.', 60, 90, 55, 90, 80, 110, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandshrew', 'Le gusta revolcarse por la arena seca para eliminar todo rastro de suciedad y humedad en la piel.', 50, 75, 85, 20, 30 ,40, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandslash', 'Cuanto más seco es el terreno en el que habita, más duras y lisas se vuelven las púas que le recubren la espalda.', 75, 100, 110, 45, 55, 65, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Hembra', 'Posee un olfato más fino que los machos. Usa los bigotes para recibir la dirección del viento y buscar comida a sotavento de sus depredadores.', 55, 47, 52, 40, 40, 41, 275);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorina', 'Se cree que el cuerno de la frente se le ha atrofiado para evitar herir a sus crías al alimentarlas.', 70, 62, 67, 55, 55, 56, 365);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoqueen', 'Su defensa destaca sobre la capcidad ofensiva. Usa las escamas del cuerpo como una coraza para proteger a su prole de cualquier ataque.', 90, 92, 87, 75, 85, 76, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Macho', 'Mantiene sus grandes orejas levantadas, siempre alerta. Si advierte peligro, ataca inoculando una potente toxina con su cuerno frontal.', 46, 57, 40, 40, 40, 50, 273);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorino', 'Dondequiera que va, parte rocas con su cuerno, más duro que un diamante, en busca de una Piedra Lunar.', 61, 72, 57, 55, 55, 65, 365);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoking', 'Una vez que se desboca, no hay quien lo pare. Solo se calma ante Nidoqueen, su compañera de toda la vida.', 81, 102, 77, 85, 75, 85, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefairy', 'Se dice que la felicidad llegará a quien vea un grupo de Clefairy bailando a la luz de la luna llena.', 70, 45, 48, 60, 65, 35, 323);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefable', 'Este Pokémon de aspecto féerico, raramente visto por los humanos, corrre a esconderse en cuanto detecta que hay alguien cerca.', 95, 70, 73, 95, 90, 60, 483);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vulpix', 'De pequeño, tiene seis colas de gran belleza. A medida que crece, le van saliendo más.', 38, 41, 40, 50, 65, 65, 299);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ninetales', 'Cuentan que llega a vivir hasta mil años y que cada una de las colas posee poderes sobrenaturales.', 73, 76, 75, 81, 100, 100, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jigglypuff', 'Su capacidad pulmonar es excepcional, incluso para un Pokémon. Es capaz de cantar nanas sin cesar hasta que su rival se duerma.', 115, 45, 20, 45, 25, 20, 270);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wigglytuff', 'Cuanto más aire inhala, más aumenta de tamaño. Si se enfada, hincha el cuerpo con el fin de intimidar a su oponente.', 140, 70, 45, 85, 50, 45, 436);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zubat', 'Emite ondas ultrasónicas por la boca para escrutar el entorno, lo que le permite volar con pericia por cuevas angostas.', 40, 45, 35, 30, 40, 55, 245);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golbat', 'Le encanta chuparles la sangre a los seres vivos. En ocasiones comparte la preciada colecta con otros congéneres hambrientos.', 75, 80, 70, 65, 75, 90, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Oddish', 'Se mueve al exponerse a la luz de la luna. Merodea por la noche para esparcir sus semillas.', 45, 50, 55, 75, 65, 30, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gloom', 'Libera un fétido olor por los pistilos. El fuerte hedor hace perder el conocimiento a cualquiera que se encuentre en un radio de 2 km.', 60, 65, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vileplume', 'Tiene los pétalos más grandes del mundo. Al caminar, de ellos se desprenden densas nubes de polen tóxico.', 75, 80, 85, 110, 90, 50, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Paras', 'Escarba en el suelo para extraer nutrientes de las raíces de los árboles, que las setas del lomo absorben después casi por completo.', 35, 70, 55, 45, 55, 25, 285);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Parasect', 'Tras largo tiempo absorbiendo la energía del huésped, la seta parásita del lomo es la que parece controlar la voluntad de este Pokémon.', 60, 95, 80, 60, 80, 30, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venonat', 'Sus grandes ojos actúan como radares. A plena luz se percibe que son, en realidad, grupos de ojos diminutos.', 60, 55, 50, 40, 55, 45, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venomoth', 'Las alas desprenden un polvillo de escamas impregnando de toxinas que se adhiere al contacto y resulta difícil de quitar.', 70, 65, 60, 90, 75, 90, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Diglett', 'Si un Diglett excava un terreno, lo deja perfectamente arado y preparado para sembrado.', 10, 55, 25, 35, 45, 95, 265);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dugtrio', 'Un trío de Diglett. Causa enormes terremotos al cavar en el subsuelo a profundidades de hasta 100 km.', 35, 100, 50, 50, 70, 120, 425);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Meowth', 'Le encanta reunir objetos brillantes. Cuando está de buen humor, hasta le muestra la colección a su Entrenador.', 40, 45, 35, 40, 40, 90, 290);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Persian', 'Trabar amistad con este Pokémon es una ardua tarea debido a su enorme orgullo. Cuando algo no le place, saca las uñas de inmediato.', 65, 70, 60, 65, 65, 115, 440);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Psyduck', 'Siempre padece dolores de cabeza. Tras desatar sus misteriosos poderes, la jaqueca remite unos instantes.', 50, 52, 48, 65, 50, 55, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golduck', 'Habita en ríos de aguas plácidas. Sus largas extremidades le permiten nadar con gracilidad.', 80, 82, 78, 95, 80, 85, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mankey', 'Este ágil Pokémon vive en los árboles. Se enfada con facilidad y, cuando lo hace, se abalanza contra todo lo que se encuentre a su alrededor.', 40, 80, 35, 35, 45, 70, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Primeape', 'Solo se calma cuando no hay nadie cerca, por lo que llegar a ver ese momento resulta verdaderamente difícil.', 65, 105, 60, 60, 70, 95, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Growlithe', 'De naturaleza valiente y honrada, se enfrenta sin miedo a enemigos más grandes y fuertes.', 55, 70, 45, 70, 50, 60, 360);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arcanine', 'Es capaz de correr 10 000 km al días, lo que deja embelesados a todos los que lo ven pasar.', 90, 110, 80, 100, 80, 95, 555);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwag', 'Es más ágil en el agua que en la tierra. La espiral de su vientre no es más que parte de sus vísceras que se ven a través de la piel.', 40, 50, 40, 40, 40, 90, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwhirl', 'Mirar fijamente la espiral de su vientre provoca somnolencia, por lo que puede usarse como alternativa a las nanas para dormir a los niños.', 65, 65, 65, 50, 50, 90, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwrath', 'Su cuerpo es puro músculo. Logra abrirse paso por aguas gélidas partiendo el hielo con sus fornidos brazos.', 90, 95, 95, 70, 90, 70, 510);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Abra', 'Es capaz de usar sus poderes psíquicos aun estando dormido. Al parecer, el contenido del sueño influye en sus facultades.', 25, 20, 15, 105, 55, 90, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kadabra', 'Duerme suspendido en el aire gracias a sus poderes psíquicos. La cola, de una flaxibilidad extraordinaria, hace las veces de almohada.', 40, 35, 30, 120, 70, 105, 400);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Alakazam', 'Posee una capacidad intelectual fuera de lo común que le permite recordar todo lo sucedido desde el instante de su nacimiento.', 55, 50, 45, 135, 95, 120, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machop', 'Es una masa de músculos y, pese a su pequeño tamaño, tiene fuerza de sobra para levantar en brazos a 100 personas.', 70, 80, 50, 35, 35, 35, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machoke', 'Su musculoso cuerpo es tan fuerte que usa un cinto antifuerza para controlar sus movimientos.', 80, 100, 70, 50, 60, 45, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machamp', 'Mueve rápidamente sus cuatro brazos para asestar incesantes golpes y puñetazos desde todos los ángulos.', 90, 130, 80, 65, 85, 55, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bellsprout', 'Prefiere lugares cálidos y húmedos. Atrapa pequeños Pokémon insectos con sus lianas para devorarlos.', 50, 75, 35, 70, 30, 40, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weepinbell', 'Cuando tiene hambre, engulle a todo lo que se mueve. La pobre presa acaba disuelta en sus ácidos.', 65, 90, 50, 85, 45, 55, 390);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Victreebel', 'Atrae a su presa con un dulce aroma a miel. Una vez atrapada en la boca, la disuelve en tan solo un día, huesos incluídos.', 80, 105, 65, 100, 70, 70, 480);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacool', 'Sus facultades natatorias son más bien escasas, por lo que se limita a flotar a la deriva en aguas poco profundas en busca de alimento.', 40, 40, 35, 50, 100, 70, 335);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacruel', 'Si las esferas rojas que tiene a ambos lados de la cabeza brillan con intensidad, indica que está a punto de lanzar ondas ultrasónicas.', 80, 70, 65, 80, 120, 100, 515);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Geodude', 'Se suele encontrar en senderos de montaña y sitios parecidos. Conviene andar con cuidado para no pisarlo sin querer y provocar su enfado.', 40, 80, 100, 30, 30, 20, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Graveler', 'Se le suele ver rodando montaña abajo. No evita los obstáculos, sino que los arrolla.', 55, 95, 115, 45, 45, 35, 390);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golem', 'Nada más mudar la piel, su cuerpo se vuelve blando y blanquecino, pero se endurece al poco tiempo de entrar en contacto con el aire.', 80, 120, 130, 55, 65, 45, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ponyta', 'Al nacer es un poco lento, pero va fortaleciendo las patas paulatinamente al disputar carreras con sos congéneres.', 50, 85, 55, 65, 65, 90, 410);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rapidash', 'Su ardiente crin ondea al viento mientras atraviesa extensas praderas a una velocidad de 240 km/h.', 65, 100, 70, 80, 80, 105, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowpoke', 'Es lento y abstraído. Aunque le devoren la cola, ni siquiera se percata, ya que no siente ningún dolor. Tampoco nota cuando le vuelve a crecer.', 90, 65, 65, 40, 40, 15, 315);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowbro', 'Ha evolucionado después de que lo mordiera un Shellder, al cual le embelesa la sustancia que secreta por la cola.', 95, 75, 110, 100, 80, 30, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magnemite', 'A veces se desploma al suelo tras agotar su suministro eléctrico interno, pero basta una pequeña batería para reanimarlos.', 25, 35, 70, 95, 55, 45, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magneton', 'Este Pokémon surgido de la unión de tres Magnemite, genera potentes ondas de radio con las que examina el entorno.', 50, 60, 95, 120, 70, 70, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Farfetchd', 'Blande el puerro que sujeta con un ala como si se tratase de una espada para rebanar a su rival. En caso de necesidad, se lo come para nutrirse.', 52, 90, 55, 58, 62, 60, 377);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Doduo', 'Las diminutas alas apenas le permiten volar, pero puede correr a gran velocidad gracias a sus patas hiperdesarrolladas.', 35, 85, 45, 35, 35, 75, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dodrio', 'Este Pokémon surge al dividirse una de las cabezas de Doduo. Es capas de correr por las praderas a 60 km/h.', 60, 110, 70, 60, 60, 110, 470);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seel', 'Le encantan los lugares gélidos y disfruta nadando en aguas a temperaturas en torno a los -10 ºC.', 65, 45, 55, 45, 70, 45, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dewgong', 'Su cuerpo es blanco como la nieve. Puede nadar plácidamente en mares gélidos gracias a su resistencia al frío.', 90, 70, 80, 70, 95, 70, 475);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Grimer', 'Está hecho de lodo endurecido. Pocos se atreven a tocarlo debido a su pestilencia y composición nociva. Allá por donde pasa no crece la hierba.', 80, 80, 50, 40, 50, 25, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Muk', 'Huele tan mal que puede provocar desmayos. Su nariz se ha atrofiado de tal manera que ha perdido por completo el sentido del olfato.', 105, 105, 75, 65, 100, 50, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Shellder', 'Nada hacia atrás abriendo y cerrando su concha. Es sorprendentemente rápido.', 30, 65, 100, 45, 25, 40, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cloyster', 'La concha que lo cubre es extremadamente dura, hasta el punto de que ni siquiera una bomba puede destrozarla. Solo se cubre cuando ataca.', 50, 95, 180, 85, 45, 70, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gastly', 'Nació a partir de gases venenosos que asfixiarían a cualquiera que se viera envuelto en ellos.', 30, 35, 30, 100, 35, 80, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Haunter', 'Su lengua está hecha de gas. Si lame a su víctima, esta susfrirá temblores hasta fallecer.', 45, 50, 45, 115, 55, 95, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gengar', 'Las noches de luna llena, a este Pokémon le gusta imitar las sombras de la gente y burlarse de sus miedos.', 60, 65, 60, 130, 75, 110, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Onix', 'Al abrirse paso bajo tierra, va absorbiendo todo lo que encuentra. Eso hace que su cuerpo sea así de sólido.', 35, 45, 160, 30, 45, 70, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Drowzee', 'Si se duerme siempre en compañía de un Pokémon de esta especie, puede mostrar sueños que haya ingerido con anterioridad.', 60, 48, 45, 43, 90, 42, 328);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hypno', 'Conviene evitar el contacto visual en caso de encontrarse con este Pokémon, ya que puede hipnotizar con su péndulo.', 85, 73, 70, 73, 115, 67, 483);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Krabby', 'Es fácil encontrarlo cerca del mar. Las largas pinzas que tiene vuelven a crecer si se las quitan de su sitio.', 30, 105, 90, 25, 25, 50, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kingler', 'La pinza tan grande que tiene posee una fuerza de 10 000 CV, pero le cuesta moverla por su gran tamaño.', 55, 130, 115, 50, 50, 75, 475);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Voltorb', 'Se dice que se camufla como una Poké Ball. Al más mínimo estímulo se autodestruirá.', 40, 30, 50, 55, 55, 100, 330);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electrode', 'Almacena tal cantidad de energía eléctrica en su cuerpo que el más leve impacto puede provocar una gran explosión.', 60, 50, 70, 80, 80, 150, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggcute', 'Pese a su aspecto de mera piña de huevos, se trata de un Pokémon. Al parecer, sus cabezas se comunican entre sí por telepatía.', 60, 40, 80, 60, 45, 40, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggutor', 'Cada una de las tres cabezas piensa de forma independiente y apenas muestra interés por el resto.', 95, 95, 85, 125, 75, 55, 530);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cubone', 'Cuando llora al acordarse de su madre fallecida, su llanto resuena en el cráneo que lleva en la cabeza.', 50, 50, 95, 40, 50, 35, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Marowak', 'Ha evolucionado tras fortalecerse y superar su pena. Ahora lucha con arrojo blandiendo su hueso a modo de arma.', 60, 80, 110, 50, 80, 45, 425);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonlee', 'Este Pokémon tiene un sentido del equilibrio increíble. Puede dar patadas desde cualquier posición.', 50, 120, 53, 35, 110, 87, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonchan', 'Sus puñetazos cortan el aire. Son tan veloces que el mínimo roce podría causar una quemadura.', 50, 105, 79, 35, 110, 76, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lickitung', 'Si sus lametones no se tratan a tiempo, su saliva pegajosa y urticante puede provocar picores persistentes.', 90, 55, 75, 60, 75, 30, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Koffing', 'Su cuerpo está lleno a rebosar de gas venenoso. Acude a los vertederos atraído por el putrefacto olor que emana de los desperdicios.', 40, 65, 95, 60, 45, 35, 340);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weezing', 'Usa sus dos cuerpos para mezclar gases. Según parece, en el pasado podían hallarse ejemplares por todos los rincones de Kanto.', 65, 90, 120, 85, 70, 60, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhyhorn', 'Su inteligencia es limitada, aunque posee una fuerza tan considerable que le permite incluso derribar rascacielos con solo embestirlos.', 80, 85, 95, 30, 30, 25, 345);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhydon', 'Cuando evoluciona, comienza a andar con las patas traseras. Es capaz de horadar rocas con el cuerno que tiene.', 105, 130, 120, 45, 45, 40, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Chansey', 'Los huevos que pone Chansey tienen un valor nutritivo altísimo y un sabor exquisito. Se consideran un manjar.', 250, 5, 5, 35, 105, 50, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tangela', 'Sus lianas no dejan de crecer aunque se le desprendan. Aún se desconoce qué aspecto tiene sin ellas.', 65, 55, 115, 100, 40, 60, 435);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kangaskhan', 'Aunque lleve una cría en el marsupio, su juego de pies no pierde ligereza. Abruma al rival con ráfagas de ágiles puñetazos.', 105, 95, 80, 40, 80, 90, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Horsea', 'Habita en mares de aguas tranquilas. Si se siente en peligro, expulsará por la boca una densa tinta negra para poder huir.', 30, 40, 70, 70, 25, 60, 295);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seadra', 'En esta especie, es el macho quien se ocupa de la prole. Durante la época de cría, el veneno de las púas de su espalda se vuelve más potente.', 55, 65, 95, 95, 45, 85, 440);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Goldeen', 'Sus aletas pectorales, caudal y dorsal ondean gráciles en el agua. Por eso se le llama el Bailarín Acuático.', 45, 67, 60, 35, 50, 63, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seaking', 'En otoño gana algo de peso para atraer a posibles parejas y se cubre de llamativos colores.', 80, 92, 65, 65, 80, 68, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Staryu', 'A finales de verano, se pueden ver grupos de Staryu en la orilla de la playa sincronizando el brillo de sus núcleos a ritmo regular.', 30, 45, 55, 70, 55, 85, 340);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Starmie', 'Su órgano central, conocido como núcleo, brilla con los colores del arcoíris cuando se dispone a liberar usu potentes poderes psíquicos.', 60, 75, 85, 100, 85, 115, 520);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mr Mime', 'Muchos estudiosos sostienen que el desarrollo de sus enormes manos se debe a su afán por practicar la pantomima.', 40, 45, 65, 100, 120, 90, 460);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Scyther', 'Sus guadañas se vuelven más afiladas con cada combate. Es capaz de rebanar troncos gruesos de un tajo.', 70, 110, 80, 55, 80, 105, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jynx', 'En cierta parte de Kanto se conocía a Jynx como la Reina del Hielo y se reverenciaba con cierto temor.', 65, 50, 35, 115, 95, 95, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electabuzz', 'Es habitual que las centrales eléctricas cuenten con Pokémon de tipo Tierra para hacer frente a los Electabuzz ávidos de electricidad.', 65, 83, 57, 95, 85, 105, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magmar', 'Abate a sus presas con las llamas que genera y con frecuencia acaba reduciéndolas a carbonilla por accidente.', 65, 95, 57, 100, 85, 93, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pinsir', 'Los Pinsir se juzgan entre ellos por la robustez de la cornamenta. Cuanto más imponente sea, más agradará a susu congéneres del sexo opuesto.', 65, 125, 100, 55, 70, 85, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tauros', 'Conviene tener cuidado si empieza a fustigarse con las colas, pues es señal de que va a cargar a máxima velocidad.', 75, 100, 95, 40, 70, 110, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magikarp', 'Es el Pokémon más débil y patético que existe, con una fuerza y velocidad prácticamente nulas.', 20, 10, 55, 15, 20, 80, 200);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gyarados', 'Es exageradamente agresivo. El Hiperrayo que lanza por la boca reduce a cenizas todo lo que encuentra.', 95, 125, 79, 60, 100, 81, 540);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lapras', 'Este Pokémon posee una notable inteligencia y un corazón de oro. Entona un canto melodioso mientras surca el mar.', 130, 85, 80, 85, 95, 60, 535);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ditto', 'Redistruye las células de su cuerpo para cobrar la apariencia de lo que ve, pero vuelve a la normalidad al relajarse.', 48, 48, 48, 48, 48, 48, 288);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Eevee', 'Es capaz de alterar la composición de su cuerpo para adaptarse al entorno.', 55, 55, 50, 45, 65, 55, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vaporeon', 'Cuando las aletas de Vaporeon comienzan a vibrar, significa que lloverá en las próximas horas.', 130, 65, 60, 110, 95, 65, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jolteon', 'Si se enfada o asusta, se le eriza el pelaje. Cada uno de sus pelos se convierte en una afilada púa que hace trizas al rival.', 65, 65, 60, 110, 95, 130, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Flareon', 'Una vez que ha almacenado el calor suficiente, puede alcanzar una temperatura de 900 ºC.', 65, 130, 60, 95, 110, 65, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Porygon', 'Se trata del primer Pokémon del mundo creado a partir de códigos de programación gracias al uso de tecnología de vanguardia.', 65, 60, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omanyte', 'Varios ejemplares han escapado o bien han sido liberados tras su restauración, lo que comienza a suscitar una serie de problemas.', 35, 40, 100, 90, 55, 35, 355);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omastar', 'Se cree que se extinguió porque el excesivo tamaño y peso de su concha le impedían moverse con rapidez para capturar presas.', 70, 60, 125, 115, 70, 55, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabuto', 'Un Pokémon casi extinto. Cada tres días, muda el caparazón, que se va endurenciendo de forma progresiva.', 30, 80, 90, 55, 45, 55, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabutops', 'Despedaza a las presas que atrapa para sorber sus fluidos y deja los restos para que otros Pokémon den buena cuenta de ellos.', 60, 115, 105, 65, 70, 80, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Aerodactyl', 'Un feroz Pokémon de la época prehistórica al que no bastan todos los avances tecnológicos actuales para regenerar a la perfección.', 80, 105, 65, 60, 75, 130, 515);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Snorlax', 'No se encuentra satisfecho hasta haber ingerido 400 kg de comida cada día. Cuando acaba de comer, se queda dormido.', 160, 110, 65, 65, 110, 30, 540);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Articuno', 'Se dice que sus bellas alas azules se componen de hielo. Vuela en torno a las montañas nevadas con su larga cola al viento.', 90, 85, 100, 95, 125, 85, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zapdos', 'Posee el poder de controlar la electricidad a su antojo. Según la creencia popular, anida oculto en oscuros nubarrones de tormenta.', 90, 90, 85, 125, 90, 100, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Moltres', 'Una de las aves legendarias. Al batir las alas, las llamas que las envuelven emiten un hermoso fulgor rojo.', 90, 100, 90, 125, 85, 90, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dratini', 'Habita en orillas junto a fuertes corrientes de agua, como bajo cascadas. Muda la piel una y otra vez a medida que crece.', 41, 64, 45, 50, 50, 50, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonair', 'Vive en lagos y mares de aguas cristalinas. Su poder para controlar el clima le permite alzar el vuelo llevado por el viento.', 61, 84, 65, 70, 70, 70, 420);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonite', 'Un Pokémon bondadoso y compasivo al que le resulta imposible dar la espalda a Pokémon o humanos que se encuentren a la deriva.', 91, 134, 95, 100, 100, 80, 600);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mewtwo', 'Su ADN es vasi el mismo que el de Mew. Sin embargo, su tamaño y carácter son muy diferentes.', 106, 110, 90, 154, 90, 130, 680);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mew', 'Si se observa a través de un microscopio, puede distinguirse cuán corto, fino y delicado es el pelaje de este Pokémon.', 100, 100, 100, 100, 100, 100, 600);
--Tabla evolución
INSERT INTO Evolucion (Pokedex, id_pkmn_evo)
VALUES (1, 2),
(2, 3),
(4, 5),
(5, 6),
(7, 8),
(8, 9),
(10, 11),
(11, 12),
(13, 14),
(14, 15),
(16, 17),
(17, 18),
(19, 20),
(21, 22),
(23, 24),
(25, 26),
(27, 28),
(29, 30),
(30, 31),
(32, 33),
(33, 34),
(35, 36),
(37, 38),
(39, 40),
(41, 42),
(43, 44),
(44, 45),
(46, 47),
(48, 49),
(50, 51),
(52, 53),
(54, 55),
(56, 57),
(58, 59),
(60, 61),
(61, 62),
(63, 64),
(64, 65),
(66, 67),
(67, 68),
(69, 70),
(70, 71),
(72, 73),
(74, 75),
(75, 76),
(77, 78),
(79, 80),
(81, 82),
(84, 85),
(86, 87),
(88, 89),
(90, 91),
(92, 93),
(93, 94),
(96, 97),
(98, 99),
(100, 101),
(102, 103),
(104, 105),
(109, 110),
(111, 112),
(116, 117),
(118, 119),
(120, 121),
(129, 130),
(133, 134),
(133, 135),
(133, 136),
(138, 139),
(140, 141),
(147, 148),
(148, 149);
---------Tabla Tipos----------
INSERT INTO Pokemon_Tipo
VALUES (1, 12),
(1, 17),
(2, 12),
(2, 17),
(3, 12),
(3, 17),
(4, 7),
(5, 7),
(6, 7),
(6, 18),
(7, 2),
(8, 2),
(9, 2),
(10, 3),
(11, 3),
(12, 3),
(12, 18),
(13, 3),
(13, 17),
(14, 3),
(14, 17),
(15, 3),
(15, 17),
(16, 11),
(16, 18),
(17, 11),
(17, 18),
(18, 11),
(18, 18),
(19, 11),
(20, 11),
(21, 11),
(21, 18),
(22, 11),
(22, 18),
(23, 17),
(24, 17),
(25, 5),
(26, 5),
(27, 16),
(28, 16),
(29, 17),
(30, 17),
(31, 17),
(31, 16),
(32, 17),
(33, 17),
(34, 17),
(34, 16),
(35, 8),
(36, 8),
(37, 7),
(38, 7),
(39, 11),
(39, 8),
(40, 11),
(40, 8),
(41, 17),
(41, 18),
(42, 17),
(42, 18),
(43, 12),
(43, 17),
(44, 12),
(44, 17),
(45, 12),
(45, 17),
(46, 3),
(46, 12),
(47, 3),
(47, 12),
(48, 3),
(48, 17),
(49, 3),
(49, 17),
(50, 16),
(51, 16),
(52, 11),
(53, 11),
(54, 2),
(55, 2),
(56, 10),
(57, 10),
(58, 7),
(59, 7),
(60, 2),
(61, 2),
(62, 2),
(62, 10),
(63, 13),
(64, 13),
(65, 13),
(66, 10),
(67, 10),
(68, 10),
(69, 12),
(69, 17),
(70, 12),
(70, 17),
(71, 12),
(71, 17),
(72, 2),
(72, 17),
(73, 2),
(73, 17),
(74, 14),
(74, 16),
(75, 14),
(75, 16),
(76, 14),
(76, 16),
(77, 7),
(78, 7),
(79, 2),
(79, 13),
(80, 2),
(80, 13),
(81, 5),
(81, 1),
(82, 5),
(82, 1),
(83, 11),
(83, 18),
(84, 11),
(84, 18),
(85, 11),
(85, 18),
(86, 2),
(87, 2),
(87, 9),
(88, 17),
(89, 17),
(90, 2),
(91, 2),
(91, 9),
(92, 6),
(92, 17),
(93, 6),
(93, 17),
(94, 6),
(94, 17),
(95, 14),
(95, 16),
(96, 13),
(97, 13),
(98, 2),
(99, 2),
(100, 5),
(101, 5),
(102, 12),
(102, 13),
(103, 12),
(103, 13),
(104, 16),
(105, 16),
(106, 10),
(107, 10),
(108, 11),
(109, 17),
(110, 17),
(111, 14),
(111, 16),
(112, 14),
(112, 16),
(113, 11),
(114, 12),
(115, 11),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(121, 13),
(122, 13),
(122, 8),
(123, 3),
(123, 18),
(124, 9),
(124, 13),
(125, 5),
(126, 7),
(127, 3),
(128, 11),
(129, 2),
(130, 2),
(130, 18),
(131, 2),
(131, 9),
(132, 11),
(133, 11),
(134, 2),
(135, 5),
(136, 7),
(137, 11),
(138, 14),
(138, 2),
(139, 14),
(139, 2),
(140, 14),
(140, 2),
(141, 14),
(141, 2),
(142, 14),
(142, 18),
(143, 11),
(144, 9),
(144, 18),
(145, 5),
(145, 18),
(146, 7),
(146, 18),
(147, 4),
(148, 4),
(149, 4),
(149, 18),
(150, 13),
(151, 13);
--Tabla iniciales
INSERT INTO Iniciales (id_prof, Pokedex, id_region)
VALUES (1, 1, 1),
(1, 4, 1),
(1, 7, 1);
--Tabla ciudades
INSERT INTO Ciudades (Nombre, id_region, info)
VALUES ('Pueblo Paleta', 1, 'Pequeño pueblo situado en el suroeste de Kanto. Aquí se encuentra el laboratorio del Profesor Oak. Su lema es: <<Blanco, el color de partida.>>'),
('Ciudad Verde', 1, 'Pequeña ciudad situada en el suroeste de Kanto. Aquí se encuentra el último gimnasio antes de acceder a la Liga Pokémon, se dice que el líder de gimnasio y sus Pokémon Tipo Tierra ocultan algo oscuro. Su lema es: <<La ciudad eternamente verde.>>'),
('Ciudad Plateada', 1, 'Ciudad situada en el noroeste de Kanto. Te espera el primer desafío de la Liga Pokémon, Brock, el entrenador de Tipo Roca. Su lema es: <<Ciudad de riscos inaccesibles.>>'),
('Ciudad Celeste', 1, 'Ciudad costera situada en el norte de Kanto. La líder de Tipo Agua, Misty, te golpeará como un tsunami. Su lema es: <<La ciudad floreciente de agua.>>'),
('Ciudad Carmín', 1, 'Ciudad situada en la cosra de una bahía en el suroeste de Kanto donde podemos encontrar el puerto en el que atracan cruceros como el SS Anne. Tendrás que sobrevivir a una tormenta para conseguir la Medalla Trueno de manos del Teniente Surge. Su lema es: <<El puerto del ocaso.>>'),
('Pueblo Lavanda', 1, 'Pueblo situado en el noreste de Kanto. Aquí se encuentra la Torre Pokémon, edificio por el cual se vela por las almas de los Pokémon muertos. Si algún Pokémon con sueño profundo bloquea tu camino, aquí puedes conseguir la Poké Flauta para despertarlo, pero ten cuidado, puede tener un mal despertar. Su lema es: <<La ciudad que emana nobleza.>>'),
('Ciudad Azulona', 1, 'Ciudad situada en el centro de Kanto. Es la ciudad más habitada de la región, aunque no es la más grande en extensión. Es el hogar de Erika, la cuarta líder de Tipo Planta a la que enfrentarás en tu aventura hacia la Liga Pokémon.'),
('Ciudad Fucsia', 1, ''),
('Ciudad Azafrán', 1, ''),
('Isla Canela', 1, ''),
('Meseta Añil', 1, '');
--Tabla Líderes
INSERT INTO Lideres (Nombre, info, Medalla, id_ciudad)
VALUES ('Brock', 'Medalla Roca', 3),
('Misty', 'Medalla Cascada', 4),
('Lt. Surge', 'Medalla Trueno', 7),
('Erika', 'Medalla Arcoíris', 8),
('Koga', 'Medalla Alma', 9),
('Sabrina', 'Medalla Pantano', 6),
('Blaine', 'Medalla Volcán', 10),
('Giovanni', 'Medalla Tierra', 2);
--Tabla lider_pokemon
INSERT INTO Pokemon_Lider (id_lider, Pokedex)
VALUES (1, 74),
(1, 95),
(2, 120),
(2, 121),
(3, 26),
(4, 70),
(4, 114),
(4, 44),
(5, 48),
(5, 48),
(5, 48),
(5, 49),
(6, 63),
(6, 64),
(6, 65),
(7, 38),
(7, 78),
(7, 59),
(8, 53),
(8, 51),
(8, 34),
(8, 31),
(8, 112);
--Tabla rutas
INSERT INTO Rutas (Número, id_region)
VALUES ('Ruta 1', 1),
('Ruta 2', 1),
('Ruta 3', 1),
('Ruta 4', 1),
('Ruta 5', 1),
('Ruta 6', 1),
('Ruta 7', 1),
('Ruta 8', 1),
('Ruta 9', 1),
('Ruta 10', 1),
('Ruta 11', 1),
('Ruta 12', 1),
('Ruta 13', 1),
('Ruta 14', 1),
('Ruta 15', 1),
('Ruta 16', 1),
('Ruta 17', 1),
('Ruta 18', 1),
('Ruta 19', 1),
('Ruta 20', 1),
('Ruta 21', 1),
('Ruta 22', 1),
('Ruta 23', 1),
('Ruta 24', 1),
('Ruta 25', 1);
--Tabla LugaresImportantes
INSERT INTO LugaresImp (Nombre, id_region, info)
VALUES ('Bosque Verde', 1),
('Monte Moon', 1),
('Cueva Celeste', 1),
('Túnel Roca', 1),
('Central Energía', 1),
('Torre Pokémon', 1),
('Cueva Diglett', 1),
('Zona Safari', 1),
('Mansión Pokemon', 1),
('Islas Espuma', 1),
('Calle Victoria', 1),
('Meseta Añil', 1);
--Tabla RutaPokemon
INSERT INTO Ruta_Pokemon (id_ruta, Pokedex)
VALUES (1, 16),
(1, 19),
(2, 16),
(2, 19),
(2, 29),
(2, 32),
(3, 21),
(3, 19),
(3, 27),
(3, 56),
(4, 21),
(4, 19),
(4, 27),
(4, 56),
(5, 16),
(5, 19),
(5, 63),
(5, 39),
(5, 17),
(6, 16),
(6, 19),
(6, 63),
(6, 39),
(6, 17),
(6, 54),
(6, 55),
(6, 129),
(6, 60),
(6, 118),
(7, 16),
(7, 19),
(7, 63),
(7, 39),
(7, 17),
(8, 16),
(8, 19),
(8, 63),
(8, 39),
(8, 17),
(8, 64),
(9, 32),
(9, 29),
(9, 19),
(9, 21),
(9, 33),
(9, 30),
(9, 20),
(9, 22),
(10, 81),
(10, 19),
(10, 29),
(10, 32),
(10, 20),
(10, 66),
(10, 129),
(10, 60),
(10, 118),
(10, 98),
(10, 116),
(10, 99),
(11, 16),
(11, 19),
(11, 96),
(11, 17),
(11, 20),
(11, 129),
(11, 60),
(11, 118),
(11, 72),
(11, 116),
(12, 16),
(12, 17),
(12, 43),
(12, 44),
(12, 69),
(12, 70),
(12, 83),
(12, 79),
(12, 80),
(12, 129),
(12, 60),
(12, 118),
(12, 116),
(12, 117),
(13, 16),
(13, 17),
(13, 43),
(13, 44),
(13, 69),
(13, 70),
(13, 83),
(13, 79),
(13, 80),
(13, 129),
(13, 60),
(13, 118),
(13, 116),
(13, 117),
(13, 72),
(14, 17),
(14, 43),
(14, 44),
(14, 48),
(14, 49),
(14, 69),
(14, 70),
(15, 17),
(15, 43),
(15, 44),
(15, 48),
(15, 49),
(15, 69),
(15, 70),
(16, 19),
(16, 20),
(16, 21),
(16, 22),
(16, 84),
(17, 22),
(17, 77),
(17, 84),
(17, 85),
(17, 129),
(17, 60),
(17, 118),
(17, 72),
(17, 90),
(18, 19),
(18, 20),
(18, 21),
(18, 22),
(18, 84),
(18, 129),
(18, 60),
(18, 118),
(18, 72),
(18, 90),
(19, 129),
(19, 60),
(19, 118),
(19, 72),
(19, 73),
(19, 120),
(20, 129),
(20, 60),
(20, 118),
(20, 72),
(20, 73),
(20, 120),
(21, 16),
(21, 17),
(21, 19),
(21, 20),
(21, 129),
(21, 60),
(21, 118),
(21, 72),
(21, 73),
(21, 120),
(22, 19),
(22, 21),
(22, 29),
(22, 32),
(22, 56),
(22, 129),
(22, 60),
(22, 61),
(22, 118),
(23, 22),
(23, 30),
(23, 33),
(23, 56),
(23, 57),
(23, 129),
(23, 118),
(23, 60),
(23, 61),
(24, 16),
(24, 17),
(24, 43),
(24, 48),
(24, 69),
(24, 129),
(24, 60),
(24, 118),
(24, 119),
(24, 151),
(25, 16),
(25, 17),
(25, 43),
(25, 48),
(25, 69),
(25, 129),
(25, 60),
(25, 118),
(25, 98),
(25, 99);
--Tabla LugarImpoPokemon
INSERT INTO LugaresImp_Pokemon (id_lugarimp, Pokedex)
VALUES (1, 10),
(1, 11),
(1, 16),
(1, 17),
(2, 41),
(2, 74),
(2, 27),
(2, 35),
(2, 46),
(3, 28),
(3, 42),
(3, 44),
(3, 47),
(3, 49),
(3, 70),
(3, 75),
(3, 132),
(3, 129),
(3, 60),
(3, 118),
(3, 119),
(3, 150),
(4, 41),
(4, 74),
(4, 66),
(4, 95),
(5, 81),
(5, 82),
(5, 100),
(5, 88),
(5, 89),
(5, 145),
(6, 92),
(6, 93),
(6, 104),
(7, 50),
(7, 51),
(8, 29),
(8, 30),
(8, 32),
(8, 33),
(8, 46),
(8, 47),
(8, 102),
(8, 111),
(8, 113),
(8, 114),
(8, 129),
(8, 60),
(8, 118),
(8, 147),
(8, 148),
(8, 104),
(8, 105),
(8, 123),
(8, 128),
(8, 115),
(8, 127),
(9, 19),
(9, 20),
(9, 58),
(9, 88),
(9, 89),
(9, 132),
(10, 41),
(10, 42),
(10, 98),
(10, 99),
(10, 79),
(10, 80),
(10, 86),
(10, 87),
(10, 72),
(10, 120),
(10, 129),
(10, 60),
(10, 118),
(10, 144),
(11, 74),
(11, 75),
(11, 95),
(11, 41),
(11, 42),
(11, 67),
(11, 146);
--Tabla Jaime Altomando
INSERT INTO AltoMando (Nombre, info, id_lugarimp)
VALUES ('Lorelei', 12),
('Bruno', 12),
('Agatha', 12),
('Lance', 12),
('Azul', 12);
--Tabla AltomandoPokémon
INSERT INTO AltoMando_Pokemon (id_alto, Pokedex)
VALUES (1, 87),
(1, 91),
(1, 80),
(1, 124),
(1, 131),
(2, 95),
(2, 107),
(2, 106),
(2, 95),
(2, 68),
(3, 94),
(3, 94),
(3, 93),
(3, 42),
(3, 24),
(4, 130),
(4, 148),
(4, 148),
(4, 149),
(4, 142),
(5, 28),
(5, 65),
(5, 103),
(5, 91),
(5, 38),
(5, 135);
--Se acabaron las tablas
