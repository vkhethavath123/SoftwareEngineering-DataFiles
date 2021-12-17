import mysql.connector
import pandas as pd
[Comments] Connect to database with sql connector

mydb = mysql.connector.connect(
   host = "localhost",
   user = 'toor',
   password ='password',
   database = "global_terrorism",
   auth_plugin = 'mysql_native_password'
)

def create_dataframe(mycursor  ,table):
   sql = "DESCRIBE {}".format(table)
   mycursor.execute(sql)
   my = mycursor.fetchall()
   table_ =  [] 
   for c in my:
       table_.append(c[0])
   try:
[Comments] Below sql statement will get whole data from user 
       sql = "SELECT * FROM {}".format(table)
       mycursor.execute(sql)
       res = mycursor.fetchall()
       data = []
       for s in res:
           data.append(s)
       df = pd.DataFrame(data, columns = table_)
      [Comments] Below line will create csv file and save it in directory
       df.to_csv("{}.csv".format(table)) 
       print(df)
   except mysql.connector.Error as err:
       print("Something went wrong")
def print_tabluar(mycursor):
[Comments] MY sql statements that prints all the tables in data base
   mycursor.execute("SHOW TABLES")
   myresult = mycursor.fetchall()
   for x in myresult:
       print("|-----------------------------------------------------------------------------------------|")\
[Comments] This function will create dataframe table out of each table in database
       create_dataframe(mycursor , x[0])
   return
mycursor = mydb.cursor()
[Comments] mycursor is a database connection and with that we can execute queries
print_tabluar(mycursor)
