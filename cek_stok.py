from database_toko import get_id
import database_toko as dt

def stok_habis():
    list_produk = get_id()
    data_toko = dt.update_toko()
    f = open('baranghabis.txt', 'w')
    for i in list_produk:
        produk,stok,hrg_beli_dus,hrg_jual_dus,hrg_jual_pcs,etalase = data_toko.get_data(i)
        #buat cek produk missing
        if produk == None:
            # print(i)
            pass
        if int(etalase) <= 5:
            # print(f'{produk} tersisa : {etalase}')
            f.write(f'{produk} tersisa : {etalase}')
            f.write('\n')
        

# stok_habis()