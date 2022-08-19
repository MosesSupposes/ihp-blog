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
