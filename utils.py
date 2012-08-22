import psycopg2,random

class Player:
	"""
	Un jugador de la liga yahoo
	"""
	def __init__(self,name,position,market_price=0,point_average_last3=0):
		self.market_price = market_price
		self.point_average_last3 = point_average_last3
		self.name = name
		self.position = position


class Team:
	"""
	Un equipo de la liga yahoo, conjunto de 11 jugadores
	"""
	def __init__(self):
		self.price = 0
		self.rank = 0
		self.players = []
		self.dibujo = ()

	def isValid(self):
		if self.price > 100:
			return False
		if len(self.players) != 11:
			return False
		if len(self.players)!=len(set(self.players)):
			#print "Atencion, equipo con jugadores repetidos"
			return False
		return True

	def updateData(self):
		self.price = 0
		self.rank = 0
		for i in self.players:
			self.price += i.market_price
			self.rank += i.point_average_last3
		#print "Grabando datos: %d %d" % (self.price,self.rank)



class Driver:

	def __init__(self):
		self.conn = psycopg2.connect("dbname=ligayahoo user=fabio",autocommit=True)
		self.cur = self.conn.cursor()
		self.allplayers = self.getAllPlayers()
		self.goalkeepers = self.getPlayerByPosition('Portero')
		self.defences = self.getPlayerByPosition('Defensa')
		self.midfielders = self.getPlayerByPosition('Centrocampista')
		self.strikers = self.getPlayerByPosition('Delantero')
		self.teams_done = 0

	def close(self):
		self.cur.close()
		self.conn.close()

	def getPlayerByPosition(self,position):
		players = []
		self.cur.execute("SELECT name,position,market_price,point_average_last3 FROM jugadores where valid = true and position = %s;",(position,))
		for row in self.cur.fetchall():
			players.append(Player(row[0],row[1],row[2],row[3]))
		return players


	def getAllPlayers(self):
		players = []
		self.cur.execute("SELECT name,position,market_price,point_average_last3 FROM jugadores where valid = true;")
		for row in self.cur.fetchall():
			players.append(Player(row[0],row[1],row[2],row[3]))
		return players

	def getRandomizedTeam(self):
		team = Team()
		while team.isValid() is False:
			team.players = []
			#print "Equipo falso precio: %d" % team.price
			dibujos = [(1,4,3,3),(1,4,4,2),(1,3,4,3),(1,3,5,2)]
			team.dibujo = random.choice(dibujos)
			for i in range(team.dibujo[0]):
				team.players.append(random.choice(self.goalkeepers))
			for i in range(team.dibujo[1]):
				team.players.append(random.choice(self.defences))
			for i in range(team.dibujo[2]):
				team.players.append(random.choice(self.midfielders))
			for i in range(team.dibujo[3]):
				team.players.append(random.choice(self.strikers))
			team.updateData()

		self.teams_done += 1
		return team


if __name__ == "__main__":
	driver = Driver()
	toprank = 0
	for i in range(1000000):
	#while True:
		team = driver.getRandomizedTeam()
		if team.rank > toprank:
			toprank = team.rank
			print
			print team.dibujo
			for i in team.players:
				print i.name,i.position,i.market_price,i.point_average_last3
			print team.price,team.rank
			print
	print driver.teams_done
	driver.close()
