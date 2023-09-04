import paho.mqtt.client as paho

broker = "broker.hivemq.com"
port = 1883
pesan = ""

def on_message(client, userdata, message):
    msg = str(message.payload.decode("utf-8"))
    t = str(message.topic)
    if (t == "toko_solusa"):
        global pesan
        pesan = str(msg)
        
def publish(value):
    client= paho.Client("GUI")
    client.on_message=on_message
    # print("connecting to broker ",broker)
    client.connect(broker,port)#connect
    # print(broker," connected")
    client.loop_start()
    client.publish("toko_solusa",value)

# publish('ceekkk')