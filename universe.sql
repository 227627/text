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
-- Name: fplant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fplant (
    fplant_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.fplant OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric
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
    planet_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric
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
    star_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric
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
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.fplant.fplant_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric
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
-- Name: fplant fplant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fplant ALTER COLUMN fplant_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


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
-- Data for Name: fplant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fplant VALUES (1, 'Terrestrial', 'Small, rocky planets', false, true);
INSERT INTO public.fplant VALUES (2, 'Gas Giant', 'Large planets composed mainly of gas', false, true);
INSERT INTO public.fplant VALUES (3, 'Ice Giant', 'Large planets composed mainly of ice and gas', false, true);
INSERT INTO public.fplant VALUES (4, 'Dwarf', 'Smaller planets or large moons', false, true);
INSERT INTO public.fplant VALUES (5, 'Exoplanet', 'Planets outside our solar system', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, true, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 6000, true, 2920000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular galaxy', 1000, false, 163000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular galaxy', 1000, false, 200000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy', 10000, true, 29300000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 4540, true, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 4600, false, 0.52);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 4600, false, 0.52);
INSERT INTO public.moon VALUES (4, 'Io', 3, 4600, true, 4.2);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 4600, true, 4.2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 4600, true, 4.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4600, true, 4.2);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (11, 'Titania', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (12, 'Oberon', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (13, 'Triton', 6, 4600, true, 29.07);
INSERT INTO public.moon VALUES (14, 'Proteus', 6, 4600, true, 29.07);
INSERT INTO public.moon VALUES (15, 'Charon', 6, 4600, true, 29.07);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, 4600, true, 29.07);
INSERT INTO public.moon VALUES (17, 'Miranda', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (18, 'Ariel', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (19, 'Umbriel', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (20, 'Enceladus', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (21, 'Dione', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (22, 'Tethys', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (23, 'Hyperion', 4, 4600, false, 8.52);
INSERT INTO public.moon VALUES (24, 'Mimas', 4, 4600, true, 8.52);
INSERT INTO public.moon VALUES (25, 'Puck', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (26, 'Cordelia', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (27, 'Ophelia', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (28, 'Bianca', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (29, 'Cressida', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (30, 'Desdemona', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (31, 'Juliet', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (32, 'Portia', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (33, 'Rosalind', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (34, 'Belinda', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (35, 'Perdita', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (36, 'Caliban', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (37, 'Sycorax', 5, 4600, true, 18.2);
INSERT INTO public.moon VALUES (38, 'Larissa', 6, 4600, true, 29.07);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 4540, true, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 4600, true, 0.52);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 4600, true, 4.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 4600, true, 8.52);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 4600, true, 18.2);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 4600, true, 29.07);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 4500, true, 0.28);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 4500, true, 0.39);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 3, 4850, true, 4.24);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 1, 6000, true, 1400);
INSERT INTO public.planet VALUES (11, 'Gliese 581 d', 1, 2000, true, 20.3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, 500, true, 150);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, false, 0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 240, false, 8.6);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4850, false, 4.37);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8500, false, 642.5);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, false, 25.04);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 70, false, 433);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 38, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: fplant planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fplant
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: fplant planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fplant
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (fplant_id);


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
