import websocket
import _thread
import time
import rel


def onMessage(ws, message):
    print(message)

def onError(ws,error):
    print(error)
def onClose(ws, close_status_code, close_msg):
    print("### closed ###")

def onOpen(ws):
    print("Opened connection")

def createWebsocket(Ip= None, port = None, errorCallback = None):
    websocket.enableTrace(True)
    if (Ip and port):
        return None
    else:
        ws = websocket.WebSocketApp("wss://api.gemini.com/v1/marketdata/BTCUSD",
                                on_open=onOpen,
                                on_message=onMessage,
                                on_error= onError,
                                on_close=onClose)

        ws.run_forever(dispatcher=rel, reconnect=5)  # Set dispatcher to automatic reconnection, 5 second reconnect delay if connection closed unexpectedly
        rel.signal(2, rel.abort)  # Keyboard Interrupt
        rel.dispatch()
    return ws
