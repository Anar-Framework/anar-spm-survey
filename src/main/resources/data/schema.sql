

CREATE TABLE public.m_survey_components (
    id bigint NOT NULL,
    description character varying(4096),
    a_key character varying(32),
    sequence_no integer,
    a_text character varying(255),
    survey_id bigint
);


ALTER TABLE public.m_survey_components OWNER TO asims_user;



CREATE SEQUENCE public.m_survey_components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE public.m_survey_lookup_tables (
    id bigint NOT NULL,
    description character varying(4096),
    a_key character varying(32),
    score double precision,
    value_from integer,
    value_to integer,
    survey_id bigint
);




CREATE SEQUENCE public.m_survey_lookup_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.m_survey_lookup_tables_id_seq OWNED BY public.m_survey_lookup_tables.id;


CREATE TABLE public.m_survey_questions (
    id bigint NOT NULL,
    component_key character varying(32),
    description character varying(4096),
    a_key character varying(32),
    sequence_no integer,
    a_text character varying(255),
    survey_id bigint
);




CREATE SEQUENCE public.m_survey_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE public.m_survey_questions_id_seq OWNED BY public.m_survey_questions.id;



CREATE TABLE public.m_survey_responses (
    id bigint NOT NULL,
    sequence_no integer,
    a_text character varying(255),
    a_value integer,
    question_id bigint
);



CREATE SEQUENCE public.m_survey_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.m_survey_responses_id_seq OWNED BY public.m_survey_responses.id;



CREATE TABLE public.m_survey_scorecards (
    id bigint NOT NULL,
    created_on timestamp without time zone,
    a_value integer,
    question_id bigint,
    response_id bigint,
    survey_id bigint
);



CREATE SEQUENCE public.m_survey_scorecards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.m_survey_scorecards_id_seq OWNED BY public.m_survey_scorecards.id;



CREATE TABLE public.m_surveys (
    id bigint NOT NULL,
    country_code character varying(2),
    description character varying(4096),
    a_key character varying(32),
    a_name character varying(255),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone
);




CREATE SEQUENCE public.m_surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE public.m_surveys_id_seq OWNED BY public.m_surveys.id;





ALTER TABLE ONLY public.m_survey_components ALTER COLUMN id SET DEFAULT nextval('public.m_survey_components_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 83745)
-- Name: m_survey_lookup_tables id; Type: DEFAULT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_lookup_tables ALTER COLUMN id SET DEFAULT nextval('public.m_survey_lookup_tables_id_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 83756)
-- Name: m_survey_questions id; Type: DEFAULT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.m_survey_questions_id_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 83767)
-- Name: m_survey_responses id; Type: DEFAULT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_responses ALTER COLUMN id SET DEFAULT nextval('public.m_survey_responses_id_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 83775)
-- Name: m_survey_scorecards id; Type: DEFAULT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_scorecards ALTER COLUMN id SET DEFAULT nextval('public.m_survey_scorecards_id_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 83783)
-- Name: m_surveys id; Type: DEFAULT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_surveys ALTER COLUMN id SET DEFAULT nextval('public.m_surveys_id_seq'::regclass);






--
-- TOC entry 1945 (class 2606 OID 83739)
-- Name: m_survey_components m_survey_components_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_components
    ADD CONSTRAINT m_survey_components_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 2606 OID 83750)
-- Name: m_survey_lookup_tables m_survey_lookup_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_lookup_tables
    ADD CONSTRAINT m_survey_lookup_tables_pkey PRIMARY KEY (id);


--
-- TOC entry 1949 (class 2606 OID 83761)
-- Name: m_survey_questions m_survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_questions
    ADD CONSTRAINT m_survey_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 1951 (class 2606 OID 83769)
-- Name: m_survey_responses m_survey_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_responses
    ADD CONSTRAINT m_survey_responses_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 83777)
-- Name: m_survey_scorecards m_survey_scorecards_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_scorecards
    ADD CONSTRAINT m_survey_scorecards_pkey PRIMARY KEY (id);


--
-- TOC entry 1955 (class 2606 OID 83788)
-- Name: m_surveys m_surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_surveys
    ADD CONSTRAINT m_surveys_pkey PRIMARY KEY (id);


--
-- TOC entry 1957 (class 2606 OID 83793)
-- Name: sample_entity sample_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.sample_entity
    ADD CONSTRAINT sample_entity_pkey PRIMARY KEY (id);



--
-- TOC entry 1941 (class 2606 OID 83805)
-- Name: cors uk_delmogs573hpobhyemau3dckw; Type: CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.cors
    ADD CONSTRAINT uk_delmogs573hpobhyemau3dckw UNIQUE (allowed_method);



--
-- TOC entry 1960 (class 2606 OID 83812)
-- Name: m_survey_components fk2mr2ysvk92dlhk39uts0559wv; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_components
    ADD CONSTRAINT fk2mr2ysvk92dlhk39uts0559wv FOREIGN KEY (survey_id) REFERENCES public.m_surveys(id);


--
-- TOC entry 1961 (class 2606 OID 83817)
-- Name: m_survey_lookup_tables fk9om6iidr2akukxqfcwlano7mr; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_lookup_tables
    ADD CONSTRAINT fk9om6iidr2akukxqfcwlano7mr FOREIGN KEY (survey_id) REFERENCES public.m_surveys(id);


--
-- TOC entry 1965 (class 2606 OID 83837)
-- Name: m_survey_scorecards fkciapdkpaltupwgrfpudnii8to; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_scorecards
    ADD CONSTRAINT fkciapdkpaltupwgrfpudnii8to FOREIGN KEY (response_id) REFERENCES public.m_survey_responses(id);


--
-- TOC entry 1964 (class 2606 OID 83832)
-- Name: m_survey_scorecards fkefsk0usa96ldgly1b32mgqrq2; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_scorecards
    ADD CONSTRAINT fkefsk0usa96ldgly1b32mgqrq2 FOREIGN KEY (question_id) REFERENCES public.m_survey_questions(id);


--
-- TOC entry 1963 (class 2606 OID 83827)
-- Name: m_survey_responses fkn0vj5589uf8gc9xb9r7bjs2fl; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_responses
    ADD CONSTRAINT fkn0vj5589uf8gc9xb9r7bjs2fl FOREIGN KEY (question_id) REFERENCES public.m_survey_questions(id);


--
-- TOC entry 1966 (class 2606 OID 83842)
-- Name: m_survey_scorecards fko880ym10thkg1h0edfa8b8nrl; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_scorecards
    ADD CONSTRAINT fko880ym10thkg1h0edfa8b8nrl FOREIGN KEY (survey_id) REFERENCES public.m_surveys(id);


--
-- TOC entry 1962 (class 2606 OID 83822)
-- Name: m_survey_questions fkrv41kkh26bxtlks9lhdl1efpa; Type: FK CONSTRAINT; Schema: public; Owner: asims_user
--

ALTER TABLE ONLY public.m_survey_questions
    ADD CONSTRAINT fkrv41kkh26bxtlks9lhdl1efpa FOREIGN KEY (survey_id) REFERENCES public.m_surveys(id);



