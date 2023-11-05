import mysql.connector

db_name = "python_test_db"
mydbconnection = mysql.connector.connect(
    host="localhost", user="root", password="sanjit", database=db_name
)

print(mydbconnection.user)

mycursor = mydbconnection.cursor()

sqlquery = """
            INSERT INTO Student(Roll,Name)
            VALUES('101','Sanjit Sarkar')
        """


mycursor.execute(sqlquery)
mydbconnection.commit()
print("Insert in Table successful")
