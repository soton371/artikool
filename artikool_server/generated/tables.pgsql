--
-- Class Articel as table articel
--

CREATE TABLE "articel" (
  "id" serial,
  "title" text NOT NULL,
  "content" text NOT NULL,
  "publishedOn" timestamp without time zone NOT NULL,
  "isPrime" boolean NOT NULL
);

ALTER TABLE ONLY "articel"
  ADD CONSTRAINT articel_pkey PRIMARY KEY (id);


