import mysql.connector


mimi = mysql.connector.connect(
    host="localhost",
    user="Apexpredator",
    password="my_secure_password",
    use_pure=True

)
try:
    if mimi.is_connected():
        print("Connected to MySQL server")

    cursor = mimi.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    

    print("Database 'alx_book_store' created successfully!")
except mysql.connector.Error as e:
        print("Error while connecting to MySQL", e)


finally:
    if mimi and mimi.is_connected():
        if cursor:
            cursor.close()
        mimi.close()
        print("MySQL connection is closed.")