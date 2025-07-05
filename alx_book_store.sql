import mysql.connector

mimi = mysql.connector.connect(
    host="localhost",
    user="Apexpredator",
    password="my_secure_password",
    use_pure=True

)

my_cursor = mimi.cursor()

my_cursor.execute ("CREATE Database if NOT EXISTS alx_book_store")
my_cursor.execute ("USE alx_book_store")

my_cursor.execute("""CREATE TABLE IF NOT EXISTS Authors (
author_id INT AUTO_INCREMENT PRIMARY KEY,
author_name VARCHAR(215))
""")
mimi.commit()

my_cursor.execute("""CREATE TABLE IF NOT EXISTS Customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(215),
email VARCHAR(215),
address TEXT)
                  """)
mimi.commit()

my_cursor.execute("""CREATE TABLE IF NOT EXISTS Orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE,
    
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id))
                 """)
mimi.commit()

my_cursor.execute("""CREATE TABLE IF NOT EXISTS Books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(130),
author_id INT,
price DOUBLE,
publication_date DATE,
    
FOREIGN KEY (author_id) REFERENCES Authors(author_id))
                  """)
mimi.commit()


my_cursor.execute("""CREATE TABLE IF NOT EXISTS Order_Details (
orderdetailsid INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity DOUBLE,

FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id))
     """ )
mimi.commit()
                  
