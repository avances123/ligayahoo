import plotly
from pymongo import MongoClient



client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores

x = []
y = []
for jugador in jugadores.find():
    x.append(jugador['g3']['data']['salary'])
    y.append(jugador['g3']['data']['avgl3w'])

py = plotly.plotly(username='FabioRuedaCarrascosa', key='ivae5r7wba')

response = py.plot(x, y)
url = response['url']
filename = response['filename']


print url

