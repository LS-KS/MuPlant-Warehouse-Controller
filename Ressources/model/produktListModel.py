import PySide6
from PySide6.QtCore import  QAbstractListModel,QByteArray
from PySide6 import QtCore
import typing


class Product:
    def __init__(self, id:int, name:str):
        self.id = id
        self.name = name

# This class loads data from 'Produkte.db' and delegates it to QAbstractListModel
# This is necessary for using Data in QML
class ProductList (QAbstractListModel):
    def __init__(self, file:str):
        QAbstractListModel.__init__(self)
        self.productList = []
        if file:
            self.loadData(file)
    def loadData(self, FILE):
        try:
            # Open product file and read lines to list.
            # Avoid u\ufeff prefix in data by set encoding to utf8-8-sig (source: stackoverflow)
            with open(FILE, 'r', encoding='utf-8-sig') as file:
                list = file.readlines()

            for line in list:
                # Split the line by ';' to get the id and name
                product_data = line.strip().split(';')
                product_id = int(product_data[0])
                product_name = product_data[1]
                self.productList.append(Product(id=product_id, name=product_name))
            # Print the list of Product objects
            for product in self.productList:
                print(f"{product.id}: {product.name}")
        except FileNotFoundError:
                print("Error: could't find product list file 'Produkte.db'")
        except FileExistsError:
                print("Error: file 'Produkte.db' doesn't exist")

    def data(self, index: typing.Union[PySide6.QtCore.QModelIndex, PySide6.QtCore.QPersistentModelIndex], role: int = ...) -> typing.Any:
        if not index.isValid():
            return None
        if role == QtCore.Qt.DisplyRole:
            return self.productList[index]

    def rowCount(self, parent: typing.Union[PySide6.QtCore.QModelIndex, PySide6.QtCore.QPersistentModelIndex] = ...) -> int:
        # return length of productList
        return len(self.productList)

    def roleNames(self) -> dict[int, QByteArray]:
        d = {}
        for i, field in enumerate(fields(Student)):
            d[Qt.DisplayRole + i] = field.name.encode()
        return d



if __name__ == '__main__':
    productListModel = ProductList("../data/Produkte.db")
