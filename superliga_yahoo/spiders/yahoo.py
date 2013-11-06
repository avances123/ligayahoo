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
        item['posicion'] = datos_personales[2].strip()
        item['equipo'] = datos_personales[3].strip()
        item['nombre'] = hxs.select('//div/div/div/div/div/h2/text()').extract()[0].strip()


        #elem_grandes = hxs.select('//*[@id="player-card-header"]/div[1]//em/text()').extract()
        elem_grandes = hxs.select('//*[@class="Grid boxes"]//em/text()').extract()
        #GRANDES: [u'52pts', u'\u20ac 11.38M', u'3pts', u'5', u'5', u'1.03%']
        self.log('GRANDES: %s' % elem_grandes)

        item['puntos_totales'] = elem_grandes[0].replace('pts','')
        item['precio'] = elem_grandes[1].replace(u'\u20ac ','').replace('M','')
        item['forma'] = elem_grandes[2].replace('pts','')
        item['media'] = elem_grandes[3]
        item['ptos_euro'] = elem_grandes[4]
        item['pop'] = elem_grandes[5].replace('%','') #popularidad


        #elementos = hxs.select('//span/em/text()').extract()
        elementos = hxs.select('//*[@id="stat-box"]//tr[1]/td/text()').extract()
        self.log('Elementos: %s' % elementos)
        self.log('Len: %s' % len(elementos))
        
        item['jornada'] = elementos[0].strip()
        item['pj']  = elementos[1].strip()
        item['g']   = elementos[2].strip()
        item['asi'] = elementos[3].strip()
        item['gd']  = elementos[4].strip()
        item['gbp'] = elementos[5].strip()
        item['gp']  = elementos[6].strip()
        item['tp']  = elementos[7].strip()
        item['rs']  = elementos[8].strip()
        item['ag']  = elementos[9].strip()
        item['pi']  = elementos[10].strip()
        item['pc']  = elementos[11].strip()
        item['pf']  = elementos[12].strip()
        item['pa']  = elementos[13].strip()
        item['ata'] = elementos[14].strip()
        item['tb']  = elementos[15].strip()
        item['b']   = elementos[16].strip()
        item['fc']  = elementos[17].strip()
        item['fr']  = elementos[18].strip()
        item['br']  = elementos[19].strip()
        item['ta']  = elementos[20].strip()
        item['tr']  = elementos[21].strip()
        item['j']   = elementos[22].strip()


        return item

        	
        

SPIDER = SuperligaYahooSpider()


