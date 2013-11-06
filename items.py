# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/topics/items.html

from scrapy.item import Item, Field

class SuperligaYahooItem(Item):
    # define the fields for your item here like:
    id = Field()
    name = Field()
    dorsal = Field()
    games_played = Field()
    total_points = Field()
    market_price = Field()
    shots_on_target = Field()
    lastweek_points = Field()
    position = Field()
    team = Field()
    goals = Field()
    assists = Field()
    int_pass = Field()
    faults = Field()
    cards = Field()
    jornada = Field()
    
    


