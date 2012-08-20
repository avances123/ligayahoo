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
		for i in range(19000,19955):
			#print 'http://es.laliga.fantasysports.yahoo.com/football/players/%05d' % i
			yield Request('http://es.laliga.fantasysports.yahoo.com/football/players/%05d' % i, self.parse)
	

	def parse(self, response):
		hxs = HtmlXPathSelector(response)
		#self.log('A response from %s just arrived!' % response.url)
		# Si no existe el futbolista salimos
		error = hxs.select('//*[@id="yspmain"]/div/div[2]/font/b').extract()
		if len(error) > 0:
			return None

		item = SuperligaYahooItem()
		item['name'] = hxs.select('//*[@id="yspmain"]/div/div/div/div[1]/div[2]/h2/text()').extract()[0].strip()
		return item
		

SPIDER = SuperligaYahooSpider()


