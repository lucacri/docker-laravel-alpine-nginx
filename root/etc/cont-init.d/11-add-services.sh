#!/usr/bin/with-contenv bash

if [ "$ENABLE_WEB" -eq "1" ]; then
   echo "Enabling Web Server";
   cp -Rv /etc/possible-services/nginx /etc/services.d/
   echo "Enabling FPM Server";
   cp -Rv /etc/possible-services/phpfpm /etc/services.d/
fi

if [ "$ENABLE_CRON" -eq "1" ]; then
   echo "Enabling Cron";
   cp -Rv /etc/possible-services/cron /etc/services.d/
fi

if [ "$ENABLE_LOGS" -eq "1" ]; then
   echo "Enabling Logs";
   cp -Rv /etc/possible-services/logs /etc/services.d/
fi

if [ "$ENABLE_HORIZON" -eq "1" ]; then
   echo "Enabling Logs";
   cp -Rv /etc/possible-services/horizon /etc/services.d/
fi


