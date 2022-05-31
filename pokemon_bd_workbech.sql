CREATE DATABASE IF NOT EXISTS pokerescate;
USE pokerescate;
-- -------------------------------------------LAS TABLAS-------------------------------------

CREATE TABLE Tipos (
    id_tipo TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15) UNIQUE
);

CREATE TABLE Pokemon (
    id_pkmn SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    info LONGTEXT,
    altura DEC (6,2),
    peso DEC (6,2),
    adoptado ENUM ('Sí', 'No')
);

CREATE TABLE Ciudad (
	id_ciudad SMALLINT(2) AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30) UNIQUE
);

CREATE TABLE Poke_Ciudad (
	id_pkmn SMALLINT(3),
    id_ciudad SMALLINT(2),
    CONSTRAINT pokemon_fk1 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT ciudad_fk FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
    PRIMARY KEY (id_pkmn, id_ciudad)
);

CREATE TABLE Evolucion (
    id_pkmn SMALLINT(3),
    id_pkmn_evo SMALLINT(3),
    CONSTRAINT pokemon_fk2 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT pokemon_fk3 FOREIGN KEY (id_pkmn_evo) REFERENCES Pokemon(id_pkmn),
    PRIMARY KEY (id_pkmn, id_pkmn_evo)
);

CREATE TABLE Pokemon_Tipo (
    id_pkmn SMALLINT(3),
    id_tipo TINYINT,
    CONSTRAINT pkmn_fk4 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT tipo_fk FOREIGN KEY (id_tipo) REFERENCES Tipos(id_tipo),
    PRIMARY KEY (id_pkmn, id_tipo)
);

CREATE TABLE Usuarios (
	DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    NomUsu VARCHAR(35) UNIQUE,
    Contra VARCHAR(32),
    tlf INT(9) UNIQUE,
    email VARCHAR(50) UNIQUE,
    activo ENUM ('Sí', 'No'),
    id_ciudad SMALLINT(2),
    CONSTRAINT ciudad_fk2 FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
    CONSTRAINT unic_usu UNIQUE (NomUsu, tlf, email)
);

CREATE TABLE UsuPoke (
	DNI VARCHAR(9),
    id_pkmn SMALLINT(3),
    CONSTRAINT dni_fk FOREIGN KEY (DNI) REFERENCES Usuarios(DNI),
    CONSTRAINT pokemon_fk5 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    PRIMARY KEY (DNI, id_pkmn)
);

-- ------------------------------------LOS INSERTS -------------------------------------------
-- id_tipo, nombre
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
-- 1º Gen
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Bulbasaur', 'Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo.', 0.7, 6.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Ivysaur', 'Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre las patas traseras.', 1, 13, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Venusaur', 'La planta florece cuando absorbe energía solar, lo cual le obliga a buscar siempre la luz del sol.', 2, 100, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Charmander', 'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.', 0.6, 8.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Charmeleon', 'Este Pokémon de naturaleza agresiva ataca en combate con su cola llameante y hace trizas al rival con sus afiladas garras.', 1.1, 19, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Charizard', 'Escupe un fuego tan caliente que funde las rocas. Causa incendios forestales sin querer.', 1.7, 90.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Squirtle', 'Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble.', 0.5, 9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Wartortle', 'Se lo considera un símbolo de longevidad. Los ejemplares más ancianos tienen musgo sobre el caparazón.', 1, 22.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Blastoise', 'Para acabar con su enemigo, lo aplasta con el peso de su cuerpo. En momentos de apuro, se esconde en el caparazón.', 1.6, 85.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Caterpie', 'Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos.', 0.3, 2.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Metapod', 'Como en este estado solo puede endurecer su coraza, permanece inmóvil a la espera de evolucionar.', 0.7, 9.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Butterfree', 'Aletea a gran velocidad para lanzar al aire sus escamas extremadamente tóxicas.', 1.1, 32, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Weedle', 'El aguijón de la cabeza es muy puntiagudo. Se alimenta de hojas oculto en la espesura de bosques y praderas.', 0.3, 3.2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kakuna', 'Aunque es casi incapaz de moverse, en caso de sentirse amenazado puede envenenar a los enemigos con su aguijón.', 0.6, 10, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Beedrill', 'Tiene tres aguijones venenosos, dos en las patas anteriores y uno en la parte baja del abdomen, con los que ataca a sus enemigos una y otra vez.', 1, 29.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Pidgey', 'Su docilidad es tal que suelen defenderse levantando arena en lugar de contraatacar.', 0.3, 1.8, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Pidgeotto', 'Su extraordinaria vitalidad y resistencia le permiten cubrir grandes distancias del territorio que habita en busca de presas.', 1.1, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Pidgeot', 'Este Pokémon vuela a una velocidad de 2 match en busca de presas. Sus grandes garras son armas muy peligrosas.', 1.5, 39.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Rattata', 'Es propenso a hincar los incisivos en cualquier cosa que se le ponga por delante. Si se ve alguno, seguramente haya cuarenta cerca.', 0.3, 3.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Raticate', 'Gracias a las pequeñas membranas de las patas traseras, puede nadar por los ríos para capturar presas.', 0.7, 18.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Spearow', 'A la hora de proteger su territorio, compensa su incapacidad para volar a gran altura con una increíble velocidad.', 0.3, 2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Fearow', 'Este Pokémon ha existido desde tiempos remotos. Al menor atisbo de peligro, alza el vuelo y huye.', 1.2, 38, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Ekans', 'La longitud de este Pokémon aumenta con el tiempo. Por la noche, se enrosca en las ramas de los árboles para descansar.', 2, 6.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Arbok', 'Se han llegado a identificar hasta seis variaciones distintas de las espeluznantes dibujos de su piel.', 3.5, 65, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Pikachu', 'Cuanto más potente es la energía que genera este Pokémon, más suaves y elásticas se vuelven las bolsas de sus mejillas.', 0.4, 6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Raichu', 'Su larga cola le sirve como toma de tierra para protegerse a sí mismo del alto voltaje que genera su cuerpo.', 0.8, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Sandshrew', 'Le gusta revolcarse por la arena seca para eliminar todo rastro de suciedad y humedad en la piel.', 0.6, 12, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Sandslash', 'Cuanto más seco es el terreno en el que habita, más duras y lisas se vuelven las púas que le recubren la espalda.', 1, 29.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidoran H', 'Posee un olfato más fino que los machos. Usa los bigotes para recibir la dirección del viento y buscar comida a sotavento de sus depredadores.', 0.4, 7, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidorina', 'Se cree que el cuerno de la frente se le ha atrofiado para evitar herir a sus crías al alimentarlas.', 0.8, 20, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidoqueen', 'Su defensa destaca sobre la capcidad ofensiva. Usa las escamas del cuerpo como una coraza para proteger a su prole de cualquier ataque.', 1.3, 60, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidoran M', 'Mantiene sus grandes orejas levantadas, siempre alerta. Si advierte peligro, ataca inoculando una potente toxina con su cuerno frontal.', 0.5, 9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidorino', 'Dondequiera que va, parte rocas con su cuerno, más duro que un diamante, en busca de una Piedra Lunar.', 0.9, 19.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Nidoking', 'Una vez que se desboca, no hay quien lo pare. Solo se calma ante Nidoqueen, su compañera de toda la vida.', 1.4, 62, 'Sí');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Clefairy', 'Se dice que la felicidad llegará a quien vea un grupo de Clefairy bailando a la luz de la luna llena.', 0.6, 7.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Clefable', 'Este Pokémon de aspecto féerico, raramente visto por los humanos, corrre a esconderse en cuanto detecta que hay alguien cerca.', 1.3, 40, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Vulpix', 'De pequeño, tiene seis colas de gran belleza. A medida que crece, le van saliendo más.', 0.6, 9.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Ninetales', 'Cuentan que llega a vivir hasta mil años y que cada una de las colas posee poderes sobrenaturales.', 1.1, 19.9, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Jigglypuff', 'Su capacidad pulmonar es excepcional, incluso para un Pokémon. Es capaz de cantar nanas sin cesar hasta que su rival se duerma.', 0.5, 5.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado)  
VALUES ('Wigglytuff', 'Cuanto más aire inhala, más aumenta de tamaño. Si se enfada, hincha el cuerpo con el fin de intimidar a su oponente.', 1, 12, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Zubat', 'Emite ondas ultrasónicas por la boca para escrutar el entorno, lo que le permite volar con pericia por cuevas angostas.', 0.8, 7.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Golbat', 'Le encanta chuparles la sangre a los seres vivos. En ocasiones comparte la preciada colecta con otros congéneres hambrientos.', 1.6, 55, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Oddish', 'Se mueve al exponerse a la luz de la luna. Merodea por la noche para esparcir sus semillas.', 0.5, 5.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Gloom', 'Libera un fétido olor por los pistilos. El fuerte hedor hace perder el conocimiento a cualquiera que se encuentre en un radio de 2 km.', 0.8, 8.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Vileplume', 'Tiene los pétalos más grandes del mundo. Al caminar, de ellos se desprenden densas nubes de polen tóxico.', 1.2, 18.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Paras', 'Escarba en el suelo para extraer nutrientes de las raíces de los árboles, que las setas del lomo absorben después casi por completo.', 0.3, 5.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Parasect', 'Tras largo tiempo absorbiendo la energía del huésped, la seta parásita del lomo es la que parece controlar la voluntad de este Pokémon.', 1, 29.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Venonat', 'Sus grandes ojos actúan como radares. A plena luz se percibe que son, en realidad, grupos de ojos diminutos.', 1, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Venomoth', 'Las alas desprenden un polvillo de escamas impregnando de toxinas que se adhiere al contacto y resulta difícil de quitar.', 1.5, 12.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Diglett', 'Si un Diglett excava un terreno, lo deja perfectamente arado y preparado para sembrado.', 0.2, 0.8, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dugtrio', 'Un trío de Diglett. Causa enormes terremotos al cavar en el subsuelo a profundidades de hasta 100 km.', 0.7, 33.3, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Meowth', 'Le encanta reunir objetos brillantes. Cuando está de buen humor, hasta le muestra la colección a su Entrenador.', 0.4, 4.2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Persian', 'Trabar amistad con este Pokémon es una ardua tarea debido a su enorme orgullo. Cuando algo no le place, saca las uñas de inmediato.', 1, 32, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Psyduck', 'Siempre padece dolores de cabeza. Tras desatar sus misteriosos poderes, la jaqueca remite unos instantes.', 0.8, 19.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Golduck', 'Habita en ríos de aguas plácidas. Sus largas extremidades le permiten nadar con gracilidad.', 1.7, 76.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Mankey', 'Este ágil Pokémon vive en los árboles. Se enfada con facilidad y, cuando lo hace, se abalanza contra todo lo que se encuentre a su alrededor.', 0.5, 28, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Primeape', 'Solo se calma cuando no hay nadie cerca, por lo que llegar a ver ese momento resulta verdaderamente difícil.', 1, 32, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Growlithe', 'De naturaleza valiente y honrada, se enfrenta sin miedo a enemigos más grandes y fuertes.', 0.7, 19, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Arcanine', 'Es capaz de correr 10 000 km al día, lo que deja embelesados a todos los que lo ven pasar.', 1.9, 155, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Poliwag', 'Es más ágil en el agua que en la tierra. La espiral de su vientre no es más que parte de sus vísceras que se ven a través de la piel.', 0.6, 12.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Poliwhirl', 'Mirar fijamente la espiral de su vientre provoca somnolencia, por lo que puede usarse como alternativa a las nanas para dormir a los niños.', 1, 20, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Poliwrath', 'Su cuerpo es puro músculo. Logra abrirse paso por aguas gélidas partiendo el hielo con sus fornidos brazos.', 1.3, 54, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Abra', 'Es capaz de usar sus poderes psíquicos aun estando dormido. Al parecer, el contenido del sueño influye en sus facultades.', 0.9, 19.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kadabra', 'Duerme suspendido en el aire gracias a sus poderes psíquicos. La cola, de una flaxibilidad extraordinaria, hace las veces de almohada.', 1.3, 56.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Alakazam', 'Posee una capacidad intelectual fuera de lo común que le permite recordar todo lo sucedido desde el instante de su nacimiento.', 1.5, 48, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Machop', 'Es una masa de músculos y, pese a su pequeño tamaño, tiene fuerza de sobra para levantar en brazos a 100 personas.', 0.8, 19.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Machoke', 'Su musculoso cuerpo es tan fuerte que usa un cinto antifuerza para controlar sus movimientos.', 1.5, 70.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Machamp', 'Mueve rápidamente sus cuatro brazos para asestar incesantes golpes y puñetazos desde todos los ángulos.', 1.6, 130, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Bellsprout', 'Prefiere lugares cálidos y húmedos. Atrapa pequeños Pokémon insectos con sus lianas para devorarlos.', 0.7, 4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Weepinbell', 'Cuando tiene hambre, engulle a todo lo que se mueve. La pobre presa acaba disuelta en sus ácidos.', 1, 6.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Victreebel', 'Atrae a su presa con un dulce aroma a miel. Una vez atrapada en la boca, la disuelve en tan solo un día, huesos incluídos.', 1.7, 15.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Tentacool', 'Sus facultades natatorias son más bien escasas, por lo que se limita a flotar a la deriva en aguas poco profundas en busca de alimento.', 0.9, 45.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Tentacruel', 'Si las esferas rojas que tiene a ambos lados de la cabeza brillan con intensidad, indica que está a punto de lanzar ondas ultrasónicas.', 1.6, 55, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Geodude', 'Se suele encontrar en senderos de montaña y sitios parecidos. Conviene andar con cuidado para no pisarlo sin querer y provocar su enfado.', 0.4, 20, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Graveler', 'Se le suele ver rodando montaña abajo. No evita los obstáculos, sino que los arrolla.', 1, 105, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Golem', 'Nada más mudar la piel, su cuerpo se vuelve blando y blanquecino, pero se endurece al poco tiempo de entrar en contacto con el aire.', 1.4, 300, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Ponyta', 'Al nacer es un poco lento, pero va fortaleciendo las patas paulatinamente al disputar carreras con sos congéneres.', 1, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Rapidash', 'Su ardiente crin ondea al viento mientras atraviesa extensas praderas a una velocidad de 240 km/h.', 1.7, 95, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Slowpoke', 'Es lento y abstraído. Aunque le devoren la cola, ni siquiera se percata, ya que no siente ningún dolor. Tampoco nota cuando le vuelve a crecer.', 1.2, 36, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Slowbro', 'Ha evolucionado después de que lo mordiera un Shellder, al cual le embelesa la sustancia que secreta por la cola.', 1.6, 78.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Magnemite', 'A veces se desploma al suelo tras agotar su suministro eléctrico interno, pero basta una pequeña batería para reanimarlos.', 0.3, 6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Magneton', 'Este Pokémon surgido de la unión de tres Magnemite, genera potentes ondas de radio con las que examina el entorno.', 1, 60, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Farfetchd', 'Blande el puerro que sujeta con un ala como si se tratase de una espada para rebanar a su rival. En caso de necesidad, se lo come para nutrirse.', 0.8, 15, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Doduo', 'Las diminutas alas apenas le permiten volar, pero puede correr a gran velocidad gracias a sus patas hiperdesarrolladas.', 1.4, 39.2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dodrio', 'Este Pokémon surge al dividirse una de las cabezas de Doduo. Es capas de correr por las praderas a 60 km/h.', 1.8, 85.2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Seel', 'Le encantan los lugares gélidos y disfruta nadando en aguas a temperaturas en torno a los -10 ºC.', 1.1, 90, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dewgong', 'Su cuerpo es blanco como la nieve. Puede nadar plácidamente en mares gélidos gracias a su resistencia al frío.', 1.7, 120, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Grimer', 'Está hecho de lodo endurecido. Pocos se atreven a tocarlo debido a su pestilencia y composición nociva. Allá por donde pasa no crece la hierba.', 0.9, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Muk', 'Huele tan mal que puede provocar desmayos. Su nariz se ha atrofiado de tal manera que ha perdido por completo el sentido del olfato.', 1.2, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Shellder', 'Nada hacia atrás abriendo y cerrando su concha. Es sorprendentemente rápido.', 0.3, 4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Cloyster', 'La concha que lo cubre es extremadamente dura, hasta el punto de que ni siquiera una bomba puede destrozarla. Solo se cubre cuando ataca.', 1.5, 132.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Gastly', 'Nació a partir de gases venenosos que asfixiarían a cualquiera que se viera envuelto en ellos.', 1.3, 0.1, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Haunter', 'Su lengua está hecha de gas. Si lame a su víctima, esta susfrirá temblores hasta fallecer.', 1.6, 0.1, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Gengar', 'Las noches de luna llena, a este Pokémon le gusta imitar las sombras de la gente y burlarse de sus miedos.', 1.5, 40.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Onix', 'Al abrirse paso bajo tierra, va absorbiendo todo lo que encuentra. Eso hace que su cuerpo sea así de sólido.', 8.8, 210, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Drowzee', 'Si se duerme siempre en compañía de un Pokémon de esta especie, puede mostrar sueños que haya ingerido con anterioridad.', 1, 32.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Hypno', 'Conviene evitar el contacto visual en caso de encontrarse con este Pokémon, ya que puede hipnotizar con su péndulo.', 1.6, 75.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Krabby', 'Es fácil encontrarlo cerca del mar. Las largas pinzas que tiene vuelven a crecer si se las quitan de su sitio.', 0.4, 6.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kingler', 'La pinza tan grande que tiene posee una fuerza de 10 000 CV, pero le cuesta moverla por su gran tamaño.', 1.3, 60, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Voltorb', 'Se dice que se camufla como una Poké Ball. Al más mínimo estímulo se autodestruirá.', 0.5, 10.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Electrode', 'Almacena tal cantidad de energía eléctrica en su cuerpo que el más leve impacto puede provocar una gran explosión.', 1.2, 66.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Exeggcute', 'Pese a su aspecto de mera piña de huevos, se trata de un Pokémon. Al parecer, sus cabezas se comunican entre sí por telepatía.', 0.4, 2.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Exeggutor', 'Cada una de las tres cabezas piensa de forma independiente y apenas muestra interés por el resto.', 2, 120, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Cubone', 'Cuando llora al acordarse de su madre fallecida, su llanto resuena en el cráneo que lleva en la cabeza.', 0.4, 6.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Marowak', 'Ha evolucionado tras fortalecerse y superar su pena. Ahora lucha con arrojo blandiendo su hueso a modo de arma.', 1, 45, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Hitmonlee', 'Este Pokémon tiene un sentido del equilibrio increíble. Puede dar patadas desde cualquier posición.', 1.5, 49.8, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Hitmonchan', 'Sus puñetazos cortan el aire. Son tan veloces que el mínimo roce podría causar una quemadura.', 1.4, 50.2, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Lickitung', 'Si sus lametones no se tratan a tiempo, su saliva pegajosa y urticante puede provocar picores persistentes.', 1.2, 65.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Koffing', 'Su cuerpo está lleno a rebosar de gas venenoso. Acude a los vertederos atraído por el putrefacto olor que emana de los desperdicios.', 0.6, 1, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Weezing', 'Usa sus dos cuerpos para mezclar gases. Según parece, en el pasado podían hallarse ejemplares por todos los rincones de Kanto.', 1.2, 9.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Rhyhorn', 'Su inteligencia es limitada, aunque posee una fuerza tan considerable que le permite incluso derribar rascacielos con solo embestirlos.', 1, 115, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Rhydon', 'Cuando evoluciona, comienza a andar con las patas traseras. Es capaz de horadar rocas con el cuerno que tiene.', 1.9, 120, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Chansey', 'Los huevos que pone Chansey tienen un valor nutritivo altísimo y un sabor exquisito. Se consideran un manjar.', 1.1, 34.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Tangela', 'Sus lianas no dejan de crecer aunque se le desprendan. Aún se desconoce qué aspecto tiene sin ellas.', 1, 35, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kangaskhan', 'Aunque lleve una cría en el marsupio, su juego de pies no pierde ligereza. Abruma al rival con ráfagas de ágiles puñetazos.', 2.2, 80, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Horsea', 'Habita en mares de aguas tranquilas. Si se siente en peligro, expulsará por la boca una densa tinta negra para poder huir.', 0.4, 8, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Seadra', 'En esta especie, es el macho quien se ocupa de la prole. Durante la época de cría, el veneno de las púas de su espalda se vuelve más potente.', 1.2, 25, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Goldeen', 'Sus aletas pectorales, caudal y dorsal ondean gráciles en el agua. Por eso se le llama el Bailarín Acuático.', 0.6, 15, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Seaking', 'En otoño gana algo de peso para atraer a posibles parejas y se cubre de llamativos colores.', 1.3, 39, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Staryu', 'A finales de verano, se pueden ver grupos de Staryu en la orilla de la playa sincronizando el brillo de sus núcleos a ritmo regular.', 0.8, 34.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Starmie', 'Su órgano central, conocido como núcleo, brilla con los colores del arcoíris cuando se dispone a liberar usu potentes poderes psíquicos.', 1.1, 80, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Mr Mime', 'Muchos estudiosos sostienen que el desarrollo de sus enormes manos se debe a su afán por practicar la pantomima.', 1.3, 54.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Scyther', 'Sus guadañas se vuelven más afiladas con cada combate. Es capaz de rebanar troncos gruesos de un tajo.', 1.5, 56, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Jynx', 'En cierta parte de Kanto se conocía a Jynx como la Reina del Hielo y se reverenciaba con cierto temor.', 1.4, 40.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Electabuzz', 'Es habitual que las centrales eléctricas cuenten con Pokémon de tipo Tierra para hacer frente a los Electabuzz ávidos de electricidad.', 1.1, 30, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Magmar', 'Abate a sus presas con las llamas que genera y con frecuencia acaba reduciéndolas a carbonilla por accidente.', 1.3, 44.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Pinsir', 'Los Pinsir se juzgan entre ellos por la robustez de la cornamenta. Cuanto más imponente sea, más agradará a susu congéneres del sexo opuesto.', 1.5, 55, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Tauros', 'Conviene tener cuidado si empieza a fustigarse con las colas, pues es señal de que va a cargar a máxima velocidad.', 1.4, 88.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Magikarp', 'Es el Pokémon más débil y patético que existe, con una fuerza y velocidad prácticamente nulas.', 0.9, 10, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Gyarados', 'Es exageradamente agresivo. El Hiperrayo que lanza por la boca reduce a cenizas todo lo que encuentra.', 6.5, 235, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Lapras', 'Este Pokémon posee una notable inteligencia y un corazón de oro. Entona un canto melodioso mientras surca el mar.', 2.5, 220, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Ditto', 'Redistruye las células de su cuerpo para cobrar la apariencia de lo que ve, pero vuelve a la normalidad al relajarse.', 0.3, 4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Eevee', 'Es capaz de alterar la composición de su cuerpo para adaptarse al entorno.', 0.3, 6.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Vaporeon', 'Cuando las aletas de Vaporeon comienzan a vibrar, significa que lloverá en las próximas horas.', 1, 29, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Jolteon', 'Si se enfada o asusta, se le eriza el pelaje. Cada uno de sus pelos se convierte en una afilada púa que hace trizas al rival.', 0.8, 24.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Flareon', 'Una vez que ha almacenado el calor suficiente, puede alcanzar una temperatura de 900 ºC.', 0.9, 25, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Porygon', 'Se trata del primer Pokémon del mundo creado a partir de códigos de programación gracias al uso de tecnología de vanguardia.', 0.8, 36.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Omanyte', 'Varios ejemplares han escapado o bien han sido liberados tras su restauración, lo que comienza a suscitar una serie de problemas.', 0.4, 7.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Omastar', 'Se cree que se extinguió porque el excesivo tamaño y peso de su concha le impedían moverse con rapidez para capturar presas.', 1, 35, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kabuto', 'Un Pokémon casi extinto. Cada tres días, muda el caparazón, que se va endurenciendo de forma progresiva.', 0.5, 11.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Kabutops', 'Despedaza a las presas que atrapa para sorber sus fluidos y deja los restos para que otros Pokémon den buena cuenta de ellos.', 1.3, 40.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Aerodactyl', 'Un feroz Pokémon de la época prehistórica al que no bastan todos los avances tecnológicos actuales para regenerar a la perfección.', 1.8, 59, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Snorlax', 'No se encuentra satisfecho hasta haber ingerido 400 kg de comida cada día. Cuando acaba de comer, se queda dormido.', 2.1, 460, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Articuno', 'Se dice que sus bellas alas azules se componen de hielo. Vuela en torno a las montañas nevadas con su larga cola al viento.', 1.7, 55.4, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Zapdos', 'Posee el poder de controlar la electricidad a su antojo. Según la creencia popular, anida oculto en oscuros nubarrones de tormenta.', 1.6, 52.6, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Moltres', 'Una de las aves legendarias. Al batir las alas, las llamas que las envuelven emiten un hermoso fulgor rojo.', 2, 60, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dratini', 'Habita en orillas junto a fuertes corrientes de agua, como bajo cascadas. Muda la piel una y otra vez a medida que crece.', 1.8, 3.3, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dragonair', 'Vive en lagos y mares de aguas cristalinas. Su poder para controlar el clima le permite alzar el vuelo llevado por el viento.', 4, 16.5, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Dragonite', 'Un Pokémon bondadoso y compasivo al que le resulta imposible dar la espalda a Pokémon o humanos que se encuentren a la deriva.', 2.2, 210, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Mewtwo', 'Su ADN es vasi el mismo que el de Mew. Sin embargo, su tamaño y carácter son muy diferentes.', 2, 122, 'No');
INSERT INTO Pokemon (Nombre, info, altura, peso, adoptado) 
VALUES ('Mew', 'Si se observa a través de un microscopio, puede distinguirse cuán corto, fino y delicado es el pelaje de este Pokémon.', 0.4, 4, 'No');
-- Tabla Ciudad
INSERT INTO Ciudad (Nombre)
VALUES ('Huelva'),
('Sevilla'),
('Córdoba'),
('Jaén'),
('Almería'),
('Granada'),
('Málaga'),
('Cádiz');
-- Tabla poke_ciudad
INSERT INTO Poke_Ciudad (id_pkmn, id_ciudad)
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,1),
(10,2),
(11,3),
(12,4),
(13,5),
(14,6),
(15,7),
(16,8),
(17,1),
(18,2),
(19,3),
(20,4),
(21,5),
(22,6),
(23,7),
(24,8),
(25,1),
(26,2),
(27,3),
(28,4),
(29,5),
(30,6),
(31,7),
(32,8),
(33,1),
(34,2),
(35,3),
(36,4),
(37,5),
(38,6),
(39,7),
(40,8),
(41,1),
(42,2),
(43,3),
(44,4),
(45,5),
(46,6),
(47,7),
(48,8),
(49,1),
(50,2),
(51,3),
(52,4),
(53,5),
(54,6),
(55,7),
(56,8),
(57,1),
(58,2),
(59,3),
(60,4),
(61,5),
(62,6),
(63,7),
(64,8),
(65,1),
(66,2),
(67,3),
(68,4),
(69,5),
(70,6),
(71,7),
(72,8),
(73,1),
(74,2),
(75,3),
(76,4),
(77,5),
(78,6),
(79,7),
(80,8),
(81,1),
(82,2),
(83,3),
(84,4),
(85,5),
(86,6),
(87,7),
(88,8),
(89,1),
(90,2),
(91,3),
(92,4),
(93,5),
(94,6),
(95,7),
(96,8),
(97,1),
(98,2),
(99,3),
(100,4),
(101,5),
(102,6),
(103,7),
(104,8),
(105,1),
(106,2),
(107,3),
(108,4),
(109,5),
(110,6),
(111,7),
(112,8),
(113,1),
(114,2),
(115,3),
(116,4),
(117,5),
(118,6),
(119,7),
(120,8),
(121,1),
(122,2),
(123,3),
(124,4),
(125,5),
(126,6),
(127,7),
(128,8),
(129,1),
(130,2),
(131,3),
(132,4),
(133,5),
(134,6),
(135,7),
(136,8),
(137,1),
(138,2),
(139,3),
(140,4),
(141,5),
(142,6),
(143,7),
(144,8),
(145,1),
(146,2),
(147,3),
(148,4),
(149,5),
(150,6),
(151,7);
-- Tabla evolución
INSERT INTO Evolucion (id_pkmn, id_pkmn_evo)
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
-- -------Tabla Tipos----------
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

-- Tabla Usuarios
INSERT INTO Usuarios
VALUES ('17477338Y', 'Francisco José Martínez Jaén', 'narf798', '1a2a3a4a5a.', 607463637, 'asir1.fjmj@gmail.com', 'Sí', 2),
('17477338P', 'Sergio Martínez Bermudo', 'CXT', '1a2a3a4a5a.', 123456789, 'cxt@gmail.com', 'No', 3);

-- Tabla UsuPoke
INSERT INTO UsuPoke
VALUES ('17477338Y', 34);

-- Se acabaron las tablas