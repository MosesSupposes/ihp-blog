CREATE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language plpgsql;
-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE INDEX posts_created_at_index ON posts (created_at);
CREATE TABLE comments (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    post_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    author TEXT NOT NULL,
    body TEXT NOT NULL,
    comment_id UUID
);
CREATE INDEX comments_post_id_index ON comments (post_id);
CREATE INDEX comments_created_at_index ON comments (created_at);
CREATE INDEX comments_comment_id_index ON comments (comment_id);
ALTER TABLE comments ADD CONSTRAINT comments_ref_comment_id FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE NO ACTION;
ALTER TABLE comments ADD CONSTRAINT comments_ref_post_id FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
