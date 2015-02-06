# Prep db's for incoming information
DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS shelves (id INTEGER PRIMARY KEY,
                  name TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY,
                  name STRING UNIQUE, description TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS products (
                  id INTEGER PRIMARY KEY,
                  shelf_id INTEGER NOT NULL,
                  category_id INTEGER,
                  description TEXT,
                  price INTEGER,
                  quantity INTEGER CHECK(quantity >= 0),
                  name TEXT UNIQUE,
                  FOREIGN KEY(shelf_id) REFERENCES shelves(id))")