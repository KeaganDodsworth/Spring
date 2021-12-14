-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.et_categories
(
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(20) NOT NULL,
    description character varying(50) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE public.et_transactions
(
    transaction_id integer NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    amount numeric(10, 2) NOT NULL,
    note character varying(50) NOT NULL,
    transaction_date bigint NOT NULL,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE public.et_users
(
    user_id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    password text NOT NULL,
    PRIMARY KEY (user_id)
);

ALTER TABLE public.et_categories
    ADD FOREIGN KEY (user_id)
    REFERENCES public.et_users (user_id)
    NOT VALID;


ALTER TABLE public.et_transactions
    ADD FOREIGN KEY (category_id)
    REFERENCES public.et_categories (category_id)
    NOT VALID;


ALTER TABLE public.et_transactions
    ADD FOREIGN KEY (user_id)
    REFERENCES public.et_users (user_id)
    NOT VALID;

END;