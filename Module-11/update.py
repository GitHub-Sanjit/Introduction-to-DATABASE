import mysql.connector

db_name = "python_test_db"
mydbconnection = mysql.connector.connect(
    host="localhost", user="root", password="sanjit", database=db_name
)

print(mydbconnection.user)

mycursor = mydbconnection.cursor()

sqlquery = """
            UPDATE Student 
            SET Name = 'SS Sarkar'
            WHERE Name = 'Sanjit Sarkar'
        """


mycursor.execute(sqlquery)
mydbconnection.commit()
print("Update in Table successful")
