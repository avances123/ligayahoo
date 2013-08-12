from scrapy.spider import BaseSpider
from scrapy.contrib.spiders.init import InitSpider

from scrapy.selector import HtmlXPathSelector
from scrapy.http import Request,FormRequest
from scrapy import log
from scrapy.contrib.spiders import Rule
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
import keyring,csv

from superliga_yahoo.items import SuperligaYahooItem

class SuperligaYahooSpider(InitSpider):
	name = 'yahoo'
	user = 'avances123'
	domain_name = "es.eurosport.yahoo.com"
	login_page = 'https://login.yahoo.com/config/login'
	#start_urls = ['http://es.eurosport.yahoo.com/fantasy/la-liga/top']
	#rules = (Rule(SgmlLinkExtractor(allow=r''),callback='parse_item', follow=True),)
	
	def init_request(self):
	    return Request(url=self.login_page, callback=self.login)
	
	def login(self, response):
	    passwd = keyring.get_password('login.yahoo.com', self.user)
	    return FormRequest.from_response(response,formdata={'login': self.user, 'passwd': passwd },callback=self.check_login_response)
	
	def check_login_response(self, response):
	    if "fabio_rueda_carrascosa" in response.body:
	        self.log("Successfully logged in. Let's start crawling!")
	        #return self.initialized()
	        return self.starts_requests()
	    else:
	        self.log("Bad times :(")
	
	def starts_requests(self):
	    with open('/home/fabio/src/superliga_yahoo/superliga_yahoo/id.txt') as f:
	        csvfile = csv.DictReader(f)
	        for i in csvfile:
	            j = i['URL']
	            yield Request('http://es.eurosport.yahoo.com%s' % j, self.parse,meta={'id':1})
    


	def parse(self, response):
		hxs = HtmlXPathSelector(response)
		self.log('A response from %s just arrived!' % response.url)

		item = SuperligaYahooItem()
		return item
		

SPIDER = SuperligaYahooSpider()


