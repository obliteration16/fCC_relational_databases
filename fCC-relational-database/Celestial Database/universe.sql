--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.19 (Ubuntu 12.19-0ubuntu0.20.04.1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_km numeric(10,2) NOT NULL,
    composition text,
    has_moon boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    size integer,
    is_visible boolean NOT NULL,
    distance_from_earth numeric(10,2)
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period_days integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    mass_in_earth_masses numeric(10,2) NOT NULL,
    is_inhabitable boolean NOT NULL,
    distance_from_star integer,
    has_rings boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    brightness numeric(8,2) NOT NULL,
    temperature integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 'Dwarf planet', true, 1801);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512.00, 'Metallic', false, 1802);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525.60, 'Rocky', false, 1807);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434.00, 'Carbonaceous', false, 1849);
INSERT INTO public.asteroid VALUES (5, 'Juno', 234.00, 'Metallic', false, 1804);
INSERT INTO public.asteroid VALUES (6, 'Eros', 16.80, 'Rocky', true, 1898);
INSERT INTO public.asteroid VALUES (7, 'Itokawa', 0.32, 'Carbonaceous', true, 1998);
INSERT INTO public.asteroid VALUES (8, 'Gaspra', 12.00, 'Rocky', false, 1991);
INSERT INTO public.asteroid VALUES (9, 'Bennu', 0.49, 'Carbonaceous', true, 1999);
INSERT INTO public.asteroid VALUES (10, 'Apophis', 0.27, 'Rocky', false, 2004);
INSERT INTO public.asteroid VALUES (11, 'Toutatis', 4.60, 'Metallic', false, 1934);
INSERT INTO public.asteroid VALUES (12, 'Ryugu', 0.87, 'Carbonaceous', true, 1999);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 100000, true, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 220000, true, 2.54);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 50000, true, 3.02);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy in the constellation Ursa Major', 150000, true, 23.20);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Large spiral galaxy in the constellation Ursa Major', 200000, true, 11.80);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy in the constellation Virgo', 130000, true, 28.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.80, false, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.40, false, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.40, false, 1);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.20, true, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.60, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268.20, true, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821.60, true, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150.00, true, 16);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 1527.60, false, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1469.00, false, 79);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 471.60, false, 1);
INSERT INTO public.moon VALUES (12, 'Ariel', 5, 1158.80, false, 3);
INSERT INTO public.moon VALUES (13, 'Umbriel', 5, 1169.00, false, 4);
INSERT INTO public.moon VALUES (14, 'Titania', 5, 1577.60, false, 9);
INSERT INTO public.moon VALUES (15, 'Oberon', 5, 1523.60, false, 13);
INSERT INTO public.moon VALUES (16, 'Charon', 6, 1212.00, false, 6);
INSERT INTO public.moon VALUES (17, 'Nix', 6, 45.00, false, 0);
INSERT INTO public.moon VALUES (18, 'Hydra', 6, 61.00, false, 0);
INSERT INTO public.moon VALUES (19, 'Kerberos', 6, 19.00, false, 0);
INSERT INTO public.moon VALUES (20, 'Styx', 6, 10.00, false, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, true, 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.11, false, 2, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.80, false, 5, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 95.20, false, 10, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 14.50, false, 19, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 17.10, false, 30, true);
INSERT INTO public.planet VALUES (7, 'Mercury', 2, 0.06, false, 0, false);
INSERT INTO public.planet VALUES (8, 'Venus', 2, 0.82, false, 1, false);
INSERT INTO public.planet VALUES (9, 'Gliese 581c', 2, 5.00, true, 0, false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 2.42, true, 1, false);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 0.69, false, 0, false);
INSERT INTO public.planet VALUES (12, 'Kepler-16b', 2, 0.68, false, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 5778);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1.52, 5790);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 25.40, 9940);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 0.50, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 11.50, 12000);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 0.20, 3050);
INSERT INTO public.star VALUES (7, 'Altair', 2, 10.20, 7600);
INSERT INTO public.star VALUES (8, 'Deneb', 2, 6.40, 8500);
INSERT INTO public.star VALUES (9, 'Arcturus', 2, 0.30, 4300);
INSERT INTO public.star VALUES (10, 'Vega', 2, 40.00, 9600);
INSERT INTO public.star VALUES (11, 'Pollux', 2, 1.40, 4900);
INSERT INTO public.star VALUES (12, 'Castor', 2, 0.80, 7900);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

