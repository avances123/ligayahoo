# Scrapy settings for superliga_yahoo project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/topics/settings.html
#

BOT_NAME = 'superliga_yahoo'

SPIDER_MODULES = ['superliga_yahoo.spiders']
NEWSPIDER_MODULE = 'superliga_yahoo.spiders'
DEFAULT_ITEM_CLASS = 'superliga_yahoo.items.SuperligaYahooItem'
#USER_AGENT = '%s/%s' % (BOT_NAME, BOT_VERSION)
ITEM_PIPELINES = ['superliga_yahoo.pipelines.SuperligaYahooPipeline']
#REDIRECT_ENABLED = False
DOWNLOAD_DELAY = 2
#LOG_FILE = 'log.txt'
LOG_STDOUT = True
