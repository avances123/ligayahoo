# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/topics/items.html

from scrapy.item import Item, Field

class SuperligaYahooItem(Item):
    # define the fields for your item here like:
    name = Field()
    games_played = Field()
    points = Field()
    market_price = Field()
