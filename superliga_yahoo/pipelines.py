# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import psycopg2
import re

class SuperligaYahooPipeline(object):
	
	def open_spider(self,spider):
		self.conn = psycopg2.connect("dbname=ligayahoo user=fabio")
		self.cur  = self.conn.cursor()

	def close_spider(self,spider):
		self.cur.close()
		self.conn.close()

	def process_item(self, item, spider):
		dorsal = ''.join(e for e in item['dorsal'] if e.isalnum())
		try:
			self.cur.execute(
				"""INSERT INTO jugadores (
				    id ,
				    nombre, 
				    equipo ,
				    posicion,
				    dorsal,
				
				    jornada,
				
				    pj,
				    g ,
				    asi ,
				    gd ,
				    gbp ,
				    gp ,
				    tp ,
				    rs ,
				    ag ,
				    pi ,
				    pc ,
				    pf ,
				    pa ,
				    ata ,
				    tb ,
				    b ,
				    fc ,
				    fr ,
				    br ,
				    ta ,
				    tr ,
				    j,
				    puntos_totales,precio,forma,media,ptos_euro,pop
				) 
				VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",
				(
					item['id'],
					item['nombre'],
					item['equipo'],
					item['posicion'],
					item['dorsal'].replace('#',''),
					item['jornada'].replace('SEMANA ',''),
			        item['pj'],  
			        item['g'],   
			        item['asi'], 
			        item['gd'], 
			        item['gbp'], 
			        item['gp'],  
			        item['tp'],  
			        item['rs'],  
			        item['ag'],  
			        item['pi'],  
			        item['pc'],  
			        item['pf'],  
			        item['pa'],  
			        item['ata'], 
			        item['tb'],  
			        item['b'],   
			        item['fc'],  
			        item['fr'],  
			        item['br'],  
                    item['ta'],  
                    item['tr'],  
                    item['j'],  
                    item['puntos_totales'],
                    item['precio'] ,
                    item['forma'] ,
                    item['media'],
                    item['ptos_euro'] ,
                    item['pop'] ,


				))
			self.conn.commit()
		except psycopg2.IntegrityError:
			self.conn.rollback()
			#self.cur.execute("UPDATE jugadores SET games_played = %s,lastweek_points=%s,point_average_total=%s,point_average_last3=%s,market_price=%s,total_points=%s,price_per_point=%s WHERE id=%s",(item['games_played'],item['lastweek_points'],item['point_average_total'],item['point_average_last3'],item['market_price'],item['total_points'],item['price_per_point']))
			#self.conn.commit()
		return item
