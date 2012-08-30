--
-- PostgreSQL database dump
--

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
    dibujo character varying,
    precio real,
    id integer NOT NULL,
    rendimiento real,
    jugador integer
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- Name: equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipos_id_seq OWNER TO postgres;

--
-- Name: equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE equipos_id_seq OWNED BY equipos.id;


--
-- Name: equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipos_id_seq', 174856, true);


--
-- Name: jugadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jugadores (
    id integer NOT NULL,
    name character varying,
    games_played integer,
    lastweek_points real,
    point_average_total real,
    point_average_last3 real,
    market_price real,
    total_points real,
    price_per_point real,
    "position" character varying,
    team character varying,
    valid boolean
);


ALTER TABLE public.jugadores OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipos ALTER COLUMN id SET DEFAULT nextval('equipos_id_seq'::regclass);


--
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipos (dibujo, precio, id, rendimiento, jugador) FROM stdin;
\.


--
-- Data for Name: jugadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jugadores (id, name, games_played, lastweek_points, point_average_total, point_average_last3, market_price, total_points, price_per_point, "position", team, valid) FROM stdin;
27462	Jesús Gámez	1	\N	3.5	7	13.2200003	7	0.529999971	Defensa	MGA	t
27701	Abel Aguilar	2	\N	11	11	8.19999981	22	2.68000007	Centrocampista	DEP	t
28160	Mario Suárez	1	\N	2.75	5.5	2.80999994	5.5	1.96000004	Centrocampista	AMR	t
28644	Gorka Elustondo	2	\N	3.25	3.25	5.01000023	6.5	1.29999995	Centrocampista	RSO	t
32281	Diego Godín	2	\N	7.75	7.75	8.23999977	15.5	1.88	Defensa	AMR	t
33668	Cristian Rodríguez	2	\N	4.25	4.25	5.53000021	8.5	1.53999996	Centrocampista	AMR	t
37169	Francisco Montañés	2	\N	3.5	3.5	5.46999979	7	1.27999997	Centrocampista	RZG	t
37265	Alexis Sánchez	1	\N	6	12	18.7800007	12	0.639999986	Delantero	BAR	t
37512	Seba Fernández	2	\N	5.75	5.75	11.0200005	11.5	1.03999996	Delantero	MGA	t
37605	Mesut Özil	2	\N	3.75	3.75	13.5699997	7.5	0.550000012	Centrocampista	MAD	t
37607	Patrick Ebert	2	\N	6	6	6.61999989	12	1.80999994	Centrocampista	VLD	t
38394	Beñat	2	\N	13.25	13.25	14.8100004	26.5	1.78999996	Centrocampista	BET	t
38401	Carlos Vela	2	\N	2.5	2.5	16.3199997	5	0.310000002	Delantero	RSO	t
38411	Nacho Monreal	2	\N	8.75	8.75	11.5799999	17.5	1.50999999	Defensa	MGA	t
38499	Tomer Hemed	2	\N	19.5	19.5	13.1499996	39	2.97000003	Delantero	MAL	t
38560	Javi Varas	2	\N	2.5	2.5	9.88000011	5	0.50999999	Portero	CEL	t
38747	Evaldo	2	\N	5.25	5.25	5.51999998	10.5	1.89999998	Defensa	DEP	t
39498	Adrián	2	\N	4.75	4.75	12.3599997	9.5	0.769999981	Delantero	AMR	t
39441	Arda Turan	2	\N	8.25	8.25	9.94999981	16.5	1.65999997	Centrocampista	AMR	t
39805	Nickie Bille	2	\N	2.5	2.5	9.14999962	5	0.550000012	Delantero	RAY	t
39991	Paulao	2	\N	4.25	4.25	4.11999989	8.5	2.05999994	Defensa	BET	t
40232	Gonzalo Higuaín	2	\N	15.25	15.25	22.5799999	30.5	1.35000002	Delantero	MAD	t
39992	Bruno Gama	2	\N	6.5	6.5	6.57999992	13	1.98000002	Centrocampista	DEP	t
40270	Iago Aspas	2	\N	10.25	10.25	8.14999962	20.5	2.51999998	Centrocampista	CEL	t
40389	Javi Guerra	2	\N	2.75	2.75	9.10999966	5.5	0.600000024	Delantero	VLD	t
40380	Nabil El Zhar	2	\N	5.25	5.25	6.88999987	10.5	1.51999998	Delantero	LEV	t
40405	Adrián	2	\N	2.75	2.75	9.15999985	5.5	0.600000024	Centrocampista	RAY	t
40694	Roberto	2	\N	3	3	9.71000004	6	0.620000005	Portero	RZG	t
40792	Federico Fazio	2	\N	6.75	6.75	7.11999989	13.5	1.89999998	Defensa	SEV	t
40835	Marc Valiente	2	\N	8.25	8.25	6.69000006	16.5	2.47000003	Defensa	VLD	t
42534	Antonio Rukavina	2	\N	8	8	6.82999992	16	2.33999991	Defensa	VLD	t
41215	Weligton	2	\N	4.25	4.25	6.92000008	8.5	1.23000002	Defensa	MGA	t
46525	Fábio Coentrão	1	\N	4.5	9	6.78000021	9	1.33000004	Defensa	MAD	f
42839	Pedro León	1	\N	3.5	7	5.42000008	7	1.28999996	Centrocampista	GET	t
42868	Javier Márquez	2	\N	6.25	6.25	4.67000008	12.5	2.68000007	Centrocampista	MAL	t
42892	Álvaro Negredo	2	\N	10.5	10.5	19.3500004	21	1.09000003	Delantero	SEV	t
42995	Mikel San José	2	\N	9.25	9.25	6.55999994	18.5	2.81999993	Defensa	BIL	t
44336	Sofiane Feghouli	2	\N	6	6	9.82999992	12	1.22000003	Centrocampista	VAL	t
44677	Aythami	2	\N	6	6	6.23000002	12	1.92999995	Defensa	DEP	t
45825	Gonzalo Castro	2	\N	7.75	7.75	17.2199993	15.5	0.899999976	Centrocampista	RSO	t
46497	Ángel Di María	2	\N	2.75	2.75	17.6900005	5.5	0.310000002	Centrocampista	MAD	t
46898	Diego Alves	2	\N	8	8	8.42000008	16	1.89999998	Portero	VAL	t
48771	Emilio Nsue	2	\N	5.5	5.5	10.2600002	11	1.07000005	Delantero	MAL	t
48847	Falcao	2	\N	21.75	21.75	26.4400005	43.5	1.64999998	Delantero	AMR	t
48854	Fabián Orellana	2	\N	12	12	11.6000004	24	2.06999993	Delantero	GRN	t
49097	José Casado	2	\N	2.5	2.5	6.26999998	5	0.800000012	Defensa	RAY	t
49735	Ignacio Camacho	2	\N	4.5	4.5	3.25999999	9	2.75999999	Centrocampista	MGA	t
49952	Babá	1	\N	2.25	4.5	8	4.5	0.560000002	Delantero	SEV	t
51580	Gaizka Toquero	1	\N	2.25	4.5	10.0100002	4.5	0.449999988	Delantero	BIL	t
51527	Tino Costa	2	\N	5	5	9.97000027	10	1	Centrocampista	VAL	t
51732	José Callejón	2	\N	5	5	9.52000046	10	1.04999995	Delantero	MAD	t
51968	Isma López	2	\N	2.25	2.25	8.94999981	4.5	0.5	Delantero	BIL	t
52356	Jordi Alba	2	\N	3.25	3.25	7.5999999	6.5	0.860000014	Defensa	BAR	t
53048	Jonas	2	\N	9.75	9.75	15.04	19.5	1.29999995	Delantero	VAL	t
54176	Carlos Peña	1	\N	1.5	3	5.03999996	3	0.600000024	Defensa	VLD	t
54805	Diego Buonanotte	2	\N	3	3	3.31999993	6	1.80999994	Centrocampista	MGA	t
55136	Juan Ángel Neira	1	\N	1.25	2.5	8.81999969	2.5	0.280000001	Delantero	VLD	t
10343	José Antonio Reyes	2	\N	2.5	2.5	14.25	5	0.349999994	Centrocampista	SEV	f
56464	Ivan Obradovic	1	\N	2.5	5	7.96999979	5	0.629999995	Defensa	RZG	f
55171	Jaime	2	\N	12.25	12.25	10.5500002	24.5	2.31999993	Portero	VLD	t
55179	Wakaso	2	\N	7	7	1.98000002	14	7.07000017	Centrocampista	ESP	t
56225	Silvio	1	\N	1.75	3.5	4.55000019	3.5	0.769999981	Defensa	AMR	t
56249	Ander Iturraspe	2	\N	2.25	2.25	1.36000001	4.5	3.30999994	Centrocampista	BIL	t
56270	Jesús Rueda	2	\N	3.5	3.5	5.71000004	7	1.23000002	Centrocampista	VLD	t
56424	Miku	2	\N	3.75	3.75	10.8199997	7.5	0.689999998	Delantero	GET	t
56680	Mikel Balenziaga	2	\N	7.5	7.5	6.48000002	15	2.30999994	Defensa	VLD	t
57114	Nélson Oliveira	2	\N	7	7	9.67000008	14	1.45000005	Delantero	DEP	t
58926	Youssef El-Arabi	2	\N	2.5	2.5	8.96000004	5	0.560000002	Delantero	GRN	t
59062	Óscar De Marcos	2	\N	10	10	8.71000004	20	2.29999995	Delantero	BIL	t
60315	Abdel Barrada	2	\N	10.5	10.5	12.8900003	21	1.63	Centrocampista	GET	t
60772	Thibaut Courtois	2	\N	4	4	10.8800001	8	0.74000001	Portero	AMR	t
61517	Cicinho	2	\N	3	3	5.13999987	6	1.16999996	Defensa	SEV	t
67527	Nyom	2	\N	6.75	6.75	7.26999998	13.5	1.86000001	Defensa	GRN	t
71679	Rubén Martínez	2	\N	10	10	1	20	20	Portero	RAY	t
49579	Pedro	2	\N	8.5	8.5	13.8100004	17	1.23000002	Delantero	BAR	t
71700	Álvaro Cejudo	2	\N	4	4	16	8	0.5	Centrocampista	OSA	t
73684	Tito	2	\N	2.75	2.75	7.67999983	5.5	0.720000029	Defensa	RAY	t
10316	Joaquín	2	\N	6.25	6.25	12.7799997	12.5	0.980000019	Centrocampista	MGA	t
10929	Helder Postiga	2	\N	15	15	16.3999996	30	1.83000004	Delantero	RZG	t
10991	Roberto Trashorras	2	\N	9.25	9.25	11.6899996	18.5	1.58000004	Centrocampista	RAY	t
11511	Duda	1	\N	3.75	7.5	9.89999962	7.5	0.75999999	Centrocampista	MGA	t
11656	Óscar	2	\N	5.25	5.25	5.5	10.5	1.90999997	Centrocampista	VLD	t
12237	Andrés Iniesta	2	\N	8.25	8.25	13.5299997	16.5	1.22000003	Centrocampista	BAR	t
12488	Jérémy Toulalan	1	\N	1.5	3	7.67000008	3	0.389999986	Centrocampista	MGA	t
12496	Víctor Valdés	2	\N	6	6	17.1000004	12	0.699999988	Portero	BAR	t
14729	Alexis	2	\N	4	4	5.17999983	8	1.53999996	Defensa	GET	t
14726	Nacho	2	\N	2.25	2.25	8.30000019	4.5	0.540000021	Defensa	BET	t
15312	Martín Demichelis	2	\N	4	4	8.03999996	8	1	Defensa	MGA	t
15269	Tiago	2	\N	6	6	4.42000008	12	2.71000004	Centrocampista	AMR	t
14937	Cristiano Ronaldo	2	\N	6.25	6.25	44.6100006	12.5	0.280000001	Delantero	MAD	t
15780	Dani Alves	2	\N	3.75	3.75	14.5500002	7.5	0.519999981	Defensa	BAR	t
17279	David Villa	2	\N	3.75	3.75	14.4799995	7.5	0.519999981	Delantero	BAR	t
17517	Riki	2	\N	8	8	10.6499996	16	1.5	Delantero	DEP	t
17622	Dudu Aouate	2	\N	7	7	12.3100004	14	1.13999999	Portero	MAL	t
16872	Miguel Ángel Moyá	2	\N	3.5	3.5	11.5100002	7	0.610000014	Portero	GET	t
17740	Jesús Navas	2	\N	4.5	4.5	21	9	0.430000007	Centrocampista	SEV	t
17216	Andoni Iraola	2	\N	4.25	4.25	10.5500002	8.5	0.810000002	Defensa	BIL	t
17804	Juanfran	1	\N	3.75	7.5	8.71000004	7.5	0.860000014	Defensa	AMR	t
18507	Diego Costa	1	\N	2	4	14.7399998	4	0.270000011	Delantero	AMR	t
18681	Roland Lamah	2	\N	6	6	9.09000015	12	1.32000005	Centrocampista	OSA	t
18595	Filipe Luis	1	\N	6.25	12.5	15.9099998	12.5	0.790000021	Defensa	AMR	t
18759	Álvaro Arbeloa	2	\N	2.75	2.75	7.86000013	5.5	0.699999988	Defensa	MAD	t
19054	Lionel Messi	2	\N	32.25	32.25	53.0800018	64.5	1.22000003	Delantero	BAR	t
19075	Joan Verdú	2	\N	4	4	12.1599998	8	0.660000026	Centrocampista	ESP	t
19525	Jonathan Pereira	2	\N	3.5	3.5	9.43999958	7	0.74000001	Delantero	BET	t
20680	Rubén Castro	1	\N	3.5	7	19.2299995	7	0.360000014	Delantero	BET	f
19927	Karim Benzema	2	\N	2.5	2.5	22.3999996	5	0.219999999	Delantero	MAD	t
20056	Piti	2	\N	6	6	12.8000002	12	0.939999998	Delantero	RAY	t
20151	Imanol Agirretxe	1	\N	13.25	26.5	17.8999996	26.5	1.48000002	Delantero	RSO	t
20310	Willy Caballero	2	\N	10	10	13.0299997	20	1.52999997	Portero	MGA	t
17871	Gabi	2	\N	4.25	4.25	10.0500002	8.5	0.850000024	Centrocampista	AMR	t
17926	Roberto Soldado	2	\N	10.75	10.75	20.0699997	21.5	1.07000005	Delantero	VAL	t
76555	Jorge Molina	2	\N	14.75	14.75	12.2399998	29.5	2.41000009	Delantero	BET	t
76557	Víctor Pérez	2	\N	7	7	7.26999998	14	1.92999995	Centrocampista	VLD	t
76558	Mikel Rico	2	\N	7.25	7.25	10.6499996	14.5	1.36000001	Centrocampista	GRN	t
76640	Omar Ramos	2	\N	3.5	3.5	5.36999989	7	1.29999995	Centrocampista	VLD	t
76650	Antoine Griezmann	2	\N	3.5	3.5	15.9499998	7	0.439999998	Delantero	RSO	t
77390	Koke	1	\N	3.5	7	7.55999994	7	0.930000007	Centrocampista	AMR	t
78874	Iñigo Pérez	2	\N	2.5	2.5	3.82999992	5	1.30999994	Centrocampista	BIL	t
80287	Juanmi	1	\N	6	12	7.53999996	12	1.59000003	Delantero	MGA	t
80209	Isco	2	\N	5.75	5.75	12.1700001	11.5	0.939999998	Delantero	MGA	t
80590	Pizzi	2	\N	8.5	8.5	7.9000001	17	2.1500001	Delantero	DEP	t
80795	Portillo	2	\N	6.5	6.5	8.81000042	13	1.48000002	Delantero	MGA	t
82964	Michael Pereira	2	\N	5.5	5.5	10.6999998	11	1.02999997	Delantero	MAL	t
84086	Asier Illarramendi	2	\N	2.5	2.5	4.69000006	5	1.07000005	Centrocampista	RSO	t
84471	Ibai Gómez	2	\N	7	7	8.63000011	14	1.62	Delantero	BIL	t
86172	Edu Oriol	2	\N	3.25	3.25	6.80999994	6.5	0.949999988	Delantero	RZG	t
86989	Cañas	2	\N	2.5	2.5	4.32000017	5	1.15999997	Centrocampista	BET	t
88210	Abraham	2	\N	3.5	3.5	7.67999983	7	0.910000026	Defensa	RZG	t
88480	Juan Carlos	2	\N	4.75	4.75	6.42999983	9.5	1.48000002	Centrocampista	BET	t
89046	Álvaro	2	\N	9.75	9.75	9.89999962	19.5	1.97000003	Delantero	ESP	t
89238	Álex Pozuelo	2	\N	6	6	7.78000021	12	1.53999996	Delantero	BET	t
90728	Ximo Navarro	2	\N	4.5	4.5	5.32000017	9	1.69000006	Defensa	MAL	t
95786	Lass	2	\N	6.25	6.25	8.47000027	12.5	1.48000002	Delantero	RAY	t
99127	Joel Campbell	1	\N	1.75	3.5	9.09000015	3.5	0.389999986	Delantero	BET	t
26768	Víctor	2	\N	1.25	1.25	9.57999992	2.5	0.25999999	Delantero	MAL	f
26921	Arouna Koné	0	\N	-0	0	16.0200005	0	0	Delantero	LEV	f
26726	Ángel Lafita	2	\N	0.75	0.75	11.0699997	1.5	0.140000001	Centrocampista	GET	f
26906	Nelson	0	\N	-0	0	7.28999996	0	0	Defensa	BET	f
26904	João Pereira	2	\N	-1	-1	4.0999999	-2	-0.49000001	Defensa	VAL	f
27672	Pape Diop	2	\N	-2.75	-2.75	3.0999999	-5.5	-1.76999998	Centrocampista	LEV	f
27692	Guillherme Siqueira	2	\N	-2.75	-2.75	8.18999958	-5.5	-0.670000017	Defensa	GRN	f
28112	Romaric	1	\N	0.75	1.5	7.78999996	1.5	0.189999998	Centrocampista	RZG	f
28289	Manu del Moral	1	\N	-2	-4	12.6999998	-4	-0.310000002	Delantero	SEV	f
28291	Diego Castro	2	\N	0.5	0.5	9.60000038	1	0.100000001	Centrocampista	GET	f
28455	Lolo	1	\N	-1.5	-3	2.50999999	-3	-1.20000005	Defensa	OSA	f
28411	Keylor Navas	0	\N	-0	0	7.55000019	0	0	Portero	LEV	f
28456	Ion Ansotegi	2	\N	-3	-3	4.11000013	-6	-1.46000004	Defensa	RSO	f
28590	Nunes	2	\N	-0.25	-0.25	5.34000015	-0.5	-0.0900000036	Defensa	MAL	f
28606	Ustaritz	0	\N	-0	0	3.25	0	0	Defensa	BIL	f
28690	Pablo Hernández	0	\N	-0	0	10.4300003	0	0	Centrocampista	VAL	f
32260	Jeffrey Sarpong	0	\N	-0	0	2.17000008	0	0	Centrocampista	RSO	f
32488	Pape Malickou Diakhaté	0	\N	-0	0	3.8900001	0	0	Defensa	GRN	f
32610	Cata Díaz	1	\N	-1.25	-2.5	4.92000008	-2.5	-0.50999999	Defensa	AMR	f
32644	Javier Mascherano	1	\N	-1	-2	2.18000007	-2	-0.920000017	Centrocampista	BAR	f
33148	Claudio Bravo	2	\N	0	0	11.5100002	0	0	Portero	RSO	f
33588	Kalu Uche	0	\N	-0	0	12.1300001	0	0	Delantero	ESP	f
34703	Ivan Rakitic	2	\N	1.5	1.5	8.19999981	3	0.370000005	Centrocampista	SEV	f
36803	Javad Nekounam	0	\N	-0	0	6.26000023	0	0	Centrocampista	OSA	f
36996	Alejandro Alfaro	1	\N	0	0	5.75	0	0	Centrocampista	MAL	f
37014	Saúl	0	\N	-0	0	5.32000017	0	0	Centrocampista	DEP	f
37064	Andrés Guardado	2	\N	0.5	0.5	5.67999983	1	0.180000007	Centrocampista	VAL	f
37196	Oscar Ustari	0	\N	-0	0	7.3499999	0	0	Portero	GET	f
37198	Masoud Shojaei	0	\N	-0	0	6.55999994	0	0	Centrocampista	OSA	f
37573	Zé Castro	0	\N	-0	0	3.44000006	0	0	Defensa	DEP	f
37752	Hassan Yebda	0	\N	-0	0	2.18000007	0	0	Centrocampista	GRN	f
37793	Javi Martínez	0	\N	-0	0	6.67000008	0	0	Defensa	BIL	f
38093	Juan Albín	2	\N	-4.5	-4.5	1.21000004	-9	-7.44000006	Delantero	ESP	f
38173	Jesús Vázquez	0	\N	-0	0	5.01000023	0	0	Centrocampista	DEP	f
38101	Nino	2	\N	0	0	10.8500004	0	0	Delantero	OSA	f
38400	Sergio Álvarez	0	\N	-0	0	7.55000019	0	0	Portero	CEL	f
38519	Fran Mérida	0	\N	-0	0	2.02999997	0	0	Centrocampista	AMR	f
38569	Natxo Insa	1	\N	0.75	1.5	4.88999987	1.5	0.310000002	Centrocampista	CEL	f
39313	Eliseu	2	\N	-3.25	-3.25	7.17999983	-6.5	-0.910000026	Centrocampista	MGA	f
39377	Jonathan Vila	0	\N	-0	0	5.01000023	0	0	Centrocampista	CEL	f
39563	Marcelo	1	\N	0.5	1	14.2700005	1	0.0700000003	Defensa	MAD	f
39816	Sami Khedira	0	\N	-0	0	4.15999985	0	0	Centrocampista	MAD	f
39790	Kiko Casilla	0	\N	-0	0	8.72999954	0	0	Portero	ESP	f
40269	Dani Abalo	0	\N	-0	0	5.01000023	0	0	Centrocampista	CEL	f
40272	Roberto Lago	2	\N	1.75	1.75	4.59000015	3.5	0.75999999	Defensa	CEL	f
40390	Casto	0	\N	-0	0	8.13000011	0	0	Portero	BET	f
40789	Daniel Estrada	2	\N	1.25	1.25	6.69000006	2.5	0.370000005	Centrocampista	RSO	f
40406	Miguel Torres	2	\N	0	0	3.54999995	0	0	Defensa	GET	f
40559	Fabricio	2	\N	0.75	0.75	7.26000023	1.5	0.209999993	Portero	BET	f
40836	Vicente Guaita	0	\N	-0	0	13.9300003	0	0	Portero	VAL	f
40837	Lluis Sastre	1	\N	-1.5	-3	4.11999989	-3	-0.730000019	Centrocampista	VLD	f
41795	Adil Rami	1	\N	0	0	6.86999989	0	0	Defensa	VAL	f
42430	Carlos Martínez	0	\N	-0	0	10.21	0	0	Defensa	RSO	f
42676	Kike Sola	1	\N	0	0	3.75999999	0	0	Delantero	OSA	f
42844	Pedro López	2	\N	-0.25	-0.25	3.20000005	-0.5	-0.159999996	Defensa	LEV	f
42871	Juan Domínguez	2	\N	0	0	4.07999992	0	0	Centrocampista	DEP	f
42849	Sisi	2	\N	1.75	1.75	5.05000019	3.5	0.689999998	Centrocampista	OSA	f
43693	Martín Cáceres	0	\N	-0	0	9.30000019	0	0	Defensa	SEV	f
44849	Sergio Sánchez	1	\N	1	2	4.88999987	2	0.409999996	Defensa	MGA	f
46009	Alberto Bueno	0	\N	-0	0	9.40999985	0	0	Delantero	VLD	f
46998	Esteban Granero	0	\N	-0	0	2.42000008	0	0	Centrocampista	MAD	f
47313	Brayan Angulo	0	\N	-0	0	4.51000023	0	0	Defensa	GRN	f
47094	Adam Pintér	1	\N	-2.25	-4.5	1	-4.5	-4.5	Defensa	RZG	f
47645	Juanfran	0	\N	-0	0	5.01000023	0	0	Centrocampista	MAD	f
47665	Markel Susaeta	2	\N	2	2	13.6700001	4	0.289999992	Centrocampista	BIL	f
48439	Nikos Karabelas	1	\N	1	2	4.61000013	2	0.430000007	Defensa	LEV	f
48772	Sergio Asenjo	0	\N	-0	0	5.69999981	0	0	Portero	AMR	f
48853	Gary Medel	2	\N	-0.5	-0.5	1	-1	-1	Centrocampista	SEV	f
49214	Raúl Fernández	0	\N	-0	0	7.55000019	0	0	Portero	BIL	f
49266	Alberto Botía	1	\N	-1.75	-3.5	1.50999999	-3.5	-2.31999993	Defensa	SEV	f
49410	Manucho	0	\N	-0	0	9.40999985	0	0	Delantero	VLD	f
49370	Víctor Laguardia	0	\N	-0	0	4.51000023	0	0	Defensa	RZG	f
49267	Víctor Sánchez	2	\N	-1.75	-1.75	1.34000003	-3.5	-2.6099999	Centrocampista	ESP	f
49309	Éver Banega	0	\N	-0	0	5.73000002	0	0	Centrocampista	VAL	f
49876	Vadim Demidov	0	\N	-0	0	4.94999981	0	0	Defensa	RSO	f
49656	Héctor Moreno	2	\N	0	0	7.82000017	0	0	Defensa	ESP	f
51271	Pablo Piatti	1	\N	-1.75	-3.5	7.05999994	-3.5	-0.5	Delantero	VAL	f
50279	Héctor Rodas	1	\N	0.5	1	3.26999998	1	0.310000002	Defensa	LEV	f
51273	Lautaro Acosta	0	\N	-0	0	5.5999999	0	0	Centrocampista	SEV	f
51728	Cristian Álvarez	2	\N	1	1	5.53999996	2	0.360000014	Portero	ESP	f
51792	Andrés	2	\N	-0.75	-0.75	9.31999969	-1.5	-0.159999996	Portero	OSA	f
51860	Míchel	2	\N	-1.5	-1.5	1.98000002	-3	-1.51999998	Centrocampista	GET	f
51948	Víctor Ruiz	2	\N	-2.5	-2.5	4.63999987	-5	-1.08000004	Defensa	VAL	f
51897	Apoño	2	\N	2	2	11.5500002	4	0.349999994	Centrocampista	RZG	f
51803	Roberto	0	\N	-0	0	11.3100004	0	0	Portero	GRN	f
51911	Sergio Ortega	0	\N	-0	0	4.51000023	0	0	Defensa	CEL	f
51952	Daniel Parejo	2	\N	0.25	0.25	5.21999979	0.5	0.100000001	Centrocampista	VAL	f
52026	David Abraham	2	\N	1	1	4.48000002	2	0.449999988	Defensa	GET	f
52296	Sandro Silva	0	\N	-0	0	3.82999992	0	0	Centrocampista	MGA	f
52355	Adrián Colunga	2	\N	1.75	1.75	11.8999996	3.5	0.289999992	Delantero	GET	f
52496	Miranda	2	\N	1.75	1.75	5.82000017	3.5	0.600000024	Defensa	AMR	f
52461	Felipe Mattioni	0	\N	-0	0	4.51000023	0	0	Defensa	ESP	f
52698	Ruben Micael	0	\N	-0	0	3.3599999	0	0	Centrocampista	AMR	f
54104	Sergio Busquets	2	\N	-0.25	-0.25	3.69000006	-0.5	-0.140000001	Centrocampista	BAR	f
53843	Diego Colotto	0	\N	-0	0	5.59000015	0	0	Defensa	ESP	f
54175	Diego Mainz	0	\N	-0	0	5.48999977	0	0	Defensa	GRN	f
54194	Pedro Ríos	0	\N	-0	0	7.80000019	0	0	Centrocampista	LEV	f
54164	Igor Martínez	0	\N	-0	0	4.78000021	0	0	Centrocampista	BIL	f
54248	Jaime Romero	2	\N	1.5	1.5	3.16000009	3	0.949999988	Centrocampista	GRN	f
54322	Michu	0	\N	-0	0	12.5299997	0	0	Centrocampista	RAY	f
54323	David Rodríguez	0	\N	-0	0	9.40999985	0	0	Delantero	CEL	f
54371	David Zurutuza	0	\N	-0	0	10.6999998	0	0	Centrocampista	RSO	f
54513	Vicente Iborra	2	\N	-1.5	-1.5	1.34000003	-3	-2.24000001	Centrocampista	LEV	f
54792	Juan Forlín	2	\N	0.25	0.25	2.1099999	0.5	0.239999995	Defensa	ESP	f
54806	Augusto Fernández	2	\N	-0.25	-0.25	4.32999992	-0.5	-0.119999997	Centrocampista	CEL	f
54766	Jean-Alain Fanchone	0	\N	-0	0	4.51000023	0	0	Defensa	GRN	f
55117	Gustavo Cabral	2	\N	0.5	0.5	5.61000013	1	0.180000007	Defensa	CEL	f
55166	Samuel	0	\N	-0	0	4.51000023	0	0	Defensa	CEL	f
55170	Dani Benítez	0	\N	-0	0	10.2600002	0	0	Centrocampista	GRN	f
55175	Álvaro	0	\N	-0	0	6.09000015	0	0	Delantero	MAL	f
55185	Chechu Dorado	2	\N	0.25	0.25	5.71000004	0.5	0.0900000036	Defensa	BET	f
55262	Xabier Castillo	0	\N	-0	0	3.86999989	0	0	Defensa	BIL	f
55268	Coke	0	\N	-0	0	6.21999979	0	0	Defensa	SEV	f
55302	Hugo Fraile	0	\N	-0	0	9.40999985	0	0	Delantero	GET	f
55329	Emiliano Armenteros	0	\N	-0	0	8.06000042	0	0	Centrocampista	OSA	f
55336	Alberto De la Bella	2	\N	1	1	9.05000019	2	0.219999999	Defensa	RSO	f
55354	Salva Sevilla	0	\N	-0	0	5.28999996	0	0	Centrocampista	BET	f
55356	Cristian Bustos	1	\N	-0.25	-0.5	4.55999994	-0.5	-0.109999999	Centrocampista	CEL	f
55317	Bernardo	0	\N	-0	0	6.01999998	0	0	Defensa	SEV	f
55340	Diego Perotti	0	\N	-0	0	10.21	0	0	Centrocampista	SEV	f
55361	Jorge Alonso	0	\N	-0	0	5.01000023	0	0	Centrocampista	VLD	f
56271	Quique	0	\N	-0	0	9.40999985	0	0	Delantero	VLD	f
55412	Cala	1	\N	0	0	2.78999996	0	0	Defensa	SEV	f
56419	Ángel	2	\N	0	0	8.14000034	0	0	Delantero	LEV	f
56492	Salvio	0	\N	-0	0	9.21000004	0	0	Delantero	AMR	f
56828	Gabriel Torje	2	\N	0.25	0.25	8.28999996	0.5	0.0599999987	Delantero	GRN	f
56448	Sergio Canales	0	\N	-0	0	5.69999981	0	0	Centrocampista	VAL	f
57134	Salomón Rondón	0	\N	-0	0	17.0900002	0	0	Delantero	MGA	f
56916	Oier	0	\N	-0	0	3.31999993	0	0	Defensa	OSA	f
58876	Míchel	2	\N	-0.5	-0.5	4.21999979	-1	-0.239999995	Centrocampista	LEV	f
58476	Rui Fonte	2	\N	-0.5	-0.5	2.31999993	-1	-0.430000007	Delantero	ESP	f
58906	Xavi Torres	2	\N	0.75	0.75	6.21000004	1.5	0.239999995	Centrocampista	GET	f
59041	Raúl Goni	1	\N	-1.75	-3.5	3.25999999	-3.5	-1.07000005	Defensa	RZG	f
59140	José Ángel	1	\N	0.25	0.5	5.69000006	0.5	0.0900000036	Defensa	RSO	f
59339	Alberto Perea	0	\N	-0	0	5.01000023	0	0	Centrocampista	RAY	f
59840	Joan Tomás	2	\N	0.25	0.25	4.57999992	0.5	0.109999999	Centrocampista	CEL	f
59846	Ander	2	\N	1.25	1.25	6.48000002	2.5	0.389999986	Centrocampista	BIL	f
59945	Rubén Pérez	1	\N	0.5	1	3.29999995	1	0.300000012	Defensa	BET	f
60012	Pedro Mosquera	0	\N	-0	0	4.05000019	0	0	Centrocampista	MAD	f
59946	Rubén Miño	0	\N	-0	0	7.55000019	0	0	Portero	MAL	f
59981	Antonio Adán	0	\N	-0	0	8.14999962	0	0	Portero	MAD	f
60104	José Carlos	2	\N	1	1	4.28000021	2	0.469999999	Centrocampista	RAY	f
60323	Diego Seoane	0	\N	-0	0	4.82999992	0	0	Defensa	DEP	f
60630	David Rochela	0	\N	-0	0	4.51000023	0	0	Defensa	DEP	f
60706	Adrián	0	\N	-0	0	7.55000019	0	0	Portero	BET	f
60629	Javier Matilla	0	\N	-0	0	1.28999996	0	0	Centrocampista	BET	f
61559	Andreu Fontás	0	\N	-0	0	4.5	0	0	Defensa	BAR	f
60835	Rúper	0	\N	-0	0	3.97000003	0	0	Centrocampista	OSA	f
61558	Thiago Alcántara	0	\N	-0	0	6.38999987	0	0	Centrocampista	BAR	f
61595	Marc Muniesa	0	\N	-0	0	4.51000023	0	0	Defensa	BAR	f
61598	Javi Ros	1	\N	0	0	4.6500001	0	0	Centrocampista	RSO	f
69855	Aitor Núñez	0	\N	-0	0	4.51000023	0	0	Defensa	RAY	f
69857	Ernesto Galán	0	\N	-0	0	5.71000004	0	0	Defensa	ESP	f
67184	Roderick	0	\N	-0	0	4.51000023	0	0	Defensa	DEP	f
67570	André Santos	0	\N	-0	0	5.01000023	0	0	Centrocampista	DEP	f
70428	Sergio Tejera	2	\N	1.25	1.25	4	2.5	0.629999995	Centrocampista	ESP	f
69877	Álex Cruz	0	\N	-0	0	5.01000023	0	0	Centrocampista	GRN	f
49580	Laure	0	\N	-0	0	4.42999983	0	0	Defensa	DEP	f
61789	Jesús	0	\N	-0	0	7.55000019	0	0	Portero	MAD	f
10315	Toni Doblas	0	\N	-0	0	7.61999989	0	0	Portero	RZG	f
10644	Martí	1	\N	-1.5	-3	3.6500001	-3	-0.819999993	Centrocampista	MAL	f
10647	Ayoze	0	\N	-0	0	4.57999992	0	0	Defensa	DEP	f
10390	Carlos Marchena	2	\N	-1.75	-1.75	1	-3.5	-3.5	Centrocampista	DEP	f
10979	Francisco Puñal	2	\N	-1.75	-1.75	3.78999996	-3.5	-0.920000017	Centrocampista	OSA	f
11131	Javier Baraja	0	\N	-0	0	5.01000023	0	0	Centrocampista	VLD	f
11514	David Cobeño	0	\N	-0	0	6.30999994	0	0	Portero	RAY	f
11525	Mario	0	\N	-0	0	1	0	0	Defensa	BET	f
11601	David Navarro	2	\N	-5.25	-5.25	1	-10.5	-10.5	Defensa	LEV	f
11602	Borja	0	\N	-0	0	3.83999991	0	0	Centrocampista	GET	f
11712	Rubén	0	\N	-0	0	3.32999992	0	0	Defensa	OSA	f
11875	Marc Bertrán	2	\N	2	2	7.26999998	4	0.550000012	Defensa	OSA	f
11842	Aranda	2	\N	0	0	5.69999981	0	0	Delantero	RZG	f
10917	Ricardo Carvalho	0	\N	-0	0	2.1099999	0	0	Defensa	MAD	f
12006	Glenn Loovens	0	\N	-0	0	4.51000023	0	0	Defensa	RZG	f
13241	Gustavo Munúa	2	\N	2	2	12.2299995	4	0.330000013	Portero	LEV	f
12512	Borja Oubiña	2	\N	-1.25	-1.25	4.32000017	-2.5	-0.579999983	Centrocampista	CEL	f
12787	Carlos Gurpegi	2	\N	-2.75	-2.75	1	-5.5	-5.5	Centrocampista	BIL	f
13135	Kaká	0	\N	-0	0	12.0500002	0	0	Centrocampista	MAD	f
13268	Carlos Kameni	0	\N	-0	0	4.55000019	0	0	Portero	MGA	f
13927	Noé Pamarot	0	\N	-0	0	4.71999979	0	0	Defensa	GRN	f
14393	Javier Camuñas	2	\N	1.5	1.5	6.42000008	3	0.469999999	Centrocampista	DEP	f
14454	Antonio López	2	\N	0.5	0.5	4.3499999	1	0.230000004	Defensa	MAL	f
14412	Mario Bermejo	1	\N	0	0	8.56000042	0	0	Delantero	CEL	f
14372	Rodolfo Bodipo	0	\N	-0	0	9.40999985	0	0	Delantero	DEP	f
14095	Jeremy Mathieu	2	\N	-0.75	-0.75	9.02999973	-1.5	-0.170000002	Defensa	VAL	f
14480	David Cortés	0	\N	-0	0	4.82999992	0	0	Defensa	GRN	f
14464	Aritz Aduriz	2	\N	0.5	0.5	8.89000034	1	0.109999999	Delantero	BIL	f
14549	Juan Rodríguez	0	\N	-0	0	2.42000008	0	0	Centrocampista	GET	f
14725	Gorka Iraizoz	2	\N	-1.5	-1.5	12.1999998	-3	-0.25	Portero	BIL	f
15288	Juanlu	2	\N	0.75	0.75	9.82999992	1.5	0.150000006	Centrocampista	LEV	f
15843	Juanma Ortiz	1	\N	0.5	1	4.19000006	1	0.239999995	Defensa	GRN	f
16021	Diego López	2	\N	-2.75	-2.75	7.92999983	-5.5	-0.689999998	Portero	SEV	f
16049	Piotr Trochowski	2	\N	2	2	5.19999981	4	0.769999981	Centrocampista	SEV	f
16149	Antonio Amaya	1	\N	0.5	1	3.1500001	1	0.319999993	Defensa	BET	f
15868	Nelson Valdez	1	\N	-0.25	-0.5	9.61999989	-0.5	-0.0500000007	Delantero	VAL	f
16053	Iriney	2	\N	-1	-1	1.10000002	-2	-1.82000005	Centrocampista	GRN	f
16738	Ricardo Costa	2	\N	-5.5	-5.5	1	-11	-11	Defensa	VAL	f
17238	Moisés Hurtado	0	\N	-0	0	1.75	0	0	Centrocampista	GRN	f
17368	Juan Calatayud	0	\N	-0	0	5.30999994	0	0	Portero	MAL	f
17268	Julio Baptista	0	\N	-0	0	9.31000042	0	0	Delantero	MGA	f
17512	Xabi Prieto	2	\N	2	2	11.8599997	4	0.340000004	Centrocampista	RSO	f
17378	Juan Valera	2	\N	1.75	1.75	9.60999966	3.5	0.360000014	Defensa	GET	f
17679	Sergio García	0	\N	-0	0	13.3999996	0	0	Delantero	ESP	f
17787	Javier Paredes	2	\N	0.25	0.25	4.55999994	0.5	0.109999999	Defensa	RZG	f
17131	Christian Lell	1	\N	0.5	1	4.48999977	1	0.219999999	Defensa	LEV	f
17224	Juanma	0	\N	-0	0	4.84000015	0	0	Centrocampista	BET	f
17791	Iban Zubiaurre	0	\N	-0	0	4.51000023	0	0	Defensa	BIL	f
17827	Rafa	0	\N	-0	0	2.44000006	0	0	Defensa	GET	f
18003	Raúl Albiol	2	\N	1	1	2.77999997	2	0.720000029	Defensa	MAD	f
18221	Gerard Piqué	2	\N	-1	-1	4.63999987	-2	-0.430000007	Defensa	BAR	f
18280	Paulo Assunção	0	\N	-0	0	1	0	0	Centrocampista	AMR	f
18278	Hedwiges Maduro	0	\N	-0	0	2.38000011	0	0	Defensa	SEV	f
18473	Mikel Labaka	1	\N	0	0	5.0999999	0	0	Defensa	RAY	f
18490	Óscar Serrano	0	\N	-0	0	2.97000003	0	0	Centrocampista	LEV	f
18492	Miguel Flaño	2	\N	-4.75	-4.75	3.53999996	-9.5	-2.68000007	Defensa	OSA	f
18495	David López	0	\N	-0	0	7.53000021	0	0	Centrocampista	BIL	f
17568	Andrija Delibasic	2	\N	0.5	0.5	4.0999999	1	0.239999995	Delantero	RAY	f
18498	Raúl García	1	\N	0	0	12.8599997	0	0	Centrocampista	AMR	f
18522	Pepe	1	\N	0.75	1.5	6.67999983	1.5	0.219999999	Defensa	MAD	f
19074	Damiá	2	\N	-2	-2	4.09000015	-4	-0.980000019	Defensa	OSA	f
19524	Santiago Cazorla	0	\N	-0	0	19.1700001	0	0	Centrocampista	MGA	f
19526	Marquitos	0	\N	-0	0	5.01000023	0	0	Centrocampista	VLD	f
19568	Ibrahim Afellay	0	\N	-0	0	1.98000002	0	0	Centrocampista	BAR	f
19773	Adriano	0	\N	-0	0	10.1199999	0	0	Defensa	BAR	f
19805	Toño	2	\N	0.75	0.75	10.2200003	1.5	0.150000006	Portero	GRN	f
19755	Mané	0	\N	-0	0	7.46999979	0	0	Defensa	GET	f
19760	Fernando Llorente	0	\N	-0	0	17.3799992	0	0	Delantero	BIL	f
19831	Mikel González	2	\N	1	1	6.05000019	2	0.330000013	Defensa	RSO	f
19975	Fernando Gago	2	\N	2	2	4.09000015	4	0.980000019	Centrocampista	VAL	f
20062	Álex Bergantiños	1	\N	0.25	0.5	4.73999977	0.5	0.109999999	Centrocampista	DEP	f
20112	Eñaut Zubikarai	0	\N	-0	0	7.55000019	0	0	Portero	RSO	f
20057	Miguel Pallardó	1	\N	0	0	1	0	0	Centrocampista	LEV	f
20150	Markel Bergara	2	\N	-2.25	-2.25	1	-4.5	-4.5	Centrocampista	RSO	f
20301	Emir Spahic	2	\N	-0.75	-0.75	5.6500001	-1.5	-0.270000011	Defensa	SEV	f
20311	Germán Lux	1	\N	0.5	1	6.57000017	1	0.150000006	Portero	DEP	f
20319	Gekas	1	\N	-0.25	-0.5	8.47000027	-0.5	-0.0599999987	Delantero	LEV	f
20368	Nuri Sahin	0	\N	-0	0	2.07999992	0	0	Centrocampista	MAD	f
20399	Antonio Barragán	0	\N	-0	0	5.1500001	0	0	Defensa	VAL	f
20468	Lass Diarra	2	\N	0.5	0.5	1	1	1	Centrocampista	MAD	f
20578	Mehdi Lacen	2	\N	0.25	0.25	2.49000001	0.5	0.200000003	Centrocampista	GET	f
20599	Fernando Amorebieta	0	\N	-0	0	6	0	0	Defensa	BIL	f
20663	Jaime Gavilán	0	\N	-0	0	11.0600004	0	0	Centrocampista	GET	f
20632	Acuña	0	\N	-0	0	9.40999985	0	0	Delantero	MAD	f
21055	Javi Chica	2	\N	0.75	0.75	6.71999979	1.5	0.219999999	Defensa	BET	f
17861	Sergio Ramos	2	\N	0.25	0.25	7.6500001	0.5	0.0700000003	Defensa	MAD	f
21059	Abel	0	\N	-0	0	6.88999987	0	0	Centrocampista	GRN	f
21250	Javi Fuego	2	\N	1.25	1.25	6.40999985	2.5	0.389999986	Centrocampista	RAY	f
17878	Francesc Fábregas	2	\N	1.25	1.25	11.7799997	2.5	0.209999993	Centrocampista	BAR	f
17905	Javier Arizmendi	0	\N	-0	0	2.1500001	0	0	Delantero	MAL	f
17906	Iván Ramis	0	\N	-0	0	7.73000002	0	0	Defensa	MAL	f
17911	Jordi Codina	0	\N	-0	0	8.22000027	0	0	Portero	GET	f
76012	Iker Muniain	1	\N	0	0	9.27999973	0	0	Delantero	BIL	f
76127	Lucas Wilchez	1	\N	0.5	1	4.82000017	1	0.209999993	Centrocampista	RZG	f
17973	Asier Riesgo	0	\N	-0	0	7.55000019	0	0	Portero	OSA	f
76298	Ion Echaide	0	\N	-0	0	1.94000006	0	0	Defensa	OSA	f
76508	Hugo Mallo	2	\N	-1	-1	3.76999998	-2	-0.529999971	Defensa	CEL	f
76554	Juli	0	\N	-0	0	5.01000023	0	0	Centrocampista	RAY	f
76510	Yoel	0	\N	-0	0	7.55000019	0	0	Portero	CEL	f
76559	Dani Hernández	0	\N	-0	0	7.55000019	0	0	Portero	VLD	f
76561	Dani	0	\N	-0	0	4.11999989	0	0	Portero	RAY	f
76642	Kevin Lacruz	0	\N	-0	0	3.98000002	0	0	Centrocampista	RZG	f
76620	Toni	1	\N	0.75	1.5	8.82999992	1.5	0.170000002	Delantero	CEL	f
76688	Jonathan dos Santos	0	\N	-0	0	1.95000005	0	0	Centrocampista	BAR	f
77418	Rafa García	0	\N	-0	0	1.41999996	0	0	Centrocampista	RAY	f
78315	Joel Robles	0	\N	-0	0	5.38000011	0	0	Portero	AMR	f
78333	Javi López	2	\N	1.5	1.5	3.99000001	3	0.75	Centrocampista	ESP	f
78324	Raúl Baena	0	\N	-0	0	1.07000005	0	0	Centrocampista	ESP	f
78627	Dani Jiménez	0	\N	-0	0	7.55000019	0	0	Portero	SEV	f
78812	Iván González	0	\N	-0	0	3.6500001	0	0	Defensa	MAD	f
78878	Andrés Túñez	2	\N	1.5	1.5	4.67999983	3	0.639999986	Defensa	CEL	f
79862	Lucas Porcar	0	\N	-0	0	5.01000023	0	0	Centrocampista	RZG	f
80153	Jon Aurtenetxe	0	\N	-0	0	6.69999981	0	0	Defensa	BIL	f
80077	Jonás Ramalho	0	\N	-0	0	4.51000023	0	0	Defensa	BIL	f
79864	Ibrahima	0	\N	-0	0	10.4899998	0	0	Delantero	OSA	f
80432	Iñigo López	2	\N	-0.75	-0.75	6.86000013	-1.5	-0.219999999	Defensa	GRN	f
80285	Alejandro Arribas	2	\N	0.75	0.75	5.75	1.5	0.25999999	Defensa	OSA	f
80434	Borja Gomez	2	\N	1.25	1.25	3.52999997	2.5	0.709999979	Defensa	GRN	f
80789	Jordi Amat	2	\N	-2.25	-2.25	1	-4.5	-4.5	Defensa	RAY	f
81138	Marc Bartra	0	\N	-0	0	4.51000023	0	0	Defensa	BAR	f
80791	Sergi Enrich	0	\N	-0	0	7.13999987	0	0	Delantero	MAL	f
81735	Liassine Cadamuro	0	\N	-0	0	4.55999994	0	0	Defensa	RSO	f
80840	Cristiano	0	\N	-0	0	7.55000019	0	0	Portero	VAL	f
80956	Tomás Pina	2	\N	1.25	1.25	1.89999998	2.5	1.32000005	Centrocampista	MAL	f
82787	Álvaro Arroyo	0	\N	-0	0	2.86999989	0	0	Defensa	GET	f
83564	Antonio Luna	0	\N	-0	0	6.28999996	0	0	Defensa	SEV	f
82451	Luis Alberto	0	\N	-0	0	1.98000002	0	0	Centrocampista	SEV	f
83979	Álex López	2	\N	1	1	4.73999977	2	0.419999987	Centrocampista	CEL	f
84372	Diogo Salomao	0	\N	-0	0	5.01000023	0	0	Centrocampista	DEP	f
86136	Sumy	0	\N	-0	0	5.01000023	0	0	Centrocampista	CEL	f
86153	Martín Montoya	0	\N	-0	0	4.71000004	0	0	Defensa	BAR	f
86380	José Juan	0	\N	-0	0	7.55000019	0	0	Portero	GRN	f
86876	Paco Alcácer	0	\N	-0	0	3.97000003	0	0	Delantero	GET	f
86398	Jonathan Viera	0	\N	-0	0	9.40999985	0	0	Delantero	VAL	f
87744	Manuel Lucena	1	\N	1	2	1.96000004	2	1.01999998	Defensa	GRN	f
88209	Diego Ifrán	0	\N	-0	0	5.23999977	0	0	Delantero	RSO	f
88158	Héctor Ladero	0	\N	-0	0	4.51000023	0	0	Defensa	CEL	f
88271	João Victor	2	\N	1	1	1	2	2	Centrocampista	MAL	f
88280	Diego Benito	0	\N	-0	0	2.29999995	0	0	Centrocampista	RAY	f
88454	Ezequiel	0	\N	-0	0	1.92999995	0	0	Centrocampista	BET	f
88477	Nacho	0	\N	-0	0	4.51000023	0	0	Defensa	MAD	f
88479	Álex Fernández	0	\N	-0	0	5.01000023	0	0	Centrocampista	MAD	f
88481	Fran Rico	0	\N	-0	0	4.30999994	0	0	Centrocampista	GRN	f
88482	Morata	1	\N	0.5	1	8.40999985	1	0.119999997	Delantero	MAD	f
88505	Javi Álamo	0	\N	-0	0	9.40999985	0	0	Delantero	RZG	f
88754	Geoffrey Kondogbia	0	\N	-0	0	5.01000023	0	0	Centrocampista	SEV	f
88782	Juan Carlos	0	\N	-0	0	9.40999985	0	0	Delantero	DEP	f
88484	Pablo Sarabia	0	\N	-0	0	4.11000013	0	0	Centrocampista	GET	f
88790	Ismael	0	\N	-0	0	7.55000019	0	0	Portero	RAY	f
88802	Diamanka	0	\N	-0	0	1.63999999	0	0	Centrocampista	RAY	f
88794	Alcañiz	0	\N	-0	0	4.51000023	0	0	Defensa	RAY	f
88925	Jorge Pulido	0	\N	-0	0	2.75	0	0	Defensa	AMR	f
88885	Kevin	0	\N	-0	0	4.76000023	0	0	Defensa	MAL	f
88952	José Campaña	0	\N	-0	0	4.1500001	0	0	Centrocampista	SEV	f
89171	Juanito	0	\N	-0	0	4.51000023	0	0	Defensa	BET	f
89217	Álex Martínez	0	\N	-0	0	3.05999994	0	0	Centrocampista	BET	f
89274	Jota	0	\N	-0	0	5.01000023	0	0	Centrocampista	CEL	f
90116	Raúl Rodríguez	1	\N	-1	-2	6.44999981	-2	-0.310000002	Defensa	ESP	f
89402	Raoul Loe	2	\N	2	2	2.72000003	4	1.47000003	Centrocampista	OSA	f
89335	Saúl Ñíguez	0	\N	-0	0	5.01000023	0	0	Centrocampista	AMR	f
90152	Raphael Varane	0	\N	-0	0	4.28000021	0	0	Defensa	MAD	f
90318	Iñigo Martínez	0	\N	-0	0	4.42000008	0	0	Defensa	RSO	f
90328	Rubén Pardo	1	\N	0.75	1.5	3.25999999	1.5	0.460000008	Centrocampista	RSO	f
90408	Manuel Omwu	0	\N	-0	0	4.1500001	0	0	Delantero	OSA	f
90407	David Timor	1	\N	0	0	2.98000002	0	0	Centrocampista	OSA	f
90388	Isaac Cuenca	0	\N	-0	0	9.13000011	0	0	Delantero	BAR	f
90402	Roberto Torres	1	\N	0.75	1.5	4.90999985	1.5	0.310000002	Centrocampista	OSA	f
90477	Jon Villanueva	0	\N	-0	0	7.55000019	0	0	Portero	VLD	f
90479	Borja Ekiza	0	\N	-0	0	3.61999989	0	0	Defensa	BIL	f
90392	Imanol Elías	0	\N	-0	0	7.55000019	0	0	Portero	OSA	f
90513	Javi Navas	0	\N	-0	0	5.01000023	0	0	Centrocampista	VLD	f
90573	Alejandro Gálvez	2	\N	1.25	1.25	2.8599999	2.5	0.870000005	Defensa	RAY	f
90482	Galder Cerrajería	0	\N	-0	0	5.01000023	0	0	Centrocampista	BIL	f
90657	Ferreiro	0	\N	-0	0	5.01000023	0	0	Centrocampista	GRN	f
90512	Felipe	0	\N	-0	0	4.51000023	0	0	Defensa	VLD	f
90716	Yeray	0	\N	-0	0	7.55000019	0	0	Portero	MAL	f
90763	Cristian Gómez	2	\N	1.5	1.5	1.48000002	3	2.02999997	Centrocampista	ESP	f
90761	Cristian Alfonso	1	\N	0.25	0.5	1.16999996	0.5	0.430000007	Centrocampista	ESP	f
93338	Álvaro Vadillo	0	\N	-0	0	4.36999989	0	0	Delantero	BET	f
91338	Recio	0	\N	-0	0	1.61000001	0	0	Centrocampista	MGA	f
92493	Víctor Álvarez	0	\N	-0	0	4.51000023	0	0	Defensa	ESP	f
91393	Pedro Bigas	2	\N	0.75	0.75	3.04999995	1.5	0.49000001	Defensa	MAL	f
93127	Jesé	0	\N	-0	0	9.40999985	0	0	Delantero	MAD	f
95461	Thievy	0	\N	-0	0	7.19999981	0	0	Delantero	ESP	f
95677	Carlos	0	\N	-0	0	4.51000023	0	0	Defensa	RZG	f
96234	Javi Hervás	1	\N	0	0	4.6500001	0	0	Centrocampista	SEV	f
96445	Abdul Razak	0	\N	-0	0	5.01000023	0	0	Centrocampista	VLD	f
96084	Álvaro González	2	\N	0.75	0.75	4.65999985	1.5	0.319999993	Defensa	RZG	f
96736	Ruiz de Galarreta	2	\N	1	1	4.73999977	2	0.419999987	Centrocampista	BIL	f
90401	Annunziata	0	\N	-0	0	2.1500001	0	0	Centrocampista	OSA	f
98452	Sergio Rodríguez	0	\N	-0	0	2.1099999	0	0	Centrocampista	BET	f
\.


--
-- Name: equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id);


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

