import mysql.connector
from mysql.connector import errorcode

try:
  mydb = mysql.connector.connect(user='tokosolusa',
                                host='192.168.1.29',
                                password='wildanSAGA7654',
                                database='plastik_solusa')
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)

mycursor = mydb.cursor()

class hutangToko():
    jumlahHutang = 0
    def __init__(self):
        self.nominalHutang()

    def nominalHutang(self):
        query = f"SELECT utang from utang order by transaksiID desc limit 1"
        mycursor.execute(query)
        result = mycursor.fetchall()
        self.jumlahHutang = int(result[0][0])
        
        return self.jumlahHutang

    def nambahHutang(self,berhutang):
        self.nominalHutang()
        self.jumlahHutang = self.jumlahHutang + berhutang
        query = f"INSERT INTO utang (transaksiID,tanggal,utang) VALUES (0,'2023-12-2',{self.jumlahHutang})" 
        mycursor.execute(query)
        mydb.commit()
        return self.jumlahHutang

    def kurangHutang(self,bayar):
        self.nominalHutang()
        self.jumlahHutang = self.jumlahHutang - bayar
        query = f"INSERT INTO utang (transaksiID,tanggal,utang) VALUES (0,'2023-12-2',{self.jumlahHutang})" 
        mycursor.execute(query)
        mydb.commit()
        return self.jumlahHutang

if __name__ == '__main__':
    # hutangToko().nambahHutang(100000)
    hutangToko().kurangHutang(300000)
    print(hutangToko().nominalHutang())