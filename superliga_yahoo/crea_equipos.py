# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import psycopg2,random

def sacaFutbolista(posicion,cantidad):
	cur = conn.cursor()
	cur.execute("SELECT name,market_price,point_average_total FROM jugadores where position=%s and games_played >= 1 and valid = true order by RANDOM() limit %s;",(posicion,cantidad))
	futbolistas = cur.fetchall()
	cur.close()
	return futbolistas


def dameEquipo(porteros,defensas,centros,delanteros):
	lista = []
	map(lista.append, sacaFutbolista('Portero',porteros))
	map(lista.append, sacaFutbolista('Defensa',defensas))
	map(lista.append, sacaFutbolista('Centrocampista',centros))
	map(lista.append, sacaFutbolista('Delantero',delanteros))

	precio = 0
	puntuacion = 0
	for jugador in lista:
		precio = precio + jugador[1]
		puntuacion = puntuacion + jugador[2]
	return lista,precio,puntuacion


if __name__ == "__main__":
	conn = psycopg2.connect("dbname=ligayahoo user=fabio")
	superior = 0
	lista = ['433','442','352','343']
	while True:
		sistema = random.choice(lista)
		if sistema == '433':
			equipo,precio,puntuacion = dameEquipo(1,4,3,3)
		if sistema == '442':
			equipo,precio,puntuacion = dameEquipo(1,4,4,2)
		if sistema == '352':
			equipo,precio,puntuacion = dameEquipo(1,3,5,2)
		if sistema == '343':
			equipo,precio,puntuacion = dameEquipo(1,3,4,3)

		if puntuacion > superior:
			superior = puntuacion
			if precio <= 100:
				print
				print sistema
				for jugador in equipo:
					print jugador
				print precio,puntuacion
	conn.close()

