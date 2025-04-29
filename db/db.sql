CREATE OR REPLACE TABLE replies
(
    id     INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prompt VARCHAR(1000),
    reply  VARCHAR(10000)
);

INSERT INTO replies (prompt, reply)
VALUES 
('python', 'Python is a high-level, interpreted programming language known for its readability and vast ecosystem. It is widely used for web development, automation, data analysis, artificial intelligence, and more.'),
('javascript', 'JavaScript is a versatile, high-level programming language primarily used for web development to create interactive effects within browsers.'),
('go', 'Go (or Golang) is an open-source programming language developed by Google. It is designed for building fast, reliable, and efficient software at scale, with built-in concurrency support.'),
('java', 'Java is a popular, class-based, object-oriented programming language designed to have as few implementation dependencies as possible. It is commonly used in enterprise, Android, and web applications.'),
('c', 'C is a general-purpose, procedural programming language that has been influential in the development of many other modern languages. It is widely used for system and embedded programming.'),
('c++', 'C++ is an extension of the C programming language with object-oriented features. It is used for software requiring high performance, such as games, real-time simulations, and large-scale applications.'),
('rust', 'Rust is a modern systems programming language focused on safety, speed, and concurrency. It prevents common bugs at compile time and is loved for building reliable software.'),
('php', 'PHP is a widely-used open-source server-side scripting language especially suited for web development and can be embedded into HTML.'),
('ruby', 'Ruby is a dynamic, open-source programming language with a focus on simplicity and productivity. It is famous for the elegant syntax used in web frameworks like Ruby on Rails.'),
('swift', 'Swift is a fast and efficient programming language developed by Apple for iOS, macOS, watchOS, and tvOS app development. It is safe by design and produces lightning-fast software.');

GRANT SELECT ON *.* TO 'app'@'%';
FLUSH PRIVILEGES;
