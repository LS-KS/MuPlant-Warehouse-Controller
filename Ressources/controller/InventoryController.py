

from PySide6.QtCore import QObject, Signal, Slot

class InventoryController(QObject):

    onRowClicked = Signal(str)

    @Slot(str)
    def clickMe(self, message):
        print(message)
