from PySide6.QtCore import QObject, Signal, Slot
from Ressources.websocket.websocketClient import createWebsocket
from datetime import datetime


def createMessage(source, message):
    time = datetime.now()
    return f"[{time}] [{source}]: {message}"

class WebsocketController (QObject):

    newMessage= Signal(str)
    ws = createWebsocket()

    @Slot(str, str)
    def writeEvent(self, source, message):
        #print("Eventcontroller: "+message)
        self.newSignal.emit( createMessage(source, message) )
