from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.http import Request
from scrapy import log

from superliga_yahoo.items import SuperligaYahooItem

class SuperligaYahooSpider(BaseSpider):
	name = 'yahoo'
	domain_name = "es.laliga.fantasysports.yahoo.com"
	#start_urls = ["http://es.laliga.fantasysports.yahoo.com/football/players/00000","http://es.laliga.fantasysports.yahoo.com/football/players/19054"]
	def start_requests(self):
		#for i in range(0,100000):
		with open('/home/fabio/src/superliga_yahoo/superliga_yahoo/id.txt') as f:
			for i in f.readlines():
				j = int(i)
				yield Request('http://es.laliga.fantasysports.yahoo.com/football/players/%d' % j, self.parse,meta={'id':j})
	

	def parse(self, response):
		hxs = HtmlXPathSelector(response)
		#self.log('A response from %s just arrived!' % response.url)
		# Si no existe el futbolista salimos
		error = hxs.select('//*[@id="yspmain"]/div/div[2]/font/b').extract()
		if len(error) > 0:
			return None

		item = SuperligaYahooItem()
		item['id'] = response.request.meta['id']
		item['name'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[1]/div[2]/h2/text()').extract()[0].strip()
		item['games_played'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[1]/tbody/tr[1]/td/span/text()').extract()[0].strip()
		item['total_points'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[1]/tbody/tr[2]/td[1]/span[1]/text()').extract()[0].strip()
		item['market_price'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[1]/tbody/tr[2]/td[2]/text()').extract()[0].strip()
		item['price_per_point'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[3]/tbody/tr[2]/td[2]/text()').extract()[0].strip()
		item['point_average_last3'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[3]/tbody/tr[3]/td/span/text()').extract()[0].strip()
		item['point_average_total'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[3]/tbody/tr[4]/td[2]/text()').extract()[0].strip()
		#item['lastweek_points'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[2]/table[3]/tbody/tr[4]/td[1]/text()').extract()[0].strip()
		item['lastweek_points'] = None

		equipo_posicion = hxs.select('//*[@id="yspmain"]/div/div/div/div[1]/div[2]/h4/text()').extract()[0].strip()
		equipo,posicion = equipo_posicion.split(',')
		equipo = equipo.strip()
		posicion = posicion.strip()
		item['team'] = equipo
		item['position'] = posicion

		return item
		

SPIDER = SuperligaYahooSpider()


