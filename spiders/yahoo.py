from scrapy.spider import BaseSpider
from scrapy.contrib.spiders.init import InitSpider

from scrapy.selector import HtmlXPathSelector
from scrapy.http import Request,FormRequest
from scrapy import log
from scrapy.contrib.spiders import Rule
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
import keyring,csv,re

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
                m = re.search('\d+$', j)
                id = m.group(0)
                yield Request('http://es.eurosport.yahoo.com%s' % j, self.parse,meta={'id':id})
    


    def parse(self, response):
        hxs = HtmlXPathSelector(response)
        self.log('A response from %s just arrived!' % response.url)
        item = SuperligaYahooItem()
        item['id'] = response.request.meta['id']
        datos_personales = hxs.select('//div/div/div/div/div/div/span/text()').extract()
        #self.log("A ver: %s" % datos_personales)
        item['dorsal'] = datos_personales[1].strip()
        item['position'] = datos_personales[2].strip()
        item['team'] = datos_personales[3].strip()
        item['name'] = hxs.select('//div/div/div/div/div/h2/text()').extract()[0].strip()
        #elementos = hxs.select('//span/em/text()').extract()
        elementos = hxs.select('//*[@id="stat-box"]//td/text()').extract()
        self.log('Elementos: %s' % elementos)
        item['total_points'] = elementos[0].strip()
        item['market_price'] = elementos[1].strip()
        item['games_played'] = elementos[2].strip()
        item['lastweek_points'] = elementos[3].strip()
        item['shots_on_target'] = elementos[4].strip()
        item['goals'] = elementos[5].strip()
        item['assists'] = elementos[6].strip()
        item['int_pass'] = elementos[7].strip()
        item['faults'] = elementos[8].strip()
        item['cards'] = elementos[9].strip()


        return item
        

SPIDER = SuperligaYahooSpider()


