import typing
import PySide6
from PySide6 import QtCore

class ProductListModel(QtCore.QAbstractListModel):

    def __init__(self, products, parent=None):
        super().__init__(parent)
        self.products = products

    def data(self, index, role):
        """
        Returns an appropriate value for the requested data.
        If the view requests an invalid index, an invalid variant is returned.
        Any valid index that corresponds to a string in the list causes that
        string to be returned
        :param index:
        :param role:
        :return:
        """
        row = index.row()
        if not index.isValid() or row >= len(self.products):
            return None
        product = self.products[row]
        if role == QtCore.Qt.DisplayRole:
            return product.name
        elif role == QtCore.Qt.EditRole:
            return product.name
        elif role == QtCore.Qt.UserRole + 1:
            return product.id
        elif role == QtCore.Qt.UserRole + 2:
            return product.name
        return None

    def headerData(self, section, orientation, role=QtCore.Qt.DisplayRole):
        """Returns the appropriate header string depending on the orientation of
           the header and the section. If anything other than the display role is
           requested, we return an invalid variant."""
        if role != QtCore.Qt.DisplayRole:
            return None
        if orientation == QtCore.Qt.Horizontal:
            return f"Column {section}"
        return f"Row {section}"

    def rowCount(self,
                 parent: typing.Union[PySide6.QtCore.QModelIndex, PySide6.QtCore.QPersistentModelIndex] = ...) -> int:
        # return length of productList
        return len(self.products)

    def roleNames(self):
        roles = {
            QtCore.Qt.UserRole + 1: b'id',
            QtCore.Qt.UserRole + 2: b'name',
        }
        return roles

    def indexOf(self, productID):
        for index, product in enumerate(self.products):
            if product == productID:
                return index


class Product:
    def __init__(self, id: int, name: str, quantity: int = 0):
        self.id = id
        self.name = name
        self.quantity = quantity


def getProducts(FILE=None):
    if not FILE:
        FILE = "src/data/Produkte.db"
    productList = []
    try:
        # Open product file and read lines to list.
        # Avoid u\ufeff prefix in data by set encoding to utf8-8-sig (source: stackoverflow)
        with open(FILE, 'r', encoding='utf-8-sig') as file:
            list = file.readlines()

        for line in list:
            # Split the line by ';' to get the id and name
            product_data = line.strip().split(';')
            product_id = int(product_data[0])
            product_name = str(product_data[1])
            productList.append(Product(id=product_id, name=product_name))
        # Print the list of Product objects
        # for product in productList:
        #    print(f"{product.id}: {product.name}")
    except FileNotFoundError:
        print("Error: could't find product list file 'Produkte.db'")
    except FileExistsError:
        print("Error: file 'Produkte.db' doesn't exist")

    return productList
