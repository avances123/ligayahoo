# con 10000000 rank = 116

import psycopg2,random,itertools,time
from multiprocessing import Process,Pool

NUMTEAMS=20000000
MAX_PRICE = 100
MIN_RANK = 1


class Player:
	"""
	Un jugador de la liga yahoo
	"""
	def __init__(self,id,name,position,market_price=0,point_average_last3=0):
		self.id = id
		self.market_price = market_price
		self.point_average_last3 = point_average_last3
		self.name = name
		self.position = position


class Team:
	"""
	Un equipo de la liga yahoo, conjunto de 11 jugadores
	"""
	id_start = 1

	def __init__(self):
		self.price = 0
		self.rank = 0
		self.players = []
		self.dibujo = ()
		self.id = Team.id_start
		Team.id_start += 1		


	def isValid(self):
		self.price = 0
		self.rank = 0
		for i in self.players:
			self.price += i.market_price
			self.rank += i.point_average_last3

		if self.price > MAX_PRICE:
			return False
		if self.rank < MIN_RANK:
			return False
#		if len(self.players) != 11:
#			return False
		return True



class Driver:

	def __init__(self):
		self.conn = psycopg2.connect("dbname=ligayahoo user=postgres",autocommit=True)
		self.cur = self.conn.cursor()
		self.goalkeepersp = self.getPlayerByPositionPrice('Portero')
		self.defencesp = self.getPlayerByPositionPrice('Defensa')
		self.midfieldersp = self.getPlayerByPositionPrice('Centrocampista')
		self.strikersp = self.getPlayerByPositionPrice('Delantero')
		self.goalkeepersr = self.getPlayerByPositionRank('Portero')
		self.defencesr = self.getPlayerByPositionRank('Defensa')
		self.midfieldersr = self.getPlayerByPositionRank('Centrocampista')
		self.strikersr = self.getPlayerByPositionRank('Delantero')

	def sacaUltimoIdTeam(self,dibujo):
		dibu_s = '(' + ','.join(str(elem) for elem in dibujo) + ')'
		self.cur.execute("SELECT id from equipos where dibujo = %s order by id desc limit 1",(dibu_s,))
		try:
			return self.cur.fetchone()[0] + 20
		except:
			return 1


	def close(self):
		self.cur.close()
		self.conn.close()


	def saveTeam(self,team):
		pgarray = []
		for player in team.players:
			self.cur.execute("INSERT INTO equipos (id,jugador,dibujo,precio,rendimiento) VALUES (%s,%s,%s,%s,%s);",(team.id,player.id,team.dibujo,team.price,team.rank))
		self.conn.commit()

	def getPlayerByPositionPrice(self,position):
		players = []
		self.cur.execute("SELECT id,name,position,market_price,point_average_last3 FROM jugadores where valid = true and position = %s order by market_price asc",(position,))
		for row in self.cur.fetchall():
			players.append(Player(row[0],row[1],row[2],row[3],row[4]))
		return players

	def getPlayerByPositionRank(self,position):
		players = []
		self.cur.execute("SELECT id,name,position,market_price,point_average_last3 FROM jugadores where valid = true and position = %s order by point_average_last3 desc",(position,))
		for row in self.cur.fetchall():
			players.append(Player(row[0],row[1],row[2],row[3],row[4]))
		return players

	def getBruteForceTeam(self,dibujo,iteracion):
		x = 0
		start = time.time()
		for delanteros in itertools.combinations(self.strikersr,dibujo[3]):
			for porteros in itertools.combinations(self.goalkeepersr,dibujo[0]):
				for defensas in itertools.combinations(self.defencesr,dibujo[1]):
					for centros in itertools.combinations(self.midfieldersr,dibujo[2]):
						x = x + 1

						if x % 10000000 == 0:
							print dibujo,time.time() - start,x/10000000
							start = time.time()

						if x <= iteracion + 2:
							continue

						team = Team()
						team.players = []
						map(team.players.append,porteros)
						map(team.players.append,defensas)
						map(team.players.append,centros)
						map(team.players.append,delanteros)
						team.dibujo = dibujo
					
						yield team
						if team.isValid():
							yield team





def saveTeamMulti(dibujo):
	driver = Driver()
	iteracion = driver.sacaUltimoIdTeam(dibujo)
	print "comenzando en la iteracion: %d" % iteracion
	for team in driver.getBruteForceTeam(dibujo,iteracion):
		print "%f;%f;%s;%d" % (team.price,team.rank,team.dibujo,team.id)
		driver.saveTeam(team)
	driver.close()


if __name__ == "__main__":
	#Team.id_start = driver.sacaUltimoIdTeam()
	p = Pool(4)
	p.map(saveTeamMulti,[(1,3,4,3),(1,4,3,3),(1,4,4,2),(1,3,5,2)])
