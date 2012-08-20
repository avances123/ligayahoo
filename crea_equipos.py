# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import psycopg2
from numpy import random

def sacaFutbolista(posicion,cantidad):
	cur.execute("SELECT name,market_price FROM jugadores where position=%s order by RANDOM() limit %s;",(posicion,cantidad))
	futbolistas = cur.fetchall()
	return futbolistas


def dameEquipo(porteros,defensas,centros,delanteros):
	lista = []
	map(lista.append, sacaFutbolista('Portero',1))
	map(lista.append, sacaFutbolista('Defensa',4))
	map(lista.append, sacaFutbolista('Centrocampista',3))
	map(lista.append, sacaFutbolista('Delantero',3))

	precio = 0
	for jugador in lista:
		precio = precio + jugador[1]
	return lista,precio


if __name__ == "__main__":
	conn = psycopg2.connect("dbname=ligayahoo user=fabio")
	cur = conn.cursor()
	superior = 0
	while True:
		equipo,precio = dameEquipo(1,4,3,3)
		if precio > superior:
			superior = precio
			print
			for jugador in equipo:
				print jugador
			print precio
	cur.close()
	conn.close()

