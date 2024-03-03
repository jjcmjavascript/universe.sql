--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass numeric NOT NULL,
    distance_light_years integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    distance_light_years integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    year_discovered integer,
    has_life boolean DEFAULT false NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    year_discovered integer,
    has_water boolean DEFAULT false NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    distance_light_years integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagitario A*', 4300000, 25900, true, 1, 'Un agujero negro supermasivo en el centro de la Vía Láctea.');
INSERT INTO public.black_hole VALUES (2, 'M87*', 6500000000, 53000000, true, 2, 'Un gigantesco agujero negro en el centro de la galaxia Virgo A.');
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 14.8, 6070, false, 1, 'Uno de los primeros agujeros negros estelares descubiertos.');
INSERT INTO public.black_hole VALUES (4, 'V404 Cygni', 9, 7800, true, 1, 'Un sistema binario conocido por sus violentas erupciones.');
INSERT INTO public.black_hole VALUES (5, 'Gargantua', 10000000, 100000, false, 3, 'Agujero negro ficticio de la película Interstellar.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 105700, 0, true, 'Nuestra galaxia.');
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 220000, 2537000, false, 'La galaxia más cercana a la Vía Láctea.');
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 60000, 3000000, false, 'También conocida como M33.');
INSERT INTO public.galaxy VALUES (4, 'Magallanes Grande', 14000, 163000, false, 'Galaxia satélite de la Vía Láctea.');
INSERT INTO public.galaxy VALUES (5, 'Magallanes Pequeña', 7000, 200000, false, 'Otra galaxia satélite de la Vía Láctea.');
INSERT INTO public.galaxy VALUES (6, 'Enana del Can Mayor', 5200, 25000, false, 'Una de las galaxias satélites más cercanas a la Vía Láctea.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, -500, false, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 12, 1877, false, 2);
INSERT INTO public.moon VALUES (3, 'Fobos', 22, 1877, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 1610, false, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 1610, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 5262, 1610, false, 4);
INSERT INTO public.moon VALUES (7, 'Calisto', 4821, 1610, false, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', 396, 1789, false, 5);
INSERT INTO public.moon VALUES (9, 'Encélado', 504, 1789, true, 5);
INSERT INTO public.moon VALUES (10, 'Tetis', 1062, 1684, false, 5);
INSERT INTO public.moon VALUES (11, 'Dione', 1123, 1684, false, 5);
INSERT INTO public.moon VALUES (12, 'Rea', 1528, 1672, false, 5);
INSERT INTO public.moon VALUES (13, 'Titán', 5150, 1655, true, 5);
INSERT INTO public.moon VALUES (14, 'Jápeto', 1436, 1671, false, 5);
INSERT INTO public.moon VALUES (15, 'Miranda', 472, 1948, false, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 1158, 1851, false, 6);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169, 1851, false, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 1578, 1787, false, 6);
INSERT INTO public.moon VALUES (19, 'Oberón', 1523, 1787, false, 6);
INSERT INTO public.moon VALUES (20, 'Tritón', 2707, 1846, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 12742, 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 6779, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Júpiter', 139822, 0, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturno', 116464, 0, false, 1);
INSERT INTO public.planet VALUES (6, 'Urano', 50724, 1781, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptuno', 49244, 1846, false, 1);
INSERT INTO public.planet VALUES (8, 'Mercurio', 4879, 0, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 30500, 2011, true, 1);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 14000, 2010, true, 1);
INSERT INTO public.planet VALUES (11, 'Proxima b', 11800, 2016, true, 1);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 13000, 2017, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 0, true, 1);
INSERT INTO public.star VALUES (2, 'Sirio', 2, 9, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 887, 642, false, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 78, 860, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 2, 25, false, 1);


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_holes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

