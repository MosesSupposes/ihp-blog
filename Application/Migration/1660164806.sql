ALTER TABLE comments ADD COLUMN comment_id UUID NOT NULL;
CREATE INDEX comments_comment_id_index ON comments (comment_id);
ALTER TABLE comments ADD CONSTRAINT comments_ref_comment_id FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE NO ACTION;
