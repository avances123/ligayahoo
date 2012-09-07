# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import psycopg2

class SuperligaYahooPipeline(object):
	
	def open_spider(self,spider):
		self.conn = psycopg2.connect("dbname=ligayahoo user=postgres")
		self.cur  = self.conn.cursor()

	def close_spider(self,spider):
		self.cur.close()
		self.conn.close()

	def process_item(self, item, spider):
		try:
			self.cur.execute("INSERT INTO jugadores (id,name,games_played,lastweek_points,point_average_total,point_average_last3,market_price,total_points,price_per_point,team,position,valid) VALUES (%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s)",(item['id'],item['name'],item['games_played'],item['lastweek_points'],item['point_average_total'],item['point_average_last3'],item['market_price'],item['total_points'],item['price_per_point'],item['team'],item['position'],True))
			self.conn.commit()
		except psycopg2.IntegrityError:
			self.conn.rollback()
			#self.cur.execute("UPDATE jugadores SET games_played = %s,lastweek_points=%s,point_average_total=%s,point_average_last3=%s,market_price=%s,total_points=%s,price_per_point=%s WHERE id=%s",(item['games_played'],item['lastweek_points'],item['point_average_total'],item['point_average_last3'],item['market_price'],item['total_points'],item['price_per_point']))
			#self.conn.commit()
		return item
