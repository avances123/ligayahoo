--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: ligayahoo; Type: DATABASE; Schema: -; Owner: fabio
--

CREATE DATABASE ligayahoo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_ES.UTF-8' LC_CTYPE = 'es_ES.UTF-8';


ALTER DATABASE ligayahoo OWNER TO fabio;

\connect ligayahoo

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipos (
    dibujo character varying NOT NULL,
    precio real,
    id bigint NOT NULL,
    rendimiento real,
    jugador integer NOT NULL
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- Name: jugadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jugadores (
    id integer NOT NULL,
    nombre character varying,
    equipo character varying,
    posicion character varying,
    dorsal integer,
	
	jornada integer,

    pj integer,
    g integer,
    asi integer,
    gd integer,
    gbp integer,
    gp integer,
    tp integer,
    rs integer,
    ag integer,
    pi integer,
    pc integer,
    pf integer,
    pa integer,
    ata integer,
    tb integer,
    b integer,
    fc integer,
    fr integer,
    br integer,
    ta integer,
    tr integer,
    j integer
);


ALTER TABLE public.jugadores OWNER TO postgres;

--
-- Name: equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id, jugador, dibujo);


--
-- Name: jugadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT jugadores_pkey PRIMARY KEY (id);


--
-- Name: equipos_jugador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT equipos_jugador_fkey FOREIGN KEY (jugador) REFERENCES jugadores(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

