#!/bin/bash

psql ligayahoo -c "TRUNCATE TABLE jugadores CASCADE"
scrapy crawl yahoo
