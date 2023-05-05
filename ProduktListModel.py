from PySide6 import QtCore
from PySide6 import QtQuick

# This class implements data from 'Produkte.db'
class Product:
    def __init__(self, id: int, name: str):
        self.id = id
        self.name = name

if __name__ == '__main__':
    try:
        # Open product file and read lines to list.
        # Avoid u\ufeff prefix in data by set encoding to utf8-8-sig (source: stackoverflow)
        with open("Ressources/data/Produkte.db", 'r', encoding='utf-8-sig') as file:
            product_list = file.readlines()

        # Create a list of Product objects
        products = []
        for line in product_list:
            # Split the line by ';' to get the id and name
            product_data = line.strip().split(';')
            product_id = int(product_data[0])
            product_name = product_data[1]

            # Create a Product object and add it to the list
            product = Product(product_id, product_name)
            products.append(product)
        '''
        # Print the list of Product objects
        for product in products:
            print(f"{product.id}: {product.name}")
        '''
    except FileNotFoundError:
        print("Error: could't find product list file 'Produkte.db'")
    except FileExistsError:
        print("Error: file 'Produkte.db' doesn't exist")