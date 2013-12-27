#!/bin/bash

a=$(date +"%s000") # Millisecond from epoch

#mongo ligayahoo --eval "db.dropDatabase()" !! exit 1

for i in $(cat id.txt);do

curl -s 'http://es.eurosport.yahoo.com/_fantasy_api?crumb=E4oE8XTIdhf&timeout=3000' \
-H 'Cookie: U=mt=IqLgtp2MhYiqNk0REXX_kckbWuo5ZoNrJe09pu87nQ--&ux=DYZQSB&un=ea8qs12c8p7gh; MSC=t=1380029955X; ywadp1000800974962=190750060; dt=TyqAfqB.lwn6_azCN9AkkVSdFtlktUa5ruavx2kZTGisVjF4DWyu3aFc7xRrfQlUAuU9dZ1TwAenkEtLRoIrQ5.H3GgaEXLVXm_Tbc_URtWTU_gVvCF6zTHsIAyKc8yUXpK24x.KGVLI5ZgIpb79q7cVE4lYJ1Dlb7C0Ywx_3Ezqiscg_13jJiFY7_WdRbr7WzV9WDSeGCCo7OQn4Xlwxv_8GwMvMfN.I3w5Revp6PHCTTdjlyuqsvUBo28Xtipq9YpsMwHbnd.n1SyJaRP3JlHl.f4DQd1t3MOxjtwIr_qQQFH8Yfb_TCjJkRw_djjlCp.UVsNiFMq4zQgr3KpaQP0HFq0OaIXcdP.QhZ9_UsncJa8I3PNtDcKb7vwFKuNOAhhUUdxXo9teu_7cZb1BxMqbWB_h8HOv7Bl77OVO8L2TDKXVR1YlIjd4QFoTLjNENM9ZPE54Bdzha7ANDANPTuUznp5YP2S7Fzf5pVIfNo58yQ--; RMBX=3bldd898rbbm7&b=3&s=oh&t=160; fpc1000800974962=ZV7ubUkC|vLo6JKuNaa|fses1000800974962=|TV0ZBMlNaa|ZV7ubUkC|fvis1000800974962=|8Mo18sTo08|8Mo18sTo08|8Mo18sTo08|8|8Mo18sTo08|8Mo18sTo08; Y=v=1&n=ea8qs12c8p7gh&l=y1vyw2uzt44vrt1uzyvv500y5us1vy23/o&p=02j0000002000000&iz=&r=s3&lg=en-US%2Ces-ES&intl=es&np=1; T=z=HQ1jSBHkcoSB1M2g3lB6nwp&a=YAE&sk=DAA2Y03peaEE2p&ks=EAAEPCY9Nk5_oiTQDyRP9fstQ--~E&d=YQFZQUUBZwFRM1JKRVVCV0lMRE9WU1JXWUxTM1pNVzRRTQFzY2lkATdJcUw5eXI1TmZLNmxoX3pONW9OV0JhMC5fdy0BYWMBQU4wQUlZeHhqMy5KAW9rAVpXMC0BYWwBZmFiaW8ucnVlZGFAbWV0ZW9sb2dpY2EuY29tAXNjAXlvcGVuaWRfcnABenoBSFExalNCQTdFAXRpcAFReFIwcUI-&af=QkJBQjhaJnRzPTEzODUxMjQ4NzEmcHM9WEVlRFp6eEdrNi4uNmx6TVZLbzhlQS0t; B=a3mtq2p8rbbm7&b=4&d=mC3FB1VpYFIJu2ydmQw5Bg--&s=l6&i=l4VcRnNZSol9aRTIdtKA; PH=l=en-US%2Ces-ES&fn=MUrp6ptwPijTk.qv91s-; ugccmt_comment_usortoptv1=highestRated; ypcdb=fccb783c44d55e2a3b9ccb52f0436b11' \
-H 'Origin: http://es.eurosport.yahoo.com' \
-H 'Accept-Encoding: gzip,deflate,sdch' \
-H 'Host: es.eurosport.yahoo.com' \
-H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36' \
-H 'Content-Type: application/json' \
-H 'Accept: */*' \
-H 'Referer: http://es.eurosport.yahoo.com/fantasy/la-liga/details/58926' \
-H 'X-Requested-With: XMLHttpRequest' \
-H 'Connection: keep-alive' --data-binary "{\"requests\":{\"g0\":{\"resource\":\"salcap.player_stats\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g1\":{\"resource\":\"salcap.player_history\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true,\"stats\":\"1\"}},\"g2\":{\"resource\":\"salcap.player_notes\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g3\":{\"resource\":\"salcap.player\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true}},\"g4\":{\"resource\":\"salcap.player_season_stats\",\"operation\":\"read\",\"params\":{\"id\":\"${i}\",\"game\":\"soes\",\"force\":true,\"season\":\"2013\"}}},\"context\":{\"crumb\":\"E4oE8XTIdhf\"}}" --compressed \
| json_pp > jugadores/${i}.json
#| sed "s/^{/{\"date\":Date($a),/" \
#| mongoimport --db ligayahoo --collection jugadores



done

