from pymongo import MongoClient,DESCENDING,ASCENDING
from cube import Cube, ONE_HOUR
from datetime import datetime
import re
pattern = re.compile('[\W_]+')

client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores


cube = Cube()

x = 0
entradas = jugadores.find({},{"g1.data.weeks":{"$slice":-1},"g1.data.weeks.salary":1,"date":1,"_id":0,"g3.data.name":1,"g3.data.id":1}).sort([("date",DESCENDING),]).limit(589)
for i in entradas:
    #import ipdb
    #ipdb.set_trace()
    x = x + 1
    player_name = i['g3']['data']['name']
    player_name = player_name.lower()
    player_name = pattern.sub('_', player_name)
    salario = i['g1']['data']['weeks'][0]['salary']
    #if salario > 15:
    #    salario = salario + 6
    cube.put('id_' + i['g3']['data']['id'],{'salary': salario})

print "[%s] Num eventos %d" % (datetime.now(),x)
