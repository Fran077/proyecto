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
INSERT INTO Profesor (Nombre, info) VALUES ('Oak');
--id_region, nombre
INSERT INTO Region (Nombre, info) VALUES ('Kanto');
--id_pkmn, nombre, pokedex, hp, at, def, ae, de, vel, total_stat
--1º Gen
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bulbasaur', 45, 49, 49, 65, 65, 45, 318);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ivysaur', 60, 62, 63, 80, 80, 60, 405); 
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venusaur', 80, 82, 83, 100, 100, 80, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmander', 39, 52, 43, 60, 50, 65, 309);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmeleon', 58, 64, 58, 80, 65, 80, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charizard', 78, 84, 78, 109, 85, 100, 534);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Squirtle', 44, 48, 65, 50, 64, 43, 314);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wartortle', 59, 63, 80, 65, 80, 58, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Blastoise', 79, 83, 100, 85, 105, 78, 530);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Caterpie', 45, 30, 35, 20, 20, 45, 195);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Metapod', 50, 20, 55, 25, 25, 30, 205);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Butterfree', 60, 45, 50, 90, 80, 70, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weedle', 40, 35, 30, 20, 20, 50, 195);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kakuna', 45, 25, 50, 25, 25, 35, 205);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Beedrill', 65, 90, 40, 45, 80, 75, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgey', 40, 45, 40, 35, 35, 56, 251);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeotto', 63, 60, 55, 50, 50, 71, 349);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeot', 83, 80, 75, 70, 70, 101, 479);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rattata', 30, 56, 35, 25, 35, 72, 253);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raticate', 55, 81, 60, 50, 70, 97, 413);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Spearow', 40, 60, 30, 31, 31, 70, 262);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Fearow', 65, 90, 65, 61, 61, 100, 442);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ekans', 35, 60, 44, 40, 54, 55, 288);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arbok', 60, 95, 69, 65, 79, 80, 448);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pikachu', 35, 55, 40, 50, 50, 90, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raichu', 60, 90, 55, 90, 80, 110, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandshrew', 50, 75, 85, 20, 30 ,40, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandslash', 75, 100, 110, 45, 55, 65, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Hembra', 55, 47, 52, 40, 40, 41, 275);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorina', 70, 62, 67, 55, 55, 56, 365);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoqueen', 90, 92, 87, 75, 85, 76, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Macho', 46, 57, 40, 40, 40, 50, 273);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorino', 61, 72, 57, 55, 55, 65, 365);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoking', 81, 102, 77, 85, 75, 85, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefairy', 70, 45, 48, 60, 65, 35, 323);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefable', 95, 70, 73, 95, 90, 60, 483);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vulpix', 38, 41, 40, 50, 65, 65, 299);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ninetales', 73, 76, 75, 81, 100, 100, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jigglypuff', 115, 45, 20, 45, 25, 20, 270);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wigglytuff', 140, 70, 45, 85, 50, 45, 436);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zubat', 40, 45, 35, 30, 40, 55, 245);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golbat', 75, 80, 70, 65, 75, 90, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Oddish', 45, 50, 55, 75, 65, 30, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gloom', 60, 65, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vileplume', 75, 80, 85, 110, 90, 50, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Paras', 35, 70, 55, 45, 55, 25, 285);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Parasect', 60, 95, 80, 60, 80, 30, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venonat', 60, 55, 50, 40, 55, 45, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venomoth', 70, 65, 60, 90, 75, 90, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Diglett', 10, 55, 25, 35, 45, 95, 265);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dugtrio', 35, 100, 50, 50, 70, 120, 425);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Meowth', 40, 45, 35, 40, 40, 90, 290);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Persian', 65, 70, 60, 65, 65, 115, 440);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Psyduck', 50, 52, 48, 65, 50, 55, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golduck', 80, 82, 78, 95, 80, 85, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mankey', 40, 80, 35, 35, 45, 70, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Primeape', 65, 105, 60, 60, 70, 95, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Growlithe', 55, 70, 45, 70, 50, 60, 360);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arcanine', 90, 110, 80, 100, 80, 95, 555);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwag', 40, 50, 40, 40, 40, 90, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwhirl', 65, 65, 65, 50, 50, 90, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwrath', 90, 95, 95, 70, 90, 70, 510);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Abra', 25, 20, 15, 105, 55, 90, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kadabra', 40, 35, 30, 120, 70, 105, 400);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Alakazam', 55, 50, 45, 135, 95, 120, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machop', 70, 80, 50, 35, 35, 35, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machoke', 80, 100, 70, 50, 60, 45, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machamp', 90, 130, 80, 65, 85, 55, 505);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bellsprout', 50, 75, 35, 70, 30, 40, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weepinbell', 65, 90, 50, 85, 45, 55, 390);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Victreebel', 80, 105, 65, 100, 70, 70, 480);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacool', 40, 40, 35, 50, 100, 70, 335);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacruel', 80, 70, 65, 80, 120, 100, 515);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Geodude', 40, 80, 100, 30, 30, 20, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Graveler', 55, 95, 115, 45, 45, 35, 390);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golem', 80, 120, 130, 55, 65, 45, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ponyta', 50, 85, 55, 65, 65, 90, 410);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rapidash', 65, 100, 70, 80, 80, 105, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowpoke', 90, 65, 65, 40, 40, 15, 315);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowbro', 95, 75, 110, 100, 80, 30, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magnemite', 25, 35, 70, 95, 55, 45, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magneton', 50, 60, 95, 120, 70, 70, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Farfetchd', 52, 90, 55, 58, 62, 60, 377);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Doduo', 35, 85, 45, 35, 35, 75, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dodrio', 60, 110, 70, 60, 60, 110, 470);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seel', 65, 45, 55, 45, 70, 45, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dewgong', 90, 70, 80, 70, 95, 70, 475);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Grimer', 80, 80, 50, 40, 50, 25, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Muk', 105, 105, 75, 65, 100, 50, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Shellder', 30, 65, 100, 45, 25, 40, 305);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cloyster', 50, 95, 180, 85, 45, 70, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gastly', 30, 35, 30, 100, 35, 80, 310);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Haunter', 45, 50, 45, 115, 55, 95, 405);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gengar', 60, 65, 60, 130, 75, 110, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Onix', 35, 45, 160, 30, 45, 70, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Drowzee', 60, 48, 45, 43, 90, 42, 328);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hypno', 85, 73, 70, 73, 115, 67, 483);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Krabby', 30, 105, 90, 25, 25, 50, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kingler', 55, 130, 115, 50, 50, 75, 475);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Voltorb', 40, 30, 50, 55, 55, 100, 330);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electrode', 60, 50, 70, 80, 80, 150, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggcute', 60, 40, 80, 60, 45, 40, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggutor', 95, 95, 85, 125, 75, 55, 530);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cubone', 50, 50, 95, 40, 50, 35, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Marowak', 60, 80, 110, 50, 80, 45, 425);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonlee', 50, 120, 53, 35, 110, 87, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonchan', 50, 105, 79, 35, 110, 76, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lickitung', 90, 55, 75, 60, 75, 30, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Koffing', 40, 65, 95, 60, 45, 35, 340);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weezing', 65, 90, 120, 85, 70, 60, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhyhorn', 80, 85, 95, 30, 30, 25, 345);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhydon', 105, 130, 120, 45, 45, 40, 485);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Chansey', 250, 5, 5, 35, 105, 50, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tangela', 65, 55, 115, 100, 40, 60, 435);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kangaskhan', 105, 95, 80, 40, 80, 90, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Horsea', 30, 40, 70, 70, 25, 60, 295);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seadra', 55, 65, 95, 95, 45, 85, 440);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Goldeen', 45, 67, 60, 35, 50, 63, 320);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seaking', 80, 92, 65, 65, 80, 68, 450);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Staryu', 30, 45, 55, 70, 55, 85, 340);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Starmie', 60, 75, 85, 100, 85, 115, 520);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mr Mime', 40, 45, 65, 100, 120, 90, 460);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Scyther', 70, 110, 80, 55, 80, 105, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jynx', 65, 50, 35, 115, 95, 95, 455);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electabuzz', 65, 83, 57, 95, 85, 105, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magmar', 65, 95, 57, 100, 85, 93, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pinsir', 65, 125, 100, 55, 70, 85, 500);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tauros', 75, 100, 95, 40, 70, 110, 490);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magikarp', 20, 10, 55, 15, 20, 80, 200);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gyarados', 95, 125, 79, 60, 100, 81, 540);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lapras', 130, 85, 80, 85, 95, 60, 535);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ditto', 48, 48, 48, 48, 48, 48, 288);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Eevee', 55, 55, 50, 45, 65, 55, 325);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vaporeon', 130, 65, 60, 110, 95, 65, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jolteon', 65, 65, 60, 110, 95, 130, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Flareon', 65, 130, 60, 95, 110, 65, 525);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Porygon', 65, 60, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omanyte', 35, 40, 100, 90, 55, 35, 355);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omastar', 70, 60, 125, 115, 70, 55, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabuto', 30, 80, 90, 55, 45, 55, 385);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabutops', 60, 115, 105, 65, 70, 80, 495);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Aerodactyl', 80, 105, 65, 60, 75, 130, 515);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Snorlax', 160, 110, 65, 65, 110, 30, 540);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Articuno', 90, 85, 100, 95, 125, 85, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zapdos', 90, 90, 85, 125, 90, 100, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Moltres', 90, 100, 90, 125, 85, 90, 580);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dratini', 41, 64, 45, 50, 50, 50, 300);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonair', 61, 84, 65, 70, 70, 70, 420);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonite', 91, 134, 95, 100, 100, 80, 600);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mewtwo', 106, 110, 90, 154, 90, 130, 680);
INSERT INTO Pokemon (Nombre, info, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mew', 100, 100, 100, 100, 100, 100, 600);
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
VALUES ('Pueblo Paleta', 1),
('Ciudad Verde', 1),
('Ciudad Plateada', 1),
('Ciudad Celeste', 1),
('Pueblo Lavanda', 1),
('Ciudad Azafrán', 1),
('Ciudad Carmín', 1),
('Ciudad Azulona', 1),
('Ciudad Fucsia', 1),
('Isla Canela', 1),
('Meseta Añil', 1);
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
