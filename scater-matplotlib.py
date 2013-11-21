from pymongo import MongoClient
import matplotlib.pyplot as plt


FORMA_MINIMA = 7


client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores

# Colores
pos_map = {'M': 1, 'D': 2, 'F': 3, 'G': 4}

x = []
y = []
area = []
names = []
color = []
for jugador in jugadores.find():
    if jugador['g3']['data']['avgl3w'] > FORMA_MINIMA:
        x.append(jugador['g3']['data']['salary'])
        y.append(jugador['g3']['data']['season_points'])
        names.append(jugador['g3']['data']['name'])
        area.append(0.3*jugador['g3']['data']['avgl3w']**3)
        color.append(float(pos_map[jugador['g3']['data']['position']]))

fig = plt.figure()
plt.scatter(x, y, s=area, c=color, alpha=0.5)
for i, txt in enumerate(names):
    plt.annotate(txt, (x[i], y[i]))
fig.suptitle('ligayahoo analysis', fontsize=20)
plt.xlabel('Precio', fontsize=18)
plt.ylabel('Puntos Totales', fontsize=16)
plt.show()
