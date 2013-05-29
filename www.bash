#!/bin/bash

read request

while /bin/true;
do
read header
[ "$header" == $'\r' ] && break;
done

url="${request#GET }"
url="${url% HTTP/*}"
url=`echo $url | sed 's/\///'`
#url=`echo $url | sed 's/%20/ /g'`
#echo $url;

x=`echo $url | sed "s/\/$//" | awk -F "/" '{print $1}'`
#### Change $y below to your desired password.
#### The URL then looks like this: http://<IP>:50000/PASSWORD/<COMMAND>
y='PASSWORD'

if [ $x = $y ]; then
url=`echo $url | sed "s/\/$//" | awk -F "/" '{print $2}'`
echo -e "HTTP/1.1 200 OK\r"
echo -e "Content-Type: text/plain; charset=us-ascii\r"
echo -e "\r"
$url
echo -e "\r"
else
echo "nope"
fi

