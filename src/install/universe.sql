CREATE DATABASE IF NOT EXISTS universe;

USE universe;

CREATE TABLE planets
(
    id          serial PRIMARY KEY,
    name        text           NOT NULL,
    description text,
    image       text,
    price       numeric(10, 2) NOT NULL,
    created_at  timestamp      NOT NULL DEFAULT NOW()
);

INSERT INTO planets (name, description, image, price)
VALUES ('Earth',
        'The Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29.2% of Earth''s surface is land consisting of continents and islands. The remaining 70.8% is covered with water, mostly by oceans but also lakes, rivers and other fresh water, which together constitute the hydrosphere. On Earth, 71% of the surface is covered with salt water oceans.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/The_Earth_seen_from_Apollo_17.jpg/1200px-The_Earth_seen_from_Apollo_17.jpg',
        100.00),
       ('Mars',
        'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war, and is often referred to as the "Red Planet" because the reddish iron oxide prevalent on its surface gives it a reddish appearance that is distinctive among the astronomical bodies visible to the naked eye. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/1200px-OSIRIS_Mars_true_color.jpg',
        200.00),
       ('Venus',
        'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in Earth''s night sky after the Moon, Venus can cast shadows and, rarely, is visible to the naked eye in broad daylight. Venus lies within Earth''s orbit, and so never appears to venture far from the Sun, either setting in the west just after dusk or rising in the east a bit before dawn. Venus orbits the Sun every 224.7 Earth days.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Venus-real_color.jpg/1200px-Venus-real_color.jpg',
        300.00),
       ('Mercury',
        'Mercury is the smallest and innermost planet in the Solar System. Its orbital period around the Sun of 87.97 days is the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger to the gods. Like Venus, Mercury orbits the Sun within Earth''s orbit as a inferior planet, and never appears to venture far from the Sun, setting in the west just after dusk or rising in the east a bit before dawn.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Mercury_in_color_-_Prockter07-edit1.jpg/1200px-Mercury_in_color_-_Prockter07-edit1.jpg',
        400.00),
       ('Jupiter',
        'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/1200px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg',
        500.00),
       ('Saturn',
        'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth. Although it has only one-eighth the average density of Earth, with its larger volume Saturn is over 95 times more massive. Saturn is named after the Roman god of agriculture; its astronomical symbol represents the god''s sickle.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Saturn_during_Equinox.jpg/1200px-Saturn_during_Equinox.jpg',
        600.00),
       ('Uranus',
        'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have bulk chemical compositions which differ from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as "ice giants" to distinguish them from the other gas giants. Uranus'' atmosphere is similar to Jupiter''s and Saturn''s in its primary composition of hydrogen and helium, but it contains more "ices" such as water, ammonia, and methane, along with traces of other hydrocarbons. It is the coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 K (−224 °C; −371 °F). Uranus has a complex, layered cloud structure with water thought to make up the lowest clouds and methane the uppermost layer of clouds.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Uranus2.jpg/1200px-Uranus2.jpg', 700.00),
       ('Neptune',
        'Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth, slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and is the third-largest planet in the Solar System. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 astronomical units (4.5 billion km; 2.8 billion mi). It is named after the Roman god of the sea and has the astronomical symbol ♆, a stylised version of the god Neptune''s trident.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Neptune_Full.jpg/1200px-Neptune_Full.jpg', 800.00);

