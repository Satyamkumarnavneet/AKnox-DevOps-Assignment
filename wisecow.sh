#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
	read line
	echo $line
}

handleRequest() {
    # 1) Process the request
	get_api
	mod=`/usr/games/fortune`

cat <<EOF > $RSPFILE
HTTP/1.1 200


<pre>`/usr/games/cowsay $mod`</pre>
EOF
}

prerequisites() {
    echo "Checking for cowsay and fortune..."
    if command -v cowsay >/dev/null 2>&1; then
        echo "cowsay found"
    else
        echo "cowsay not found"
    fi

    if command -v fortune >/dev/null 2>&1; then
        echo "fortune found"
    else
        echo "fortune not found"
    fi

	command -v /usr/games/cowsay >/dev/null 2>&1 && \
	command -v /usr/games/fortune >/dev/null 2>&1 || \
	{ 
		echo "Install prerequisites."
		exit 1
	}
}

main() {
	prerequisites
	echo "Wisdom served on port=$SRVPORT..."

	while [ 1 ]; do
		cat $RSPFILE | nc -lN $SRVPORT | handleRequest
		sleep 0.01
	done
}

main
