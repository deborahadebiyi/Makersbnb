CREATE TABLE spaces (

    space_id SERIAL PRIMARY KEY, 
    name VARCHAR(60), 
    description VARCHAR(200), 
    price NUMERIC(5, 2), 
    date DATE, 
    availability VARCHAR(60), 
    FOREIGN KEY (user_id) REFERENCES users(id)

    );