CREATE DATABASE IF NOT EXISTS Proyecto;
USE Proyecto

---------------------------------------------LAS TABLAS-------------------------------------

CREATE TABLE Tipos (
    id_tipo TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15)
);

CREATE TABLE Profesor (
    id_prof TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20)
);

CREATE TABLE Region (
    id_region TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(10)
);

CREATE TABLE Pokemon (
    id_pkmn SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    Pokedex SMALLINT(3),
    HP SMALLINT(3),
    ATAQUE SMALLINT(3),
    DEFENSA SMALLINT(3),
    A_ESPECIAL SMALLINT(3),
    D_ESPECIAL SMALLINT(3),
    VELOCIDAD SMALLINT(3),
    Total_Estat SMALLINT(3)
);

CREATE TABLE Evolucion (
    id_pkmn SMALLINT,
    id_pkmn_evo SMALLINT,
    CONSTRAINT pokemon_fk4 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT pokemon_fk5 FOREIGN KEY (id_pkmn_evo) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT evo_fk FOREIGN KEY (id_evolucion) REFERENCES Pokemon(id_pkmn),
    PRIMARY KEY (id_pkmn, id_pkmn_evo)
);

CREATE TABLE Pokemon_Tipo (
    id_pkmn SMALLINT,
    id_tipo TINYINT,
    CONSTRAINT pkmn_fk3 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT tipo_fk3 FOREIGN KEY (id_tipo) REFERENCES Tipos(id_tipo),
    PRIMARY KEY (id_pkmn, id_tipo)
);

CREATE TABLE Iniciales (
    id_prof TINYINT,
    id_pkmn SMALLINT,
    id_region TINYINT,
    CONSTRAINT inicial_fk FOREIGN KEY (id_prof) REFERENCES Profesor(id_prof),
    CONSTRAINT inicial_fk2 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT inicial_fk3 FOREIGN KEY (id_region) REFERENCES Region(id_region),
    PRIMARY KEY (id_prof, id_pkmn, id_region)
);

CREATE TABLE Ciudades (
    id_ciudad SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20)
);

CREATE TABLE Pueblos (
    id_pueblo SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20)
);

CREATE TABLE Lideres (
    id_lider TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(15),
    Medalla VARCHAR(15),
    id_ciudad SMALLINT,
    id_pueblo SMALLINT,
    CONSTRAINT ciudad_fk FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad),
    CONSTRAINT pueblo_fk FOREIGN KEY (id_pueblo) REFERENCES Pueblos(id_pueblo)
);

CREATE TABLE Pokemon_Lider (
    id_lider TINYINT,
    id_pkmn SMALLINT,
    CONSTRAINT pokemon_fk FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT lider_fk3 FOREIGN KEY (id_lider) REFERENCES Lideres(id_lider),
    PRIMARY KEY (id_pkmn, id_lider)
);

CREATE TABLE Rutas (
    id_ruta SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Número SMALLINT
);

CREATE TABLE LugaresImp (
    id_lugarimp SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25)
);
--deberia ser solo rutas_pokemon
CREATE TABLE Rutas_Region_Pokemon (
    id_ruta SMALLINT,
    id_region TINYINT,
    id_pkmn SMALLINT,
    CONSTRAINT ruta_fk FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    CONSTRAINT region_fk FOREIGN KEY (id_region) REFERENCES Region(id_region),
    CONSTRAINT pkmn_fk FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    PRIMARY KEY (id_ruta, id_region, id_pkmn)
);
--deberia ser solo lugaresimp_pokemon
CREATE TABLE LugaresImp_Region_Pokemon (
    id_lugarimp SMALLINT,
    id_region TINYINT,
    id_pkmn SMALLINT,
    CONSTRAINT lugarimp_fk FOREIGN KEY (id_lugarimp) REFERENCES LugaresImp(id_lugarimp),
    CONSTRAINT region_fk2 FOREIGN KEY (id_region) REFERENCES Region(id_region),
    CONSTRAINT pkmn_fk2 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    PRIMARY KEY (id_lugarimp, id_region, id_pkmn)
);

CREATE TABLE AltoMando (
    id_alto TINYINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20),
    Localización VARCHAR(15),
    id_lugarimp SMALLINT,
    CONSTRAINT alto_fk FOREIGN KEY (id_lugarimp) REFERENCES LugaresImp(id_lugarimp)
);

CREATE TABLE Pokemon_AltoMando (
    id_alto TINYINT,
    id_pkmn SMALLINT,
    CONSTRAINT pokemon_fk2 FOREIGN KEY (id_pkmn) REFERENCES Pokemon(id_pkmn),
    CONSTRAINT alto_fk2 FOREIGN KEY (id_alto) REFERENCES AltoMando(id_alto),
    PRIMARY KEY (id_pkmn, id_alto)
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
--INSERT INTO Tipos (Nombre) VALUES ('Hada');
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
INSERT INTO Profesor (Nombre) VALUES ('Oak');
--INSERT INTO Profesor (Nombre) VALUES ('Elm');
--INSERT INTO Profesor (Nombre) VALUES ('Abedul');
--INSERT INTO Profesor (Nombre) VALUES ('Serbal');
--INSERT INTO Profesor (Nombre) VALUES ('Encina');
--INSERT INTO Profesor (Nombre) VALUES ('Ciprés');
--INSERT INTO Profesor (Nombre) VALUES ('Kukui');
--INSERT INTO Profesor (Nombre) VALUES ('Magnolia');
--id_region, nombre
INSERT INTO Region (Nombre) VALUES ('Kanto');
--INSERT INTO Region (Nombre) VALUES ('Johto');
--INSERT INTO Region (Nombre) VALUES ('Hoenn');
--INSERT INTO Region (Nombre) VALUES ('Sinnoh');
--INSERT INTO Region (Nombre) VALUES ('Teselia');
--INSERT INTO Region (Nombre) VALUES ('Kalos');
--INSERT INTO Region (Nombre) VALUES ('Alola');
--INSERT INTO Region (Nombre) VALUES ('Galar');
--id_pkmn, nombre, pokedex, hp, at, def, ae, de, vel, total_stat
--1º Gen
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bulbasaur', 1, 45, 49, 49, 65, 65, 45, 318);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ivysaur', 2, 60, 62, 63, 80, 80, 60, 405); 
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venusaur', 3, 80, 82, 83, 100, 100, 80, 525);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmander', 4, 39, 52, 43, 60, 50, 65, 309);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charmeleon', 5, 58, 64, 58, 80, 65, 80, 405);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Charizard', 6, 78, 84, 78, 109, 85, 100, 534);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Squirtle', 7, 44, 48, 65, 50, 64, 43, 314);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wartortle', 8, 59, 63, 80, 65, 80, 58, 405);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Blastoise', 9, 79, 83, 100, 85, 105, 78, 530);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Caterpie', 10, 45, 30, 35, 20, 20, 45, 195);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Metapod', 11, 50, 20, 55, 25, 25, 30, 205);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Butterfree', 12, 60, 45, 50, 90, 80, 70, 395);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weedle', 13, 40, 35, 30, 20, 20, 50, 195);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kakuna', 14, 45, 25, 50, 25, 25, 35, 205);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Beedrill', 15, 65, 90, 40, 45, 80, 75, 395);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgey', 16, 40, 45, 40, 35, 35, 56, 251);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeotto', 17, 63, 60, 55, 50, 50, 71, 349);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pidgeot', 18, 83, 80, 75, 70, 70, 101, 479);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rattata', 19, 30, 56, 35, 25, 35, 72, 253);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raticate', 20, 55, 81, 60, 50, 70, 97, 413);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Spearow', 21, 40, 60, 30, 31, 31, 70, 262);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Fearow', 22, 65, 90, 65, 61, 61, 100, 442);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ekans', 23, 35, 60, 44, 40, 54, 55, 288);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arbok', 24, 60, 95, 69, 65, 79, 80, 448);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pikachu', 25, 35, 55, 40, 50, 50, 90, 320);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Raichu', 26, 60, 90, 55, 90, 80, 110, 485);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandshrew', 27, 50, 75, 85, 20, 30 ,40, 300);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Sandslash', 28, 75, 100, 110, 45, 55, 65, 450);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Hembra', 29, 55, 47, 52, 40, 40, 41, 275);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorina', 30, 70, 62, 67, 55, 55, 56, 365);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoqueen', 31, 90, 92, 87, 75, 85, 76, 505);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoran Macho', 32, 46, 57, 40, 40, 40, 50, 273);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidorino', 33, 61, 72, 57, 55, 55, 65, 365);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Nidoking', 34, 81, 102, 77, 85, 75, 85, 505);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefairy', 35, 70, 45, 48, 60, 65, 35, 323);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Clefable', 36, 95, 70, 73, 95, 90, 60, 483);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vulpix', 37, 38, 41, 40, 50, 65, 65, 299);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ninetales', 38, 73, 76, 75, 81, 100, 100, 505);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jigglypuff', 39, 115, 45, 20, 45, 25, 20, 270);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Wigglytuff', 40, 140, 70, 45, 85, 50, 45, 436);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zubat', 41, 40, 45, 35, 30, 40, 55, 245);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golbat', 42, 75, 80, 70, 65, 75, 90, 455);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Oddish', 43, 45, 50, 55, 75, 65, 30, 320);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gloom', 44, 60, 65, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vileplume', 45, 75, 80, 85, 110, 90, 50, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Paras', 46, 35, 70, 55, 45, 55, 25, 285);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Parasect', 47, 60, 95, 80, 60, 80, 30, 405);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venonat', 48, 60, 55, 50, 40, 55, 45, 305);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Venomoth', 49, 70, 65, 60, 90, 75, 90, 450);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Diglett', 50, 10, 55, 25, 35, 45, 95, 265);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dugtrio', 51, 35, 100, 50, 50, 70, 120, 425);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Meowth', 52, 40, 45, 35, 40, 40, 90, 290);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Persian', 53, 65, 70, 60, 65, 65, 115, 440);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Psyduck', 54, 50, 52, 48, 65, 50, 55, 320);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golduck', 55, 80, 82, 78, 95, 80, 85, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mankey', 56, 40, 80, 35, 35, 45, 70, 305);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Primeape', 57, 65, 105, 60, 60, 70, 95, 455);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Growlithe', 58, 55, 70, 45, 70, 50, 60, 360);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Arcanine', 59, 90, 110, 80, 100, 80, 95, 555);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwag', 60, 40, 50, 40, 40, 40, 90, 300);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwhirl', 61, 65, 65, 65, 50, 50, 90, 385);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Poliwrath', 62, 90, 95, 95, 70, 90, 70, 510);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Abra', 63, 25, 20, 15, 105, 55, 90, 310);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kadabra', 64, 40, 35, 30, 120, 70, 105, 400);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Alakazam', 65, 55, 50, 45, 135, 95, 120, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machop', 66, 70, 80, 50, 35, 35, 35, 305);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machoke', 67, 80, 100, 70, 50, 60, 45, 405);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Machamp', 68, 90, 130, 80, 65, 85, 55, 505);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Bellsprout', 69, 50, 75, 35, 70, 30, 40, 300);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weepinbell', 70, 65, 90, 50, 85, 45, 55, 390);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Victreebel', 71, 80, 105, 65, 100, 70, 70, 480);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacool', 72, 40, 40, 35, 50, 100, 70, 335);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tentacruel', 73, 80, 70, 65, 80, 120, 100, 515);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Geodude', 74, 40, 80, 100, 30, 30, 20, 300);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Graveler', 75, 55, 95, 115, 45, 45, 35, 390);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Golem', 76, 80, 120, 130, 55, 65, 45, 495);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ponyta', 77, 50, 85, 55, 65, 65, 90, 410);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rapidash', 78, 65, 100, 70, 80, 80, 105, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowpoke', 79, 90, 65, 65, 40, 40, 15, 315);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Slowbro', 80, 95, 75, 110, 100, 80, 30, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magnemite', 81, 25, 35, 70, 95, 55, 45, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magneton', 82, 50, 60, 95, 120, 70, 70, 485);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Farfetchd', 83, 52, 90, 55, 58, 62, 60, 377);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Doduo', 84, 35, 85, 45, 35, 35, 75, 310);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dodrio', 85, 60, 110, 70, 60, 60, 110, 470);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seel', 86, 65, 45, 55, 45, 70, 45, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dewgong', 87, 90, 70, 80, 70, 95, 70, 475);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Grimer', 88, 80, 80, 50, 40, 50, 25, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Muk', 89, 105, 105, 75, 65, 100, 50, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Shellder', 90, 30, 65, 100, 45, 25, 40, 305);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cloyster', 91, 50, 95, 180, 85, 45, 70, 525);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gastly', 92, 30, 35, 30, 100, 35, 80, 310);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Haunter', 93, 45, 50, 45, 115, 55, 95, 405);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gengar', 94, 60, 65, 60, 130, 75, 110, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Onix', 95, 35, 45, 160, 30, 45, 70, 385);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Drowzee', 96, 60, 48, 45, 43, 90, 42, 328);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hypno', 97, 85, 73, 70, 73, 115, 67, 483);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Krabby', 98, 30, 105, 90, 25, 25, 50, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kingler', 99, 55, 130, 115, 50, 50, 75, 475);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Voltorb', 100, 40, 30, 50, 55, 55, 100, 330);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electrode', 101, 60, 50, 70, 80, 80, 150, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggcute', 102, 60, 40, 80, 60, 45, 40, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Exeggutor', 103, 95, 95, 85, 125, 75, 55, 530);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Cubone', 104, 50, 50, 95, 40, 50, 35, 320);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Marowak', 105, 60, 80, 110, 50, 80, 45, 425);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonlee', 106, 50, 120, 53, 35, 110, 87, 485);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Hitmonchan', 107, 50, 105, 79, 35, 110, 76, 455);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lickitung', 108, 90, 55, 75, 60, 75, 30, 385);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Koffing', 109, 40, 65, 95, 60, 45, 35, 340);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Weezing', 110, 65, 90, 120, 85, 70, 60, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhyhorn', 111, 80, 85, 95, 30, 30, 25, 345);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Rhydon', 112, 105, 130, 120, 45, 45, 40, 485);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Chansey', 113, 250, 5, 5, 35, 105, 50, 450);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tangela', 114, 65, 55, 115, 100, 40, 60, 435);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kangaskhan', 115, 105, 95, 80, 40, 80, 90, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Horsea', 116, 30, 40, 70, 70, 25, 60, 295);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seadra', 117, 55, 65, 95, 95, 45, 85, 440);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Goldeen', 118, 45, 67, 60, 35, 50, 63, 320);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Seaking', 119, 80, 92, 65, 65, 80, 68, 450);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Staryu', 120, 30, 45, 55, 70, 55, 85, 340);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Starmie', 121, 60, 75, 85, 100, 85, 115, 520);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mr Mime', 122, 40, 45, 65, 100, 120, 90, 460);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Scyther', 123, 70, 110, 80, 55, 80, 105, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jynx', 124, 65, 50, 35, 115, 95, 95, 455);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Electabuzz', 125, 65, 83, 57, 95, 85, 105, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magmar', 126, 65, 95, 57, 100, 85, 93, 495);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Pinsir', 127, 65, 125, 100, 55, 70, 85, 500);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Tauros', 128, 75, 100, 95, 40, 70, 110, 490);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Magikarp', 129, 20, 10, 55, 15, 20, 80, 200);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Gyarados', 130, 95, 125, 79, 60, 100, 81, 540);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Lapras', 131, 130, 85, 80, 85, 95, 60, 535);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Ditto', 132, 48, 48, 48, 48, 48, 48, 288);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Eevee', 133, 55, 55, 50, 45, 65, 55, 325);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Vaporeon', 134, 130, 65, 60, 110, 95, 65, 525);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Jolteon', 135, 65, 65, 60, 110, 95, 130, 525);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Flareon', 136, 65, 130, 60, 95, 110, 65, 525);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Porygon', 137, 65, 60, 70, 85, 75, 40, 395);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omanyte', 138, 35, 40, 100, 90, 55, 35, 355);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Omastar', 139, 70, 60, 125, 115, 70, 55, 495);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabuto', 140, 30, 80, 90, 55, 45, 55, 385);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Kabutops', 141, 60, 115, 105, 65, 70, 80, 495);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Aerodactyl', 142, 80, 105, 65, 60, 75, 130, 515);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Snorlax', 143, 160, 110, 65, 65, 110, 30, 540);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Articuno', 144, 90, 85, 100, 95, 125, 85, 580);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Zapdos', 145, 90, 90, 85, 125, 90, 100, 580);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Moltres', 146, 90, 100, 90, 125, 85, 90, 580);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dratini', 147, 41, 64, 45, 50, 50, 50, 300);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonair', 148, 61, 84, 65, 70, 70, 70, 420);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Dragonite', 149, 91, 134, 95, 100, 100, 80, 600);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mewtwo', 150, 106, 110, 90, 154, 90, 130, 680);
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat) 
VALUES ('Mew', 151, 100, 100, 100, 100, 100, 100, 600);
--2º Gen
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat)
VALUES ('Chikorita', 152, 45, 49, 65, 49, 65, 45, 318),
('Bayleef', 153, 60, 62, 80, 63, 80, 60, 405),
('Meganium', 154, 80, 82, 100, 83, 100, 80, 525),
('Cyndaquil', 155, 39, 52, 43, 60, 50, 65, 309),
('Quilava', 156, 58, 64, 58, 80, 65, 80, 405),
('Typhlosion', 157, 78, 84, 78, 109, 85, 100, 534),
('Totodile', 158, 50, 65, 64, 44, 48, 43, 314),
('Croconaw', 159, 65, 80, 80, 59, 63, 58, 405),
('Feraligatr', 160, 85, 105, 100, 79, 83, 78, 530),
('Sentret', 161, 35, 46, 34, 35, 45, 20, 215),
('Furret', 162, 85, 76, 64, 45, 55, 90, 415),
('Hoothoot', 163, 60, 30, 30, 36, 56, 50, 262),
('Noctowl', 164, 100, 50, 50, 86, 96, 70, 452),
('Ledyba', 165, 40, 20, 30, 40, 80, 55, 265),
('Ledian', 166, 55, 35, 50, 55, 110, 85, 390),
('Spinarak', 167, 40, 60, 40, 40, 40, 30, 250),
('Ariados', 168, 70, 90, 70, 60, 70, 40, 400),
('Crobat', 169, 85, 90, 80, 70, 80, 130, 535),
('Chinchou', 170, 75, 38, 38, 56, 56, 67, 330),
('Lanturn', 171, 125, 58, 58, 76, 76, 67, 460),
('Pichu', 172, 20, 40, 15, 35, 35, 60, 205),
('Cleffa', 173, 50, 25, 28, 45, 55, 15, 218),
('Iglybuff', 174, 90, 30, 15, 40, 20, 15, 210),
('Togepi', 175, 35, 20, 65, 40, 65, 20, 245),
('Togetic', 176, 55, 40, 85, 80, 105, 40, 405),
('Natu', 177, 40, 50, 45, 70, 45, 70, 320),
('Xatu', 178, 65, 75, 70, 95, 70, 95, 470),
('Mareep', 179, 55, 40, 40, 65, 45, 35, 280),
('Flaaffy', 180, 70, 55, 55, 80, 60, 45, 365),
('Ampharos', 181, 90, 75, 85, 115, 90, 55, 510),
('Bellossom', 182, 75, 80, 95, 90, 100, 50, 490),
('Marill', 183, 70, 20, 50, 20, 50, 40, 250),
('Azumarill', 184, 100, 50, 80, 60, 80, 50, 420),
('Sudowoodo', 185, 70, 100, 115, 30, 65, 30, 410),
('Politoed', 186, 90, 75, 75, 90, 100, 70, 500),
('Hoppip', 187, 35, 35, 40, 35, 55, 50, 250),
('Skiploom', 188, 55, 45, 50, 45, 65, 80, 340),
('Jumpluff', 189, 75, 55, 70, 55, 95, 110, 460),
('Aipom', 190, 115, 67, 54, 40, 54, 81, 360),
('Sunkern', 191, 30, 30, 30, 30, 30, 30, 180),
('Sunflora', 192, 75, 75, 55, 105, 85, 30, 425),
('Yanma', 193, 65, 65, 45, 75, 45, 95, 390),
('Wooper', 194, 55, 45, 45, 25, 25, 15, 210),
('Quagsire', 195, 95, 85, 85, 65, 65, 35, 430),
('Espeon', 196, 65, 65, 60, 130, 95, 110, 525),
('Umbreon', 197, 95, 65, 110, 60, 130, 65, 525),
('Murkrow', 198, 60, 85, 42, 85, 42, 91, 405),
('Slowking', 199, 95, 75, 80, 100, 110, 30, 490),
('Misdreavus', 200, 60, 60, 60, 85, 85, 85, 435),
('Unown', 201, 48, 72, 48, 72, 48, 48, 336),
('Wobbuffet', 202, 190, 33, 58, 33, 58, 33, 405),
('Girafarig', 203, 70, 80, 65, 90, 65, 85, 455),
('Pineco', 204, 50, 65, 90, 35, 35, 15, 190),
('Forretress', 205, 75, 90, 140, 60, 60, 40, 465),
('Dunsparce', 206, 100, 70, 70, 65, 65, 45, 415),
('Gligar', 207, 65, 75, 105, 35, 65, 85, 430),
('Steelix', 208, 75, 85, 200, 55, 65, 30, 510),
('Snubbull', 209, 60, 80, 50, 40, 40, 30, 300),
('Granbull', 210, 90, 120, 75, 60, 60, 45, 450),
('Qwilfish', 211, 65, 95, 85, 55, 55, 85, 440),
('Scizor', 212, 70, 130, 100, 55, 80, 65, 500),
('Shuckle', 213, 20, 10, 230, 10, 230, 5, 505),
('Heracross', 214, 80, 125, 75, 40, 95, 85, 500),
('Sneasel', 215, 55, 95, 55, 35, 75, 115, 430),
('Teddiursa', 216, 60, 80, 50, 50, 50, 40, 330),
('Ursaring', 217, 90, 130, 75, 75, 75, 55, 500),
('Slugma', 218, 40, 40, 40, 70, 40, 20, 250),
('Magcargo', 219, 60, 50, 120, 90, 80, 30, 430),
('Swinub', 220, 50, 50, 40, 30, 30, 50, 250),
('Piloswine', 221, 100, 100, 80, 60, 60, 50, 450),
('Corsola', 222, 65, 55, 95, 65, 95, 35, 410),
('Remoraid', 223, 35, 65, 35, 65, 35, 65, 300),
('Octillery', 224, 75, 105, 75, 105, 75, 45, 480),
('Delibird', 225, 45, 55, 45, 65, 45, 75, 330),
('Mantine', 226, 85, 40, 70, 80, 140, 70, 485),
('Skarmory', 227, 65, 80, 140, 40, 70, 70, 465),
('Houndour', 228, 45, 60, 30, 80, 50, 65, 330),
('Houndoom', 229, 75, 90, 50, 110, 80, 95, 500),
('Kingdra', 230, 75, 95, 95, 95, 95, 85, 540),
('Phanpy', 231, 90, 60, 60, 40, 40, 40, 330),
('Donphan', 232, 90, 120, 120, 60, 60, 50, 500),
('Porygon2', 233, 85, 80, 90, 105, 95, 60, 515),
('Stantler', 234, 73, 95, 62, 85, 65, 85, 465),
('Smeargle', 235, 55, 20, 35, 20, 45, 75, 250),
('Tyrogue', 236, 35, 35, 35, 35, 35, 35, 210),
('Hitmontop', 237, 50, 95, 95, 35, 110, 70, 455),
('Smoochum', 238, 45, 30, 15, 85, 65, 65, 305),
('Elekid', 239, 45, 63, 37, 65, 55, 95, 360),
('Magby', 240, 45, 75, 37, 70, 55, 83, 365),
('Miltank', 241, 95, 80, 105, 40, 70, 100, 490),
('Blissey', 242, 255, 10, 10, 75, 135, 55, 540),
('Raikou', 243, 90, 85, 75, 115, 100, 115, 580),
('Entei', 244, 115, 115, 85, 90, 75, 100, 580),
('Suicune', 245, 100, 75, 115, 90, 115, 85, 580),
('Larvitar', 246, 50, 64, 50, 45, 50, 41, 300),
('Pupitar', 247, 70, 84, 70, 65, 70, 51, 410),
('Tyranitar', 248, 100, 134, 110, 95, 100, 61, 600),
('Lugia', 249, 106, 90, 130, 90, 154, 110, 680),
('Ho-Oh', 250, 106, 130, 90, 110, 154, 90, 680),
('Celebi', 251, 100, 100, 100, 100, 100, 100, 600);
--3º Gen
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, VELOCIDAD, Total_Estat)
VALUES ('Treecko', 252, 40, 45, 35, 65, 55, 70, 310),
('Grovyle', 253, 50, 65, 45, 85, 65, 95, 405),
('Sceptile', 254, 70, 85, 65, 105, 85, 120, 530),
('Torchic', 255, 45, 60, 40, 70, 50, 45, 310),
('Combusken', 256, 60, 85, 60, 85, 60, 55, 405),
('Blaziken', 257, 80, 120, 70, 110, 70, 80, 530),
('Mudkip', 258, 50, 70, 50, 50, 50, 40, 310),
('Marshtomp', 259, 70, 85, 70, 60, 70, 50, 405),
('Swampert', 260, 100, 110, 90, 85, 90, 60, 535),
('Poochyena', 261, 35, 55, 35, 30, 30, 35, 220),
('Mightyena', 262, 70, 90, 70, 60, 60, 70, 420),
('Zigzagoon', 263, 38, 30, 41, 30, 41, 60, 240),
('Linoone', 264, 78, 70, 61, 50, 61, 100, 420),
('Wurmple', 265, 45, 45, 35, 20, 30, 20, 195),
('Silcoon', 266, 50, 35, 55, 25, 25, 15, 205),
('Beautifly', 267, 60, 70, 50, 100, 50, 65, 395),
('Cascoon', 268, 50, 35, 55, 25, 25, 15, 205),
('Dustox', 269, 60, 50, 70, 50, 90, 65, 385),
('Lotad', 270, 40, 30, 30, 40, 50, 30, 220),
('Lombre', 271, 60, 50, 50, 60, 70, 50, 340),
('Ludicolo', 272, 80, 70, 70, 90, 100, 70, 480),
('Seedot', 273, 40, 40, 50, 30, 30, 30, 220),
('Nuzleaf', 274, 70, 70, 40, 60, 40, 60, 340),
('Shiftry', 275, 90, 100, 60, 90, 60, 80, 480),
('Taillow', 276, 40, 55, 30, 30, 30, 85, 270),
('Swellow', 277, 60, 85, 60, 75, 50, 125, 455),
('Wingull', 278, 40, 30, 30, 55, 30, 85, 270),
('Pelipper', 279, 60, 50, 100, 95, 70, 65, 440),
('Ralts', 280, 28, 25, 25, 45, 35, 40, 198),
('Kirlia', 281, 38, 35, 35, 65, 55, 50, 278),
('Gardevoir', 282, 68, 65, 65, 125, 115, 80, 518),
('Surskit', 283, 40, 30, 32, 50, 52, 65, 269),
('Masquerain', 284, 70, 60, 62, 100, 82, 80, 454),
('Shroomish', 285, 60, 40, 60, 40, 60, 35, 295),
('Breloom', 286, 60, 130, 80, 60, 60, 70, 460),
('Slakoth', 287, 60, 60, 60, 35, 35, 30, 280),
('Vigoroth', 288, 80, 80, 80, 55, 55, 90, 440),
('Slaking', 289, 150, 160, 100, 95, 65, 100, 670),
('Nincada', 290, 31, 45, 90, 30, 30, 40, 266),
('Ninjask', 291, 61, 90, 45, 50, 50, 160, 456),
('Shedinja', 292, 1, 90, 45, 30, 30, 40, 236),
('Whishmur', 293, 64, 51, 23, 51, 23, 28, 240),
('Loudred', 294, 84, 71, 43, 71, 43, 48, 360),
('Exploud', 295, 104, 91, 63, 91, 73, 68, 490),
('Makuhita', 296, 72, 60, 30, 20, 30, 25, 237),
('Hariyama', 297, 144, 120, 60, 40, 60, 50, 474),
('Azurill', 298, 50, 20, 40, 20, 40, 20, 190),
('Nosepass', 299, 30, 45, 135, 45, 90, 30, 375),
('Skitty', 300, 50, 45, 45, 35, 35, 50, 260),
('Delcatty', 301, 70, 65, 65, 55, 55, 90, 400),
('Sableye', 302, 50, 75, 75, 65, 65, 50, 380),
('Mawile', 303, 50, 85, 85, 55, 55, 50, 380),
('Aron', 304, 50, 70, 100, 40, 40, 30, 330),
('Lairon', 305, 60, 90, 140, 50, 50, 40, 430),
('Aggron', 306, 70, 110, 180, 60, 60, 50, 530),
('Meditite', 307, 30, 40, 55, 40, 55, 60, 280),
('Medicham', 308, 60, 60, 75, 60, 75, 80, 410),
('Electrike', 309, 40, 45, 40, 65, 40, 65, 295),
('Manectric', 310, 70, 75, 60, 105, 60, 105, 475),
('Plusle', 311, 60, 50, 40, 85, 75, 95, 405),
('Minun', 312, 60, 40, 50, 75, 85, 95, 405),
('Volbeat', 313, 65, 73, 75, 47, 85, 85, 430),
('Illumise', 314, 65, 47, 75, 73, 85, 85, 430),
('Roselia', 315, 50, 60, 45, 100, 80, 65, 400),
('Gulpin', 316, 70, 43, 53, 43, 53, 40, 302),
('Swalot', 317, 100, 73, 83, 73, 83, 55, 467),
('Carvanha', 318, 45, 90, 20, 65, 20, 65, 305),
('Sharpedo', 319, 70, 120, 40, 95, 40, 95, 460),
('Wailmer', 320, 130, 70, 35, 70, 35, 60, 400),
('Wailord', 321, 170, 90, 45, 90, 45, 60, 500),
('Numel', 322, 60, 60, 40, 65, 45, 35, 305),
('Camerupt', 323, 70, 100, 70, 105, 75, 40, 460),
('Torkoal', 324, 70, 85, 140, 85, 70, 20, 470),
('Spoink', 325, 60, 25, 35, 70, 80, 60, 330),
('Grumpig', 326, 80, 45, 65, 90, 110, 80, 470),
('Spinda', 327, 60, 60, 60, 60, 60, 60, 360),
('Trapinch', 328, 45, 100, 45, 45, 45, 10, 290),
('Vibrava', 329, 50, 70, 50, 50, 50, 70, 340),
('Flygon', 330, 80, 100, 80, 80, 80, 100, 520),
('Cacnea', 331, 50, 85, 40, 85, 40, 35, 335),
('Cacturne', 332, 70, 115, 60, 115, 60, 55, 475),
('Swablu', 333, 45, 40, 60, 40, 75, 50, 310),
('Altaria', 334, 75, 70, 90, 70, 105, 80, 490),
('Zangoose', 335, 73, 115, 60, 60, 60, 90, 458),
('Seviper', 336, 73, 100, 60, 100, 60, 65, 458),
('Lunatone', 337, 90, 55, 65, 95, 85, 70, 460),
('Solrock', 338, 90, 95, 85, 55, 65, 70, 460),
('Barboach', 339, 50, 48, 43, 46, 41, 60, 288),
('Whiscash', 340, 110, 78, 73, 76, 71, 60, 468),
('Corphish', 341, 43, 80, 65, 50, 35, 35, 308),
('Crawdaunt', 342, 63, 120, 85, 90, 55, 55, 468),
('Baltoy', 343, 40, 40, 55, 40, 70, 55, 300),
('Claydol', 344, 60, 70, 105, 70, 120, 75, 500),
('Lileep', 345, 66, 41, 77, 61, 87, 23, 355),
('Cradily', 346, 86, 81, 97, 81, 107, 43, 495),
('Anorith', 347, 45, 95, 50, 40, 50, 75, 355),
('Armaldo', 348, 75, 125, 100, 70, 80, 45, 495),
('Feebas', 349, 20, 15, 20, 10, 55, 80, 200),
('Milotic', 350, 95, 60, 79, 100, 125, 81, 540),
('Castform', 351, 70, 70, 70, 70, 70, 70, 420),
('Kecleon', 352, 60, 90, 70, 60, 120, 40, 440),
('Shuppet', 353, 44, 75, 35, 63, 33, 45, 295),
('Banette', 354, 64, 115, 65, 83, 63, 65, 455),
('Duskull', 355, 20, 40, 90, 30, 90, 25, 295),
('Dusclops', 356, 40, 70, 130, 60, 130, 25, 455),
('Tropius', 357, 99, 68, 83, 72, 87, 51, 460),
('Chimecho', 358, 75, 50, 80, 95, 90, 65, 455),
('Absol', 359, 65, 130, 60, 75, 60, 75, 465),
('Wynaut', 360, 95, 23, 48, 23, 48, 23, 260),
('Snorunt', 361, 50, 50, 50, 50, 50, 50, 300),
('Glalie', 362, 80, 80, 80, 80, 80, 80, 480),
('Spheal', 363, 70, 40, 50, 55, 50, 25, 290),
('Sealeo', 364, 90, 60, 70, 75, 70, 45, 410),
('Walrein', 365, 110, 80, 90, 95, 90, 65, 530),
('Clamperl', 366, 35, 64, 85, 74, 55, 32, 345),
('Huntail', 367, 55, 104, 105, 94, 75, 52, 485),
('Gorebyss', 368, 55, 84, 105, 114, 75, 52, 485),
('Relicanth', 369, 100, 90, 130, 45, 65, 55, 485),
('Luvdisc', 370, 43, 30, 55, 40, 65, 97, 330),
('Bagon', 371, 45, 75, 60, 40, 30, 50, 300),
('Shelgon', 372, 65, 95, 100, 60, 50, 50, 420),
('Salamence', 373, 95, 135, 80, 110, 80, 100, 600),
('Beldum', 374, 40, 55, 80, 35, 60, 30, 300),
('Metang', 375, 60, 75, 100, 55, 80, 50, 420),
('Metagross', 376, 80, 135, 130, 95, 90, 70, 600),
('Regirock', 377, 80, 100, 200, 50, 100, 50, 580),
('Regice', 378, 80, 50, 100, 100, 200, 50, 580),
('Registeel', 379, 80, 75, 150, 75, 150, 50, 580),
('Latias', 380, 80, 80, 90, 110, 130, 110, 600),
('Latios', 381, 80, 90, 80, 130, 110, 110, 600),
('Kyogre', 382, 100, 100, 90, 150, 140, 90, 670),
('Groudon', 383, 100, 150, 140, 100, 90, 90, 670),
('Rayquaza', 384, 105, 150, 90, 150, 90, 95, 680),
('Jirachi', 385, 100, 100, 100, 100, 100, 100, 600),
('Deoxys', 386, 50, 150, 50, 150, 50, 150, 600),
('Deoxys Ataque', 386, 50, 180, 20, 180, 20, 150, 600),
('Deoxys Defensa', 386, 50, 70, 160, 70, 160, 90, 600),
('Deoxys Velocidad', 386, 50, 95, 90, 95, 90, 180, 600);
--4º Gen
INSERT INTO Pokemon (Nombre, Pokedex, HP, ATAQUE, DEFENSA, A_ESPECIAL, D_ESPECIAL, Velocidad, Total_Estat)
VALUES ('Turtwig', 387, 55, 68, 64, 45, 55, 31, 318),
('Grotle', 388, 75, 89, 85, 55, 65, 36, 405),
('Torterra', 389, 95, 109, 105, 75, 85, 56, 525),
('Chimchar', 390, 44, 58, 44, 58, 44, 61, 309),
('Monferno', 391, 64, 78, 52, 78, 52, 81, 405),
('Infernape', 392, 76, 104, 71, 104, 71, 108, 534),
('Piplup', 393, 53, 51, 53, 61, 56, 40, 314),
('Prinplup', 394, 64, 66, 68, 81, 76, 50, 405),
('Empoleon', 395, 84, 86, 88, 111, 101, 60, 530),
('Starly', 396, 40, 55, 30, 30, 30, 60, 245),
('Staravia', 397, 55, 75, 50, 40, 40, 80, 340),
('Staraptor', 398, 85, 120, 70, 50, 60, 100, 485),
('Bidoof', 399, 59, 45, 40, 35, 40, 31, 250),
('Bibarel', 400, 79, 85, 60, 55, 60, 71, 410),
('Kricketot', 401, 37, 25, 41, 25, 41, 25, 194),
('Kricketune', 402, 77, 85, 51, 55, 51, 65, 385),
('Shinx', 403, 45, 65, 34, 40, 34, 45, 263),
('Luxio', 404, 60, 85, 49, 60, 49, 60, 363),
('Luxray', 405, 80, 120, 79, 95, 76, 70, 523),
('Budew', 406, 40, 30, 35, 50, 70, 55, 280),
('Roserade', 407, 60, 70, 65, 125, 105, 90, 515),
('Cranidos', 408, 67, 125, 40, 30, 30, 58, 350),
('Rampardos', 409, 97, 165, 60, 65, 50, 58, 495),
('Shieldon', 410, 30, 42, 118, 42, 88, 30, 350),
('Bastiodon', 411, 60, 52, 168, 47, 138, 30, 495),
('Burmy', 412, 40, 29, 45, 29, 45, 36, 224),
('Wormadan Planta', 413, 60, 59, 85, 79, 105, 36, 424),
('Wormadan Arena', 413, 60, 79, 105, 59, 85, 36, 424),
('Wormadan Basura', 413, 60, 69, 95, 69, 95, 36, 424),
('Mothim', 414, 70, 94, 50, 94, 50, 66, 424),
('Combee', 415, 30, 30, 42, 30, 42, 70, 244),
('Vespiquenn', 416, 70, 80, 102, 80, 102, 40, 474),
('Pachirisu', 417, 60, 45, 70, 45, 90, 95, 405),
('Buizel', 418, 55, 65, 35, 60, 30, 85, 330),
('Floatzel', 419, 85, 105, 55, 85, 50, 115, 495),
('Cherubi', 420, 45, 35, 45, 62, 53, 35, 275),
('Cherrim', 421, 70, 60, 70, 87, 78, 85, 450),
('Shellos', 422, 76, 48, 48, 57, 62, 34, 325),
('Gastrodon', 423, 111, 83, 68, 92, 82, 39, 475),
('Ambipom', 424, 75, 100, 66, 60, 66, 115, 482),
('Drifloon', 425, 90, 50, 34, 60, 44, 70, 348),
('Drifblim', 426, 150, 80, 44, 90, 54, 80, 498),
('Buneary', 427, 55, 66, 44, 44, 56, 85, 350),
('Lopunny', 428, 65, 76, 84, 54, 96, 105, 480),
('Mismagius', 429, 60, 60, 60, 105, 105, 105, 495),
('Honchkrow', 430, 100, 125, 52, 105, 52, 71, 505),
('Glameow', 431, 49, 55, 42, 42, 37, 85, 310),
('Purugly', 432, 71, 82, 64, 64, 59, 112, 452),
('Chingling', 433, 45, 30, 50, 65, 50, 45, 285),
('Stunky', 434, 63, 63, 47, 41, 41, 74, 329),
('Skuntank', 435, 103, 93, 67, 71, 61, 84, 479),
('Bronzor', 436, 57, 24, 86, 24, 86, 23, 300),
('Bronzong', 437, 67, 89, 116, 79, 116, 33, 500),
('Bonsly', 438, 50, 80, 95, 10, 45, 10, 290),
('Mime Jr', 439, 20, 25, 45, 70, 90, 60, 310),
('Happiny', 440, 100, 5, 5, 15, 65, 30, 220),
('Chatot', 441, 76, 65, 45, 92, 42, 91, 411),
('Spiritomb', 442, 50, 92, 108, 92, 108, 35, 485),
('Gible', 443, 58, 70, 45, 40, 45, 42, 300),
('Gabite', 444, 68, 90, 65, 50, 55, 82, 410),
('Garchomp', 445, 108, 130, 95, 80, 85, 102, 600),
('Munchlax', 446, 135, 85, 40, 40, 85, 5, 390),
('Riolu', 447, 40, 70, 40, 35, 40, 60, 285),
('Lucario', 448, 70, 110, 70, 115, 70, 90, 525),
('Hippopotas', 449, 68, 72, 78, 38, 42, 32, 330),
('Hippowdon', 450, 108, 112, 118, 68, 72, 47, 525),
('Skorupi', 451, 40, 50, 90, 30, 55, 65, 330),
('Drapion', 452, 70, 90, 110, 60, 75, 95, 500),
('Croagunk', 453, 48, 61, 40, 61, 40, 50, 300),
('Toxicroak', 454, 83, 106, 65, 86, 65, 85, 490),
('Carnivine', 455, 74, 100, 72, 90, 72, 46, 454),
('Finneon', 456, 49, 49, 56, 49, 61, 66, 330),
('Lumineon', 457, 69, 69, 76, 69, 86, 91, 460),
('Mantyke', 458, 45, 20, 50, 60, 120, 50, 345),
('Snover', 459, 60, 62, 50, 62, 60, 40, 334),
('Abomasnow', 460, 90, 92, 75, 92, 85, 60, 494),
('Weavile', 461, 70, 120, 65, 45, 85, 125, 510),
('Magnezone', 462, 70, 70, 115, 130, 90, 60, 535),
('Lickilicky', 463, 110, 85, 95, 80, 95, 50, 515),
('Rhyperior', 464, 115, 140, 130, 55, 55, 40, 535),
('Tangrowth', 465, 100, 100, 125, 110, 50, 50, 535),
('Electivire', 466, 75, 123, 67, 95, 85, 95, 540),
('Magmortar', 467, 75, 95, 67, 125, 95, 83, 540),
('Togekiss', 468, 85, 50, 95, 120, 115, 80, 545),
('Yanmega', 469, 86, 76, 86, 116, 56, 95, 515),
('Leafeon', 470, 65, 110, 130, 60, 65, 95, 525),
('Glaceon', 471, 65, 60, 110, 130, 95, 65, 525),
('Gliscor', 472, 75, 95, 125, 45, 75, 95, 510),
('Mamoswine', 473, 110, 130, 80, 70, 60, 80, 530),
('Porygon Z', 474, 85, 80, 70, 135, 75, 90, 535),
('Gallade', 475, 68, 125, 65, 65, 115, 80, 518),
('Probopass', 476, 60, 55, 145, 75, 150, 40, 525),
('Dusknoir', 477, 45, 100, 135, 65, 135, 45, 525),
('Froslass', 478, 70, 80, 70, 80, 70, 110, 480),
('Rotom', 479, 50, 50, 77, 95, 77, 91, 440),
('Uxie', 480, 75, 75, 130, 75, 130, 95, 580),
('Mesprit', 481, 80, 105, 105, 105, 105, 80, 580),
('Azelf', 482, 75, 125, 70, 125, 70, 115, 580),
('Dialga', 483, 100, 120, 120, 150, 100, 90, 680),
('Palkia', 484, 90, 120, 100, 150, 120, 100, 680),
('Heatran', 485, 91, 90, 106, 130, 106, 77, 600),
('Regigigas', 486, 110, 160, 110, 80, 110, 100, 670),
('Giratina', 487, 150, 100, 120, 100, 120, 90, 680),
('Giratina Origen', 487, 150, 120, 100, 120, 100, 90, 680),
('Cresselia', 488, 120, 70, 120, 75, 130, 85, 600),
('Phione', 489, 80, 80, 80, 80, 80, 80, 480),
('Manaphy', 490, 100, 100, 100, 100, 100, 100, 600),
('Darkrai', 491, 70, 90, 90, 135, 90, 125, 600),
('Shaymin', 492, 100, 100, 100, 100, 100, 100, 600),
('Shaymin Cielo', 492, 100, 103, 75, 120, 75, 127, 600),
('Arceus', 493, 120, 120, 120, 120, 120, 120, 720);
--Tabla evolución
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
(172, 25),
(25, 26),
(27, 28),
(29, 30),
(30, 31),
(32, 33),
(33, 34),
(173, 35),
(35, 36),
(37, 38),
(174, 39),
(39, 40),
(41, 42),
(42, 169),
(43, 44),
(44, 45),
(44, 182),
(46, 47),
(48, 49),
(50, 51),
(52, 53),
(54, 55),
(56, 57),
(58, 59),
(60, 61),
(61, 62),
(61, 186),
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
(79, 199),
(81, 82),
(82, 467),
(84, 85),
(86, 87),
(88, 89),
(90, 91),
(92, 93),
(93, 94),
(95, 208),
(96, 97),
(98, 99),
(100, 101),
(102, 103),
(104, 105),
(236, 106),
(236, 107),
(236, 237),
(108, 468),
(109, 110),
(111, 112),
(112, 469),
(445, 113),
(113, 242),
(114, 470),
(116, 117),
(117, 230),
(118, 119),
(120, 121),
(444, 122),
(123, 212),
(238, 124),
(239, 125),
(125, 471),
(240, 126),
(126, 472),
(129, 130),
(133, 134),
(133, 135),
(133, 136),
(133, 196),
(133, 197),
(133, 470),
(133, 471),
(137, 233),
(233, 479),
(138, 139),
(140, 141),
(451, 143),
(147, 148),
(148, 149),
(152, 153),
(153, 154),
(155, 156),
(156, 157),
(158, 159),
(159, 160),
(161, 162),
(163, 164),
(165, 166),
(167, 168),
(170, 171),
(175, 176),
(176, 473),
(177, 178),
(179, 180),
(180, 181),
(298, 183),
(183, 184),
(443, 185),
(187, 188),
(188, 189),
(190, 429),
(191, 192),
(193, 474),
(195, 196),
(198, 435),
(200, 434),
(360, 202),
(204, 205),
(207, 477),
(209, 210),
(215, 466),
(216, 217),
(218, 219),
(220, 221),
(221, 478),
(223, 224),
(463, 226),
(228, 229),
(231, 232),
(246, 247),
(247, 248),
(252, 253),
(253, 254),
(255, 256),
(256, 257),
(258, 259),
(259, 260),
(261, 262),
(263, 264),
(265, 266),
(265, 268),
(266, 267),
(268, 269),
(270, 271),
(271, 272),
(273, 274),
(274, 275),
(276, 277),
(278, 279),
(280, 281),
(281, 282),
(283, 284),
(285, 286),
(287, 288),
(288, 289),
(290, 291),
(290, 292),
(293, 294),
(294, 295),
(296, 297),
(299, 481),
(300, 301),
(304, 305),
(305, 306),
(307, 308),
(309, 310),
(409, 315),
(315, 410),
(316, 317),
(318, 319),
(320, 321),
(322, 323),
(325, 326),
(328, 329),
(329, 330),
(331, 332),
(333, 334),
(339, 340),
(341, 342),
(345, 346),
(347, 348),
(349, 350),
(353, 354),
(355, 356),
(356, 482),
(438, 358),
(361, 362),
(361, 483),
(363, 364),
(364, 365),
(366, 367),
(366, 368),
(371, 372),
(372, 373),
(374, 375),
(375, 376),
(390, 391),
(391, 392),
(393, 394),
(394, 395),
(396, 397),
(397, 398),
(399, 400),
(400, 401),
(402, 403),
(404, 405),
(406, 407),
(407, 408),
(411, 412),
(413, 414),
(415, 416),
(415, 417),
(415, 418),
(415, 419),
(420, 421),
(423, 424),
(425, 426),
(427, 428),
(430, 431),
(432, 433),
(436, 437),
(439, 440),
(441, 442),
(448, 449),
(449, 450),
(452, 453),
(454, 455),
(456, 457),
(458, 459),
(461, 462),
(464, 465);
---------Tabla Tipos----------
INSERT INTO Pokemon_Tipo
VALUES (1, 11),
(1, 16),
(2, 11),
(2, 16),
(3, 11),
(3, 11),
(4, 7),
(5, 7),
(6, 7),
(6, 17),
(7, 2),
(8, 2),
(9, 2),