INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO posts (user_id, title, body) VALUES
(1, 'First Post', 'This is Alice\'s first post!'),
(2, 'Hello World', 'Bob says hello!'),
(3, 'Random Thoughts', 'Charlie shares some random thoughts.');
