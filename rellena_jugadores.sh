#!/bin/bash

psql -U postgres ligayahoo -c "TRUNCATE TABLE jugadores CASCADE"
scrapy crawl yahoo
