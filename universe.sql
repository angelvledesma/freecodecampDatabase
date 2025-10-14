--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    diameter_km numeric NOT NULL,
    has_life boolean NOT NULL,
    first_recorded integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type text NOT NULL,
    description text,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_black_hole boolean NOT NULL
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
    description text,
    diameter_km numeric NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer NOT NULL
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
    description text,
    planet_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL
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
    description text,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    temperature integer NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Angel', 'First Comet Recorded', 12, false, 1823);
INSERT INTO public.comet VALUES (2, 'BLue', 'Blue Comet', 5, false, 1952);
INSERT INTO public.comet VALUES (3, 'Life', 'Life Comet', 2, true, 2004);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Our Galaxy', 'Spiral', 13600, 0, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Nearest galaxy', 'Spiral', 10000, 2500000, true);
INSERT INTO public.galaxy VALUES ('Table', 3, 'Young Galaxy', 'Spiral', 100, 25000000, false);
INSERT INTO public.galaxy VALUES ('Napkin', 4, 'Distant Galaxy', 'Oval', 1000000, 35000000, true);
INSERT INTO public.galaxy VALUES ('Gas', 5, 'Mostly Gas Galaxy', 'Gas Like', 3000000, 15000000, false);
INSERT INTO public.galaxy VALUES ('Coffee', 6, 'Distant Galaxy', 'Sprial', 45023000, 1230000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our Moon', 3474.8, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon', 22.2, true, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon', 12.4, true, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter moon', 3643, true, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter moon', 3122, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter moon', 5268, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter moon', 4820, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn moon', 5150, true, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Saturn moon', 1528, true, false, 6);
INSERT INTO public.moon VALUES (10, 'Titania', 'Uranus moon', 1578, true, false, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Uranus moon', 1523, true, false, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 'Neptune moon', 2707, true, false, 8);
INSERT INTO public.moon VALUES (13, 'Luna', 'Blue Moon', 1234, true, false, 9);
INSERT INTO public.moon VALUES (14, 'Zerbra', 'Striped Moon', 114, true, false, 9);
INSERT INTO public.moon VALUES (15, 'Elephant', 'Big Moon', 111234, true, false, 12);
INSERT INTO public.moon VALUES (16, 'Monkey', 'Moon with Life', 1124, true, true, 12);
INSERT INTO public.moon VALUES (17, 'Dog', 'Small Moon', 14, true, false, 11);
INSERT INTO public.moon VALUES (18, 'Cat', 'Another Moon', 2234, true, false, 10);
INSERT INTO public.moon VALUES (19, 'Worm', 'Broken Moon', 224, false, false, 11);
INSERT INTO public.moon VALUES (20, 'Bird', 'Moon', 2324, true, false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our Planet', 'Rocky', 4500, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Closest to Sun', 'Rocky', 4500, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from Sun', 'Rocky', 4500, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet', 'Rocky', 4500, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet', 'Gas Giant', 4500, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed planet', 'Gas Giant', 4500, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Blue', 'Gas Giant', 4500, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet', 'Gas Giant', 4500, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Anchor', 'Exoplanet', 'Rocky', 4500, false, true, 2);
INSERT INTO public.planet VALUES (10, 'Laptop Planet', 'Hot Planet', 'Lava', 2300, false, false, 3);
INSERT INTO public.planet VALUES (11, 'Mouse II', 'Gas Giant', 'Gas Giant', 4500, false, true, 4);
INSERT INTO public.planet VALUES (12, 'Regal IV', 'Ringed Planet', 'Gas Giant', 6700, false, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our Star', 'Yellow Dwarf', 4232, 5321, true, 1);
INSERT INTO public.star VALUES (2, 'Apple', 'Closest Star', 'Blue Dwarf', 2312, 21312, true, 1);
INSERT INTO public.star VALUES (3, 'orange', 'Brighest Star in near Galaxy', 'Yellow  Dwarf', 123, 2312, true, 2);
INSERT INTO public.star VALUES (4, 'Chair', 'Largest Known Star', 'Green  Dwarf', 123123, 5123312, true, 3);
INSERT INTO public.star VALUES (5, 'Boiler', 'Hottest Star', 'Red  Dwarf', 23123, 712223312, false, 4);
INSERT INTO public.star VALUES (6, 'Oval', 'Oval Shaped Star', 'Purple  Dwarf', 123123, 3312, false, 5);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

