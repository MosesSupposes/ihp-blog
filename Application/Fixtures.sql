

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body) VALUES ('46ff3f49-4403-4a9c-ad6d-5d1109cba5ed', 'Chicken Wangs Rule! 🍗📏  Here''s Why:', 'Here are three reasons why they''re the most superior form of sustenance:

1.) They''re a great source of protein, therefore they''re great for your muscles 💪
2.) They''re equally as great for your taste buds 😋
3.) They''re a way healthier alternative to red meat (such as beef and pork). Your body has a much easier time digesting them. ');
INSERT INTO public.posts (id, title, body) VALUES ('8aa9c483-4ae0-4038-92dd-e94c540409bb', 'Hello World', 'Lorem ipsum dipsum
');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1657219598);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


