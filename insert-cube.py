from pymongo import MongoClient


client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores


entradas = jugadores.find({},{"g1.data.weeks":{"$slice":-1},"g1.data.weeks.salary":1,"_id":0,"date":1,"g3.data.name":1})
for i in entradas:
    print i

#import ipdb
#ipdb.set_trace()


