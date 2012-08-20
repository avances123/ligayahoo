# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import psycopg2

class SuperligaYahooPipeline(object):

	def open_spider(self,spider):
		self.conn = psycopg2.connect("dbname=ligayahoo user=fabio")


	def close_spider(self,spider):
		self.conn.close()

	def process_item(self, item, spider):
		cur = self.conn.cursor()
		cur.execute("INSERT INTO jugadores (id,name,games_played,lastweek_points,point_average_total,point_average_last3,market_price,total_points,price_per_point,team,position,valid) VALUES (%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s)",(item['id'],item['name'],item['games_played'],item['lastweek_points'],item['point_average_total'],item['point_average_last3'],item['market_price'],item['total_points'],item['price_per_point'],item['team'],item['position'],True))
		self.conn.commit()
		cur.close()
		return item
