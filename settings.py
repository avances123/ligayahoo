# Scrapy settings for superliga_yahoo project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/topics/settings.html
#

BOT_NAME = 'superliga_yahoo'
BOT_VERSION = '1.0'

SPIDER_MODULES = ['superliga_yahoo.spiders']
NEWSPIDER_MODULE = 'superliga_yahoo.spiders'
DEFAULT_ITEM_CLASS = 'superliga_yahoo.items.SuperligaYahooItem'
USER_AGENT = '%s/%s' % (BOT_NAME, BOT_VERSION)

