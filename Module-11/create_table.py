import mysql.connector

db_name = "python_test_db"
mydbconnection = mysql.connector.connect(
    host="localhost", user="root", password="sanjit", database=db_name
)

print(mydbconnection.user)


mycursor = mydbconnection.cursor()

sqlquery = """
            CREATE TABLE Student(
                Roll VARCHAR(4),
                Name VARCHAR(50)
            )
"""

mycursor.execute(sqlquery)
print("Create Table successful")
