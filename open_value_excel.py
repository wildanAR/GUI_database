import xlwings as xw
from datetime import datetime
date = datetime.now()
def get_duit(cell):
    excel_app = xw.App(visible=False)
    excel_book = excel_app.books.open('debit.xlsx')
    try:
        nominal = excel_book.sheets[str(date.strftime("%B"))].range(cell).value
        uang = "{:,.2f}".format(nominal)
        print(nominal)
        excel_book.close()
        excel_app.quit()
    except:
        excel_book.close()
        excel_app.quit()
    return nominal 
# get_duit('F2')
