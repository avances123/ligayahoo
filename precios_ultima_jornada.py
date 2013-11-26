from pymongo import MongoClient
import matplotlib.pyplot as plt
import pandas as pd


client = MongoClient()
client = MongoClient('localhost', 27017)
db = client.ligayahoo
jugadores = db.jugadores


agregacion = jugadores.aggregate([
    {"$unwind": "$g1.data.weeks"},
    {"$match": {"g1.data.weeks.week": 15, "g3.data.salary": { "$gt" :20}}},
    {"$project": {
        "g3.data.name": 1,
        "date": 1,
        "g1.data.weeks.salary": 1,
        "_id": 0
    }},
    {"$sort": { "date": 1}}
    ])
entradas = agregacion['result'] 


df = pd.DataFrame(columns=('date', 'name','salary'))
for i in entradas:
    #row = pd.DataFrame([dict(date=int(i['date'].strftime('%s')), name=i['g3']['data']['name'], id=int(i['g3']['data']['id']),salary=float(i['g1']['data']['weeks']['salary'])),])
    row = pd.DataFrame([dict(date=i['date'], name=i['g3']['data']['name'],salary=float(i['g1']['data']['weeks']['salary'])),])
    df = df.append(row)
df = df.set_index(['name','date'])



#import ipdb
#ipdb.set_trace()


levels = df.index.levels[0]
fig, axes = plt.subplots(len(levels),sharex=True)
for level, ax in zip(levels, axes):
    df.loc[level].plot(ax=ax, title=level)
plt.show()

#print df