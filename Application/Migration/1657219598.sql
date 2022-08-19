CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE job_status AS ENUM ('job_status_not_started', 'job_status_running', 'job_status_failed', 'job_status_timed_out', 'job_status_succeeded', 'job_status_retry');
CREATE FUNCTION ihp_user_id() RETURNS UUID AS $$
    SELECT NULLIF(current_setting('rls.ihp_user_id'), '')::uuid;
$$ language SQL;
CREATE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language PLPGSQL;
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL
);
