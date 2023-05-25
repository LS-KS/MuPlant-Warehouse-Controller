from PySide6.QtCore import QObject, Signal, Slot
from src.websocket.websocketClient import WSClient
from src.controller import EventlogController
from datetime import datetime
import threading


def createMessage(source, message):
    time = datetime.now()
    return f"[{time}] [{source}]: {message}"


class WebsocketController(QObject):
    newMessage = Signal(str)


    def __init__(self, controller: EventlogController.EventlogController, parent=None):
        super().__init__(parent)
        self.controller = controller
        self.ws = WSClient(self.controller)

    @Slot(str, str)
    def writeEvent(self, source, message):
        self.newMessage.emit(createMessage(source, message))

    @Slot(str, str)
    def startWebSocket(self, Ip=None, port=None):
        self.ws.wsApp = self.ws.createWebsocket()
        self.ws.wsApp.url = "wss://api.gemini.com/v1/marketdata/BTCUSD"


        # Create a separate thread for running the WebSocket in the background
        def run_websocket():
            self.ws.wsApp.run_forever()
        run_websocket()
        thread = threading.Thread(target=run_websocket)
        thread.start()
