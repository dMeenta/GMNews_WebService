-- Creación de la base de datos
CREATE DATABASE GMNews_db;
USE GMNews_db;

-- Tabla de Juegos
CREATE TABLE juegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    imgUrl VARCHAR(255),
    -- No se utilizó DATE para que solo se muestre la fecha en la aplicación
    fecha_lanzamiento CHAR(10)
);

-- Tabla de Noticias
CREATE TABLE noticias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    juego_id INT,
    FOREIGN KEY (juego_id) REFERENCES juegos(id)
);

-- Vista NoticiasVista
CREATE VIEW NoticiasVista AS
SELECT
    n.titulo AS title,
    n.contenido AS content,
    j.nombre AS game
FROM
    noticias n
JOIN
    juegos j ON n.juego_id = j.id;

-- Juegos
INSERT INTO juegos (nombre, descripcion, imgUrl, fecha_lanzamiento)
VALUES
('League of Legends', 'Juego de estrategia en equipo', 'https://elcomercio.pe/resizer/IrZYeGAlGr2gwnJbz_p3Io7i3Ow=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/HOMYBLKG3VADHOEPWNR5YX4ATA.jpg', '2009-10-27'),
('Valorant', 'Juego de disparos en primera persona', 'https://img.redbull.com/images/c_crop,w_1920,h_960,x_0,y_103,f_auto,q_auto/c_scale,w_1200/redbullcom/2020/6/5/ctsejxmdtw9inp8zqqqd/valorant', '2020-06-02'),
('Teamfight Tactics', 'Auto Chess de Riot Games', 'https://i.blogs.es/b1b2bf/tft-para-moviles/840_560.jpg', '2019-06-26'),
('Legends of Runeterra', 'Juego de cartas estratégico', 'https://playruneterra.com/assets/40e627242a81ffc9103aa45d356c6b8cee7b5843/static/image/share-image.jpg', '2020-04-29'),
('Wild Rift', 'Versión móvil de League of Legends', 'https://img.asmedia.epimg.net/resizer/v2/K6I576WZANMD5JWFDLWEDDVTGE.jpg?auth=6c36fbbeff44c7092925082fa499d835f671d1502d462de6160e8b8a45dde052&width=644&height=362&smart=true', '2020-10-27'),
('Counter-Strike: Global Offensive', 'Juego de disparos en primera persona táctico.', 'https://cdn.akamai.steamstatic.com/steam/apps/730/header.jpg', '2012-08-21'),
('Fortnite', 'Juego de batalla real con elementos de construcción.', 'https://img.asmedia.epimg.net/resizer/v2/D457WHE2Z5ESRB2R75QYBA63KQ.jpg?auth=87ba7eea04a3e9e8a2b8e40becc57b4828fc25aa38f5919af8ff07681ae8c9ae&width=644&height=362&smart=true', '2017-07-25'),
('Dota 2', 'Juego de estrategia en equipo.', 'https://cdn.cloudflare.steamstatic.com/steam/apps/570/header.jpg', '2013-07-09'),
('Among Us', 'Juego de fiesta en línea de supervivencia y traición.', 'https://cdn.akamai.steamstatic.com/steam/apps/945360/header.jpg', '2018-11-16'),
('Apex Legends', 'Juego de disparos en primera persona de estilo battle royale.', 'https://img.asmedia.epimg.net/resizer/v2/EI24RGV4U5ADHIHIRRKUHEFBJE.jpg?auth=dde60b54fc0c928f256fbeef889ca3e17246355610a2218479df316bdd68e309&width=644&height=362&smart=true', '2019-02-04'),
('Minecraft', 'Juego de construcción y aventura.', 'https://image.api.playstation.com/gs2-sec/appkgo/prod/CUSA00265_00/8/i_1c2d1812f27ec71285072e191d1822134e4f9730141c88537d87837014a17295/i/icon0.png', '2009-05-17'),
('Grand Theft Auto V', 'Juego de acción y aventura en mundo abierto.', 'https://phantom-marca-mx.unidadeditorial.es/b6728e2232f92786a7f6d50c50a7e36d/resize/828/f/jpg/mx/assets/multimedia/imagenes/2024/02/05/17070878111134.jpg', '2013-09-17');

-- Noticias
INSERT INTO noticias (titulo, contenido, juego_id)
VALUES
('Nueva actualización en League of Legends', 'Se han añadido nuevos campeones y skins.', 1),
('Torneo de Valorant en Julio', 'Participa en el próximo torneo mundial de Valorant.', 2),
('Nueva actualización en Teamfight Tactics', '¡Prepárate para la nueva temporada de TFT con cambios en el metajuego y nuevos campeones!', 3),
('Evento de Legends of Runeterra: Festival de la Flor de la Cosecha', 'Celebra la temporada de la Flor de la Cosecha con nuevos desafíos y recompensas en LoR.', 4),
('Wild Rift anuncia su primer torneo mundial', 'Los mejores jugadores de Wild Rift de todo el mundo se enfrentarán en el primer torneo mundial.', 5),
('Counter-Strike: Global Offensive recibe una actualización de mapas', 'Se han realizado cambios en varios mapas populares para mejorar la jugabilidad y el equilibrio.', 6),
('Fortnite presenta colaboración con Marvel para su próxima temporada', 'Los héroes de Marvel llegan a Fortnite en una emocionante colaboración que incluye nuevas skins y eventos.', 7),
('Dota 2 anuncia el lanzamiento de su próximo torneo internacional', 'El evento más grande de Dota 2 regresa con un premio récord y la participación de los mejores equipos del mundo.', 8),
('Among Us introduce nuevas opciones de personalización', 'Personaliza tu experiencia de juego con nuevas opciones de sombreros, mascotas y skins en Among Us.', 9),
('Apex Legends revela nuevos mapas y modos de juego para la próxima temporada', 'Prepárate para explorar nuevos mapas y disfrutar de emocionantes modos de juego en la próxima temporada de Apex Legends.', 10),
('Minecraft anuncia la actualización Caves & Cliffs: Parte 2', 'La segunda parte de la actualización Caves & Cliffs llega con nuevas criaturas, bloques y características para explorar en Minecraft.', 11),
('Grand Theft Auto V celebra su décimo aniversario con eventos especiales', 'Únete a las festividades por el décimo aniversario de GTA V con eventos, descuentos y recompensas especiales en línea y fuera de línea.', 12),
('Nuevo campeón llega a League of Legends', 'Conoce las habilidades y la historia del último campeón en unirse al campo de batalla en League of Legends.', 1),
('Se anuncia un evento especial de Halloween en Valorant', 'Participa en el evento de Halloween de Valorant y gana recompensas exclusivas durante toda la temporada.', 2),
('Teamfight Tactics presenta un nuevo conjunto de campeones', 'Explora el conjunto de campeones temáticos de fantasía y estrategias únicas en la última temporada de TFT.', 3),
('Legends of Runeterra lanza su primera expansión', 'Descubre nuevas cartas, mecánicas y estrategias con la llegada de la primera expansión de LoR: "Caminos de Shurima".', 4),
('Wild Rift celebra su primer aniversario con eventos y recompensas', 'Únete a la celebración del primer año de Wild Rift con eventos en el juego y recompensas exclusivas para los jugadores.', 5),
('Counter-Strike: Global Offensive recibe una actualización de equilibrio', 'Se implementan ajustes de equilibrio en armas y mapas para mejorar la experiencia competitiva en CS:GO.', 6),
('Fortnite anuncia colaboración con artistas de renombre para conciertos virtuales', 'Prepárate para disfrutar de conciertos virtuales exclusivos en Fortnite con artistas populares de la música.', 7),
('Dota 2 presenta un nuevo evento de temporada', 'Participa en el evento de temporada de Dota 2 y gana recompensas exclusivas, incluyendo cosméticos y tesoros.', 8),
('Among Us añade nuevas funciones de juego para aumentar la diversión', 'Experimenta nuevas formas de jugar con funciones adicionales como la personalización de partidas y modos de juego especiales.', 9),
('Apex Legends introduce un nuevo modo de juego por tiempo limitado', 'Ponte a prueba en el nuevo modo de juego "Armadura Evolutiva" y demuestra tu habilidad en Apex Legends.', 10),
('Minecraft anuncia una colaboración con Disney para contenido temático', 'Explora el mundo de Minecraft con nuevos packs de contenido temático de Disney que llegan próximamente al juego.', 11),
('Grand Theft Auto V presenta una expansión de historia para el modo individual', 'Descubre una nueva aventura en Los Santos con la expansión de historia "El Legado de Lamar" para GTA V.', 12);