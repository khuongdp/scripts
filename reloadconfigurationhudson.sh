if [ $1 = 'full' ]; then 
  echo 'full'
  sed -i 's/UpdateWithCleanUpdater/CheckoutUpdater/g' config.xml
elif [ $1 = 'emulate' ]; then
  echo 'emulate'
  sed -i 's/CheckoutUpdater/UpdateWithCleanUpdater/g' config.xml
fi

HUDSON_URL="http://dev02.hudson.asysdev.com:8280/hudson"
USERNAME="kdp"
PASSWORD="1403"

CURL="curl --user $USERNAME:$PASSWORD -s "

`$CURL -o /dev/null "$HUDSON_URL/reload"`	
