const String DATABASE_NAME = "araci.db";
const int VERSION = 1;

const List<String> TABLES_MODELS = [

  """
  CREATE TABLE Article (
    id integer NOT NULL,
    title text DEFAULT NULL,
    body text DEFAULT NULL,
    externalUrl text DEFAULT NULL,
    imgUrl text DEFAULT NULL,
    relatedIds text DEFAULT NULL
  );
  """
];

const Map<String, List<String>> TABLES_MODELS_UPDATES = {
};