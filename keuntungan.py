import mysql.connector
from mysql.connector import errorcode
from statistics import mean

try:
  mydb = mysql.connector.connect(user='root',
                                host='localhost',
                                password='wildanSAGA7654!',
                                database='plastik_solusa')
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)

mycursor = mydb.cursor()
list_beli = []
list_untung = []
list_persen = []
def keuntungan():
    sql = f"SELECT hrg_beli_pcs, hrg_jual_pcs FROM stok_plastik"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    for count,value in enumerate(myresult):
        list_beli.append(int(value[0]))
        list_untung.append(int(value[1]) - int(value[0]))
        list_persen.append(round(((list_untung[count]/list_beli[count]) * 100),1))
    avg = round((mean(list_persen)),1)
    return avg
    

# keuntungan()