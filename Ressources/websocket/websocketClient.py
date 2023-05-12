import websocket
from Ressources.controller import EventlogController


class WSClient:

    def __init__(self, controller: EventlogController.EventlogController):
        self.controller = controller
        self.wsApp = None

    def onMessage(self,ws, message):
        print(message)

    def onError(self,ws, error):
        self.controller.writeEvent("WebSocket", error)

    def onClose(self,ws, close_status_code, close_msg):
        print("### closed ###")

    def onOpen(self,ws):
        print("Opened connection")

    def createWebsocket(self, Ip=None, port=None):
        websocket.enableTrace(True)
        if Ip and port:
            return None
        else:
            ws = websocket.WebSocketApp(
                url = "wss://api.gemini.com/v1/marketdata/BTCUSD",
                on_open = self.onOpen,
                on_message = self.onMessage,
                on_error = self.onError,
                on_close = self.onClose
            )

        return ws



