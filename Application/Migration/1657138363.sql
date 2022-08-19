CREATE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language PLPGSQL;
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    title TEXT NOT NULL,
    body TEXT DEFAULT '' NOT NULL
);
ALTER TABLE posts ADD CONSTRAINT posts_title_key UNIQUE(title);
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their posts" ON posts USING (user_id = ihp_user_id()) WITH CHECK (user_id = ihp_user_id());
