from pymongo import MongoClient

client = MongoClient()
db = client.ligayahoo
jugadores = list(db.jugadores.find())

print type(jugadores)
