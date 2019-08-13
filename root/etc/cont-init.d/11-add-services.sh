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

if [ "${HORIZON_SPECIFIC_1}" != "" ] && [ "${HORIZON_SPECIFIC_1}" != "0" ]; then
   echo "Enabling Horizon Specific for ${HORIZON_SPECIFIC_1}";
   cp -Rv /etc/possible-services/horizon-specific-1 /etc/services.d/
fi

if [ "${HORIZON_SPECIFIC_2}" != "" ] && [ "${HORIZON_SPECIFIC_2}" != "0" ]; then
   echo "Enabling Horizon Specific for ${HORIZON_SPECIFIC_2}";
   cp -Rv /etc/possible-services/horizon-specific-2 /etc/services.d/
fi

if [ "$ENABLE_WEBSOCKETS" -eq "1" ]; then
   echo "Enabling WebSockets";
   cp -Rv /etc/possible-services/laravel-websockets /etc/services.d/
fi
