CREATE TABLE spaces (

    space_id SERIAL PRIMARY KEY, 
    name VARCHAR(60), 
    description VARCHAR(200), 
    price NUMERIC(5, 2), 
    startdate DATE,
    enddate DATE, 
    availability BOOLEAN, 
    user_id INTEGER REFERENCES users (id)
    );