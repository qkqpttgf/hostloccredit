#!bash

UA="Mozilla/5.0 (Linux; Android 8.0.0; FRD-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.90 Mobile Safari/537.36"
precookiefile=/root/.hostlocprecookie

curl -s -H "$UA" "https://www.hostloc.com/" | grep "slowAES">tmp
if [ -s "tmp" ]; then
  aa=`cat tmp | awk -F 'toNumbers' '{print $3}' | awk -F '"' '{print $2}'`
  bb=`cat tmp | awk -F 'toNumbers' '{print $4}' | awk -F '"' '{print $2}'`
  cc=`cat tmp | awk -F 'toNumbers' '{print $5}' | awk -F '"' '{print $2}'`
  #echo $aa,$bb,$cc
  cat aes.js>tmp
  echo "var a=toNumbers(\""$aa"\"),b=toNumbers(\""$bb"\"),c=toNumbers(\""$cc"\");print(toHex(slowAES.decrypt(c,2,a,b)));">>tmp
  L7FW=`js tmp`

  echo '# Netscape HTTP Cookie File'>${precookiefile}
  echo '# http://curl.haxx.se/docs/http-cookies.html'>>${precookiefile}
  echo '# This file was generated by libcurl! Edit at your own risk.'>>${precookiefile}
  echo>>${precookiefile}
  echo -e 'www.hostloc.com\tFALSE\t/\tFALSE\t0\tL7FW\t'$L7FW>>${precookiefile}
fi
rm -f tmp

curl -s -L -H "$UA" -b ${precookiefile} "https://www.hostloc.com/"
