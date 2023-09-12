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

class update_toko():
    def get_data(self,id_produk):
        produk = None
        stok = None
        hrg_beli_dus = None
        hrg_jual_dus = None 
        hrg_jual_pcs = None
        etalase = None
        """MELIHAT DATA PRODUK DALAM DATABASE"""
        mycursor.execute(f"SELECT jenis_brg,stok_per_dus,hrg_beli_dus,hrg_jual_dus,hrg_jual_pcs,etalase FROM stok_plastik WHERE id='{id_produk}'")
        myresult = mycursor.fetchall()
        for x in myresult:
            produk = (x[0])
            stok = (x[1])
            hrg_beli_dus = (x[2])
            hrg_jual_dus = (x[3])
            hrg_jual_pcs = (x[4])
            etalase = (x[5])
        # print("Nama Produk:  " + str(produk))
        # print("Jumlah stok di gudang:  " + str(stok))
        # print("Harga beli produk/dus:  " + str(hrg_beli_dus))
        # print("Harga jual produk/dus:  " + str(hrg_jual_dus))
        # print("Harga jual produk/pcs:  " + str(hrg_jual_pcs))
        # print("Jumlah produk dietalase:  " + str(etalase))
        return produk,stok,hrg_beli_dus,hrg_jual_dus,hrg_jual_pcs,etalase
    
    def update_stok(id_produk,update_stok):
        """MELAKUKAN UPDATE JUMLAH STOK PRODUK"""
        update_value = f"""
        UPDATE stok_plastik
        SET stok_per_dus = '{update_stok}'
        WHERE ID = '{id_produk}'
        """
        mycursor.execute(update_value)
        mydb.commit()
    
    def update_etalase(id_produk,update_etalase):
        """MELAKUKAN UPDATE JUMLAH PRODUK PADA ETALASE"""
        update_value = f"""
        UPDATE stok_plastik
        SET etalase = '{update_etalase}'
        WHERE ID = '{id_produk}'
        """
        mycursor.execute(update_value)
        mydb.commit()

    def update_hrg_beli_dus(id_produk,hrg_beli):
        """MELAKUKAN UPDATE HARGA BELI PRODUK/DUS"""
        update_value = f"""
        UPDATE stok_plastik
        SET hrg_beli_dus = '{hrg_beli}'
        WHERE ID = '{id_produk}'
        """
        mycursor.execute(update_value)
        mydb.commit()

    def update_hrg_jual_pcs(id_produk,hrg_jual):
        """MELAKUKAN UPDATE HARGA BELI PRODUK/PCS"""
        update_value = f"""
        UPDATE stok_plastik
        SET hrg_jual_pcs = '{hrg_jual}'
        WHERE ID = '{id_produk}'
        """
        mycursor.execute(update_value)
        mydb.commit()

class arus_stok():
    
    def etalase_masuk(self,id_produk,eta_baru):
        """MENAMBAH PRODUK DI ETALASE"""
        try:
            sql = f"""
            SELECT etalase
            FROM stok_plastik
            WHERE id = '{id_produk}'"""
            mycursor.execute(sql)
            myresult = mycursor.fetchall()
            for x in myresult:
                eta_lama = int(x[0])
            eta_baru = eta_lama + eta_baru
            update_toko.update_etalase(id_produk,eta_baru)
            print("database produk bertambah")
        except:
            pass
            # print('tidak ada produk masuk')

    def etalase_keluar(self,id_produk, eta_baru):
        """MENGURANGI PRODUK DI ETALASE"""
        try:
            sql = f"""
            SELECT etalase
            FROM stok_plastik
            WHERE id = '{id_produk}'"""
            mycursor.execute(sql)
            myresult = mycursor.fetchall()
            for x in myresult:
                eta_lama = int(x[0])
            eta_baru = eta_lama - eta_baru
            update_toko.update_etalase(id_produk,eta_baru)
            print("produk berkurang")
        except: 
            pass
            # print("tidak ada produk keluar")
    
    def stok_keluar(id_produk,stok_baru):
        """MENGURANGI JUMLAH STOK"""
        sql = f"""
        SELECT stok_per_dus
        FROM stok_plastik
        WHERE id = '{id_produk}'"""
        mycursor.execute(sql)
        myresult = mycursor.fetchall()
        for x in myresult:
            stok_lama = int(x[0])
        stok_baru = stok_lama - stok_baru
        stok_baru = stok_baru * (stok_baru>0)
        update_toko.update_stok(id_produk,stok_baru)

    def stok_masuk(id_produk,stok):
        """MENAMBAH JUMLAH STOK"""
        sql = f"""
        SELECT stok_per_dus
        FROM stok_plastik
        WHERE id = '{id_produk}'"""
        mycursor.execute(sql)
        myresult = mycursor.fetchall()
        for x in myresult:
            stok_lama = int(x[0])
        stok_baru = stok_lama + stok
        update_toko.update_stok(id_produk,stok_baru)
        # print(stok_baru)

def get_id():
    """MENAMBAH PRODUK DI ETALASE"""
    sql = f"""
    SELECT ID
    FROM stok_plastik
    """
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    myresult = str(myresult)
    myresult = myresult.replace(')', "")
    myresult = myresult.replace('(', "")
    myresult = myresult.replace(',',"")
    myresult = myresult.replace('[',"").replace(']',"")
    myresult = myresult.replace("'","")

    myresult = myresult.split()
    
    return myresult


cek = 'TWS1000'
# arus_stok.stok_masuk(cek,5)
# arus_stok.stok_keluar(cek, 2)
# arus_stok.etalase_masuk(cek,5)
# arus_stok.etalase_keluar(cek,10)
# get_id()

# update_toko.get_data(cek)

