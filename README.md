# hostloccredit
/*备用  
jsshell:  
a javascript shell, download from https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/ .  
*/

用法1：bash hostloc.sh username password  
用法2：bash hostloc.sh accountfile  

推荐写入crontab:  
43 4 * * * bash /root/hostloc.sh /root/hostlocpsw >/root/hostlog/$(date +\\%Y\\%m\\%d)-log.txt

可以推送到微信，需要关注wxpusher获得ID
