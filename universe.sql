--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    trivia text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dist_ly numeric NOT NULL,
    constellation_id integer,
    galaxy_type_id integer,
    rotation character varying(30)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    kt_approval boolean
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    radius_km numeric,
    orbital_period_days numeric,
    kt_rating integer NOT NULL
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
    star_id integer,
    temperature numeric,
    dist_ly numeric,
    habitable_zone boolean
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
    dist_ly numeric NOT NULL,
    galaxy_id integer,
    planets integer,
    age_mil_years numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (2, 'Aquarius', NULL);
INSERT INTO public.constellation VALUES (3, 'Aquila', NULL);
INSERT INTO public.constellation VALUES (4, 'Aries', NULL);
INSERT INTO public.constellation VALUES (5, 'Caelum', NULL);
INSERT INTO public.constellation VALUES (6, 'Cancer', NULL);
INSERT INTO public.constellation VALUES (7, 'Capricornus', NULL);
INSERT INTO public.constellation VALUES (8, 'Cassiopeia', NULL);
INSERT INTO public.constellation VALUES (9, 'Cygnus', NULL);
INSERT INTO public.constellation VALUES (10, 'Dorado', NULL);
INSERT INTO public.constellation VALUES (11, 'Gemini', NULL);
INSERT INTO public.constellation VALUES (12, 'Hercules', NULL);
INSERT INTO public.constellation VALUES (13, 'Horologium', NULL);
INSERT INTO public.constellation VALUES (14, 'Hydra', NULL);
INSERT INTO public.constellation VALUES (15, 'Leo', NULL);
INSERT INTO public.constellation VALUES (16, 'Libra', NULL);
INSERT INTO public.constellation VALUES (17, 'Lynx', NULL);
INSERT INTO public.constellation VALUES (18, 'Mensa', NULL);
INSERT INTO public.constellation VALUES (19, 'Orion', NULL);
INSERT INTO public.constellation VALUES (20, 'Pegasus', NULL);
INSERT INTO public.constellation VALUES (21, 'Perseus', NULL);
INSERT INTO public.constellation VALUES (22, 'Phoenix', NULL);
INSERT INTO public.constellation VALUES (23, 'Pisces', NULL);
INSERT INTO public.constellation VALUES (24, 'Sagittarius', NULL);
INSERT INTO public.constellation VALUES (25, 'Scorpius', NULL);
INSERT INTO public.constellation VALUES (26, 'Taurus', NULL);
INSERT INTO public.constellation VALUES (27, 'Triangulum', NULL);
INSERT INTO public.constellation VALUES (28, 'Ursa Major', NULL);
INSERT INTO public.constellation VALUES (29, 'Ursa Minor', NULL);
INSERT INTO public.constellation VALUES (30, 'Virgo', NULL);
INSERT INTO public.constellation VALUES (31, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (32, 'Canes Venatici', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0265, 24, 2, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.538, 1, 2, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 11.8, 28, 2, NULL);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 12.01, 31, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 200, 31, 2, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 0.769, 32, 2, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', NULL);
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, NULL, 8);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, NULL, NULL, 7);
INSERT INTO public.moon VALUES (4, 'Io', 3, NULL, NULL, 9);
INSERT INTO public.moon VALUES (5, 'Europa', 3, NULL, NULL, 7);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, NULL, NULL, 8);
INSERT INTO public.moon VALUES (7, 'Ganymede', 3, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 4, NULL, NULL, 2);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Dione', 4, NULL, NULL, 3);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, NULL, NULL, 10);
INSERT INTO public.moon VALUES (15, 'Phoebe', 4, NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Hyperion', 4, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'Janus', 4, NULL, NULL, 3);
INSERT INTO public.moon VALUES (18, 'Epimetheus', 4, NULL, NULL, 3);
INSERT INTO public.moon VALUES (19, 'Prometheus', 4, NULL, NULL, 2);
INSERT INTO public.moon VALUES (20, 'Pandora', 4, NULL, NULL, 5);
INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri d', 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Tau Ceti g', 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Tau Ceti e', 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Tau Ceti f', 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Gilese 581 e', 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Gilese 581 b', 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Gilese 581 c', 6, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 0, 1, 8, NULL);
INSERT INTO public.star VALUES (2, 'Promxima Centauri', 4.2, 1, 2, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 8.6, 1, 0, NULL);
INSERT INTO public.star VALUES (4, 'Procyon', 11.46, 1, 0, NULL);
INSERT INTO public.star VALUES (5, 'Tau Ceti', 11.91, 1, 4, NULL);
INSERT INTO public.star VALUES (6, 'Gliese 581', 20.55, 1, 3, NULL);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 32, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- PostgreSQL database dump complete
--

