
CREATE USER pgbouncer WITH PASSWORD 'super_secret';

CREATE SCHEMA pgbouncer AUTHORIZATION pgbouncer;

CREATE OR REPLACE FUNCTION pgbouncer.get_auth(p_usename TEXT)
RETURNS TABLE(rolname TEXT, rolpassword TEXT) STABLE AS
$$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT a.rolname::TEXT, a.rolpassword::TEXT
    FROM pg_authid a
    WHERE a.rolname = p_usename
    --AND NOT a.rolsuper
    ;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename TEXT) FROM PUBLIC;

GRANT EXECUTE ON FUNCTION pgbouncer.get_auth(p_usename TEXT) TO pgbouncer;
