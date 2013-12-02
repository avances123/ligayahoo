from pymongo import MongoClient,DESCENDING,ASCENDING
import statsd
from datetime import datetime
import re
pattern = re.compile('[\W_]+')

client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores

gauge = statsd.Gauge('ligayahoo')

x = 0
#entradas = jugadores.aggregate([ {"$sort": {"date":-1}},{"$group":{"_id": { "uid":"$g3.data.id"  },"date":{"$first":"$date" }, "salary":{"$first":"$g3.data.salary"}}}])['result']
entradas = jugadores.aggregate([ {"$sort": {"date":-1}},{"$group":{"_id":"$g3.data.id"  ,"date":{"$first":"$date" }, "salary":{"$first":"$g1.data.weeks.salary"}}}])['result']
for i in entradas:
    #import ipdb
    #ipdb.set_trace()
    #print i
    salario = i['salary'][-1]
    if salario > 10:
        gauge.send(str(i['_id']), salario)
        x = x + 1
        

print "[%s] Num eventos %d" % (datetime.now(),x)
