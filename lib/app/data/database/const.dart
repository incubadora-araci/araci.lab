const String DATABASE_NAME = "araci.db";
const int VERSION = 1;

const List<String> TABLES_MODELS = [

  """
  CREATE TABLE Article (
    id integer NOT NULL CONSTRAINT Node_pk PRIMARY KEY,
    title text DEFAULT NULL,
    body text DEFAULT NULL,
    externalUrl text DEFAULT NULL,
    imgUrl text DEFAULT NULL,
    related text DEFAULT NULL
  );
  """
  // """
  // CREATE TABLE Article (
  //   id integer NOT NULL CONSTRAINT Node_pk PRIMARY KEY,
  //   content text NOT NULL,
  //   title text NOT NULL
  // );
  // """,
  // """
  // CREATE TABLE Image (
  //   id integer NOT NULL CONSTRAINT Image_pk PRIMARY KEY,
  //   file blob NOT NULL,
  //   article_id integer NOT NULL,
  //   CONSTRAINT Image_Article FOREIGN KEY (article_id)
  //   REFERENCES Article (id)
  // );
  // """,
  // """
  // CREATE TABLE Link (
  //   id integer NOT NULL CONSTRAINT Link_pk PRIMARY KEY,
  //   url text NOT NULL,
  //   article_id integer NOT NULL,
  //   CONSTRAINT Link_Article FOREIGN KEY (article_id)
  //   REFERENCES Article (id)
  // );
  // """,
  //
  // """
  // CREATE TABLE Video (
  //   id integer NOT NULL CONSTRAINT Video_pk PRIMARY KEY,
  //   url text NOT NULL,
  //   title text NOT NULL,
  //   article_id integer NOT NULL,
  //   CONSTRAINT Video_Article FOREIGN KEY (article_id)
  //   REFERENCES Article (id)
  // );
  // """,
];

const Map<String, List<String>> TABLES_MODELS_UPDATES = {
};