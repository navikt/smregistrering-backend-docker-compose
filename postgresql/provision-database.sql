CREATE ROLE "smregistrering-backend-admin"  WITH LOGIN password 'test123';
CREATE ROLE "smregistrering-backend-user" WITH LOGIN password 'test123';
CREATE ROLE "smregistrering-backend-readonly" WITH LOGIN password 'test123';

GRANT CONNECT ON DATABASE "smregistrering-backend" to "smregistrering-backend-admin";
GRANT CONNECT ON DATABASE "smregistrering-backend" to "smregistrering-backend-user";
GRANT CONNECT ON DATABASE "smregistrering-backend" to "smregistrering-backend-readonly";

CREATE DATABASE "smregistrering-backend-admin";
CREATE DATABASE "smregistrering-backend-user";