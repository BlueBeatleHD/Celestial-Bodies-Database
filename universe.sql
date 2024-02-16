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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    date date NOT NULL,
    description text,
    is_visible boolean NOT NULL,
    is_transient boolean NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_celestial_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_celestial_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_celestial_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    size numeric(10,2) NOT NULL,
    has_supermassive_black_hole boolean NOT NULL,
    discovered boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    radius double precision NOT NULL,
    mass double precision NOT NULL,
    is_inhabited boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    radius double precision NOT NULL,
    mass double precision NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    luminosity numeric(10,2) NOT NULL,
    is_binary_star boolean NOT NULL
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_celestial_event_id_seq'::regclass);


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
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'Comet NEOWISE', '2024-07-15', 'Comet NEOWISE will be visible in the evening sky.', true, false, NULL, NULL);
INSERT INTO public.celestial_event VALUES (2, 'Leonid Meteor Shower', '2024-11-17', 'Annual meteor shower, associated with the comet Tempel-Tuttle.', true, false, NULL, NULL);
INSERT INTO public.celestial_event VALUES (3, 'Total Lunar Eclipse', '2024-05-15', 'A total lunar eclipse will be visible from parts of Asia, Australia, and the Americas.', true, false, NULL, NULL);
INSERT INTO public.celestial_event VALUES (4, 'Mercury Transit', '2024-11-13', 'Mercury will pass directly between Earth and the Sun.', true, false, NULL, NULL);
INSERT INTO public.celestial_event VALUES (5, 'Geminid Meteor Shower', '2024-12-14', 'One of the most active meteor showers of the year.', true, false, NULL, NULL);
INSERT INTO public.celestial_event VALUES (6, 'Mars Opposition', '2024-10-13', 'Mars will be at its closest approach to Earth and its face will be fully illuminated by the Sun.', true, false, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000.00, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2000000.00, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 300000.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 150000.00, true, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 120000.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Irregular', 80000.00, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, 7.342e+22, false);
INSERT INTO public.moon VALUES (2, 'Europa', 2, 1560, 4.8e+22, false);
INSERT INTO public.moon VALUES (3, 'Titan', 4, 2576, 1.345e+23, false);
INSERT INTO public.moon VALUES (4, 'Triton', 5, 1353, 2.147e+22, false);
INSERT INTO public.moon VALUES (5, 'Phobos', 3, 11, 1.0659e+16, false);
INSERT INTO public.moon VALUES (6, 'Deimos', 3, 6, 2.4e+15, false);
INSERT INTO public.moon VALUES (7, 'Ganymede', 2, 2634, 1.4819e+23, false);
INSERT INTO public.moon VALUES (8, 'Io', 2, 1821, 8.9319e+22, false);
INSERT INTO public.moon VALUES (9, 'Callisto', 2, 2410, 1.0759e+23, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 252, 1.08e+20, false);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 235, 6.59e+19, false);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 606, 1.586e+21, false);
INSERT INTO public.moon VALUES (13, 'Phoebe', 4, 106.5, 8.292e+18, false);
INSERT INTO public.moon VALUES (14, 'Rhea', 4, 764, 2.3166e+21, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 4, 735, 1.8052999999999999e+21, false);
INSERT INTO public.moon VALUES (16, 'Dione', 4, 561.4, 1.0955e+21, false);
INSERT INTO public.moon VALUES (17, 'Mimas', 4, 198.2, 3.7493e+19, false);
INSERT INTO public.moon VALUES (18, 'Hyperion', 4, 133, 5.62e+18, false);
INSERT INTO public.moon VALUES (19, 'Nereid', 5, 170, 3.11e+19, false);
INSERT INTO public.moon VALUES (20, 'Proteus', 5, 210, 5.29e+19, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 5.972e+24, true);
INSERT INTO public.planet VALUES (2, 'Jupiter', 2, 69911, 1.898e+27, true);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 3390, 6.417e+23, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 60268, 5.683e+26, true);
INSERT INTO public.planet VALUES (5, 'Neptune', 2, 24622, 1.0239999999999999e+26, true);
INSERT INTO public.planet VALUES (6, 'Kepler-452b', 6, 24000, 5e+26, true);
INSERT INTO public.planet VALUES (7, 'Gliese 876 d', 5, 20000, 3e+26, false);
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 4, 18000, 4e+26, true);
INSERT INTO public.planet VALUES (9, 'PSR B1257+12 A', 3, 17000, 2e+26, false);
INSERT INTO public.planet VALUES (10, 'PSR B1257+12 B', 3, 12000, 1.5e+26, false);
INSERT INTO public.planet VALUES (11, 'TrES-4', 6, 22000, 6e+26, true);
INSERT INTO public.planet VALUES (12, 'KELT-9b', 6, 19000, 2e+26, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.00, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 'G2V', 1.50, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1Ia', 100000.00, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A1V', 25.00, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 'M5.5V', 0.00, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0Va', 37.00, false);


--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_celestial_event_id_seq', 6, true);


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
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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
-- Name: celestial_event unique_celestial_event_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT unique_celestial_event_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

