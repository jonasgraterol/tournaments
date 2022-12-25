SET check_function_bodies = false;
CREATE TABLE public.matches (
    used_id_1 uuid NOT NULL,
    team_1 text NOT NULL,
    score_1 integer NOT NULL,
    user_id_2 uuid NOT NULL,
    team_2 text NOT NULL,
    score_2 integer NOT NULL,
    id integer NOT NULL
);
CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;
ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);
ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_used_id_1_fkey FOREIGN KEY (used_id_1) REFERENCES auth.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_user_id_2_fkey FOREIGN KEY (user_id_2) REFERENCES auth.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
