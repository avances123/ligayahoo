
mongo ligayahoo --eval "db.dropDatabase()" !! exit 1

for i in $(cat id.txt);do



curl "http://es.eurosport.yahoo.com/_fantasy_api?crumb=2I9.oQgbLVH&timeout=3000" \
-H "Cookie: ywadp1000800974962=1480175058; YLS=v=1&p=1&n=0; B=3f1fmd9877hmf&b=4&d=yXY52vZpYFLEitwyAiB8k4F7ww22fOV4gI9WjQ--&s=fc&i=yFLY4l2iL2LeiOtwTc.U; AO=o=0; F=a=OORLAzkMvSiUI_rC7J3nqWrC9Bj4wa_VNeA5pVkLTKkEdXWYyKAW7RM0dcW6TIC13dJsOI0-&b=i1C6; Y=v=1&n=54gvkmog05305&l=5018e_hk430_20hh0i2ei0/o&p=m2jvves013000000&jb=34|42|&iz=28047&r=bl&lg=es-ES&intl=es; PH=l=es-ES&i=es&fn=un2zdwb4Sq4JYLHy9gw-; T=z=PCSCSBPW5GSBhQONbxpt7ssNTJPBjU1MzBOME5ONzY-&a=QAE&sk=DAAypE3zYH4ovC&ks=EAA7yxLf8wHmG5bjpZRWH.72w--~E&d=c2wBTWpVNEFUSXlORGM1TnprNU1ERS0BYQFRQUUBZwEyWEZRRTZDQlpISEQ3NDVSUlczS1BMMkxIRQFzY2lkAVBxRk9VNi5TWDJmbmQ2TG51Y3EuemlBSUNLOC0BYWMBQUVPRHlRQ1cBYWwBYXZhbmNlczEyMwF0aXABWHB0SE9DAXNjAXdsAXp6AVBDU0NTQkE3RQ--&af=QXdBQjFDJnRzPTEzNzYzMjk4NzEmcHM9emF0a2lFaEpRVjJqM3hqcjRmRTczdy0t; U=mt=kNqNTJ2MhYjd45yanRk7Q85XWmm026lHFOiS3g9Qzg--&ux=TDCUSB&un=54gvkmog05305; MSC=t=1380983010X; fpc1000800974962=ZVqHnTm3|pfjY3msNaa|fses1000800974962=|aMMgJgfNaa|ZVqHnTm3|fvis1000800974962=|8MoMHH87s8|8MoMHH87s8|8MoMHH87s8|s|8MoMHH87s8|8MoMHH87s8; ugccmt_comment_usortoptv1=highestRated; ypcdb=de37349631c5e76031e0885932612949" \
-H "Origin: http://es.eurosport.yahoo.com" \
-H "Accept-Encoding: gzip,deflate,sdch" \
-H "Host: es.eurosport.yahoo.com" \
-H "Accept-Language: es,en-US;q=0.8,en;q=0.6" \
-H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36" \
-H "Content-Type: application/json" \
-H "Accept: */*" \
-H "Referer: http://es.eurosport.yahoo.com/fantasy/la-liga/details/${i}" \
-H "X-Requested-With: XMLHttpRequest" \
-H "Connection: keep-alive" \
--data-binary "{\"requests\":{\"g0\":{\"resource\":\"salcap.player_stats\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g1\":{\"resource\":\"salcap.player_history\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g2\":{\"resource\":\"salcap.player_notes\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g3\":{\"resource\":\"salcap.player\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g4\":{\"resource\":\"salcap.player_season_stats\",\"operation\":\"read\",\"params\":{\"game\":\"soes\",\"id\":\"${i}\",\"force\":true,\"season\":\"2013\"}}},\"context\":{\"crumb\":\"2I9.oQgbLVH\"}}" --compressed \
| mongoimport --db ligayahoo --collection jugadores



done

