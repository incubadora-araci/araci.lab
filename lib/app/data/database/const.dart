const String DATABASE_NAME = "araci.db";
const int VERSION = 1;

const List<String> TABLES_MODELS = [
  """
  CREATE TABLE Node (
    node integer NOT NULL CONSTRAINT Node_pk PRIMARY KEY,
    content text NOT NULL,
    title text NOT NULL
  );
  """,
  """
  CREATE TABLE Image (
    image integer NOT NULL CONSTRAINT Image_pk PRIMARY KEY,
    file blob NOT NULL,
    node_id integer NOT NULL,
    CONSTRAINT Image_Node FOREIGN KEY (node_id)
    REFERENCES Node (node)
  );
  """,
  """
  CREATE TABLE Link (
    link integer NOT NULL CONSTRAINT Link_pk PRIMARY KEY,
    url text NOT NULL,
    node_id integer NOT NULL,
    CONSTRAINT Link_Node FOREIGN KEY (node_id)
    REFERENCES Node (node)
  );
  """,

  """
  CREATE TABLE Video (
    video integer NOT NULL CONSTRAINT Video_pk PRIMARY KEY,
    url text NOT NULL,
    title text NOT NULL,
    node_id integer NOT NULL,
    CONSTRAINT Video_Node FOREIGN KEY (node_id)
    REFERENCES Node (node)
  );
  """,
];

const Map<String, List<String>> TABLES_MODELS_UPDATES = {
};