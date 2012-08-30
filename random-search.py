# con 10000000 rank = 116

import psycopg2,random,itertools

NUMTEAMS=20000000


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
	id_start = 0

	def __init__(self):
		self.price = 0
		self.rank = 0
		self.players = []
		self.dibujo = ()
		self.id = Team.id_start
		Team.id_start += 1		

	def isValid(self):
		if self.price > 100:
			return False
		if self.rank < 80:
			return False
		if len(self.players) != 11:
			return False
		return True

	def sumData(self):
		self.price = 0
		self.rank = 0
		for i in self.players:
			self.price += i.market_price
			self.rank += i.point_average_last3
		#print "Grabando datos: %d %d" % (self.price,self.rank)



class Driver:

	def __init__(self):
		self.conn = psycopg2.connect("dbname=ligayahoo user=postgres",autocommit=True)
		self.cur = self.conn.cursor()
		self.goalkeepers = self.getPlayerByPosition('Portero')
		self.defences = self.getPlayerByPosition('Defensa')
		self.midfielders = self.getPlayerByPosition('Centrocampista')
		self.strikers = self.getPlayerByPosition('Delantero')
		self.teams_done = 0

	def sacaUltimoIdTeam(self):
		self.cur.execute("SELECT id from equipos order by id desc limit 1")
		try:
			return self.cur.fetchone()[0]
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

	def getPlayerByPosition(self,position):
		players = []
		self.cur.execute("SELECT id,name,position,market_price,point_average_last3 FROM jugadores where valid = true and position = %s order by point_average_last3 desc",(position,))
		for row in self.cur.fetchall():
			players.append(Player(row[0],row[1],row[2],row[3],row[4]))
		return players



	def getRandomizedTeam(self):
		team = Team()
		while team.isValid() is False:
			self.teams_done += 1
			team.players = []
			#print "Equipo falso precio: %d" % team.price
			dibujos = [(1,3,5,2),(1,4,3,3),(1,4,4,2),(1,3,4,3)]
			team.dibujo = random.choice(dibujos)
			map(team.players.append,random.sample(self.goalkeepers,team.dibujo[0]))
			map(team.players.append,random.sample(self.defences,team.dibujo[1]))
			map(team.players.append,random.sample(self.midfielders,team.dibujo[2]))
			map(team.players.append,random.sample(self.strikers,team.dibujo[3]))
			team.sumData()
		return team



	def getBruteForceTeam(self):
		dibujos = [(1,3,4,3),(1,3,5,2),(1,4,3,3),(1,4,4,2)]
		for dibujo in dibujos:
			for porteros in itertools.combinations(self.goalkeepers,dibujo[0]):
				for defensas in itertools.combinations(self.defences,dibujo[1]):
					for centros in itertools.combinations(self.midfielders,dibujo[2]):
						for delanteros in itertools.combinations(self.strikers,dibujo[3]):
							team = Team()
							team.players = []
							map(team.players.append,porteros)
							map(team.players.append,defensas)
							map(team.players.append,centros)
							map(team.players.append,delanteros)
							team.dibujo = dibujo
							team.sumData()
							self.teams_done += 1
							if team.isValid():
								yield team
		

if __name__ == "__main__":
	driver = Driver()
	toprank = 0
	Team.id_start = driver.sacaUltimoIdTeam()
	print Team.id_start
	#for i in range(NUMTEAMS):
	for team in driver.getBruteForceTeam():
		#team = driver.getRandomizedTeam()
		print "%f;%f;%s;%d" % (team.price,team.rank,team.dibujo,driver.teams_done)
		driver.saveTeam(team)
		if team.rank > toprank:
			toprank = team.rank
	print "%d,%f" % (driver.teams_done,toprank)
	driver.close()
