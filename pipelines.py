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
		yellow_cards = re.split('/', item['cards'])[0]
		red_cards = re.split('/', item['cards'])[1]
		#market_price = ''.join(e for e in item['market_price'] if e.isalnum())
		market_price = re.findall(r'\d+', item['market_price'])[0]
		#dorsal = re.split('\d+', item['dorsal'])[0]
		dorsal = ''.join(e for e in item['dorsal'] if e.isalnum())
		faults_rec = re.split('/', item['faults'])[1]
		faults_done = re.split('/', item['faults'])[0]
		try:
			self.cur.execute(
				"""INSERT INTO jugadores (
					id,
					name,
					games_played,
					dorsal,
					shots_on_target,
					lastweek_points,
					goals,
					assists,
					int_pass,
					faults_rec,
					faults_done,
					yellow_cards,
					red_cards,
					market_price,
					total_points,
					team,
					position,
					valid) 
				VALUES (%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s, %s, %s, %s, %s, %s, %s)""",
				(
					item['id'],
					item['name'],
					item['games_played'],
					dorsal,
					item['shots_on_target'],
					item['lastweek_points'].replace('pts',''),
					item['goals'],
					item['assists'],
					item['int_pass'],
					faults_rec,
					faults_done,
					yellow_cards,
					red_cards,
					market_price,
					item['total_points'].replace('pts',''),
					item['team'],
					item['position'],
					True
				))
			self.conn.commit()
		except psycopg2.IntegrityError:
			self.conn.rollback()
			#self.cur.execute("UPDATE jugadores SET games_played = %s,lastweek_points=%s,point_average_total=%s,point_average_last3=%s,market_price=%s,total_points=%s,price_per_point=%s WHERE id=%s",(item['games_played'],item['lastweek_points'],item['point_average_total'],item['point_average_last3'],item['market_price'],item['total_points'],item['price_per_point']))
			#self.conn.commit()
		return item
