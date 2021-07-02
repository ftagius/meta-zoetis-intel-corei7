#!/bin/sh
#
# Display system information information
#

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

if [ -f /opt/system/sysinfo.env ]; then
  cat /opt/system/sysinfo.env
fi

if [ -f /apps/threshold/threshold-algorithm/appinfo.env ]; then
  cat /apps/threshold/threshold-algorithm/appinfo.env
fi

if [ -f /configuration/setup/config.env ]; then
  . /configuration/setup/config.env
fi

HOSTNAME=$('hostname')
UPTIME_MIN=$(echo "scale=0; $(cat /proc/uptime | awk '{print $1}')" / 60 | bc)
TEMPERATURE=$(echo "scale=0; $(sort -nr /sys/class/thermal/thermal_zone0/temp | head -n1) / 1000" | bc)
FREQUENCY=$(echo "scale=0; $(sort -nr /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq | head -n1) / 1000" | bc)
ETH0_MAC=$(cat /sys/class/net/eth0/address)
ETH0_IP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4 }' | cut -d/ -f1)
if [ -z ${ETH0_IP} ]; then ETH0_IP=0.0.0.0; fi
# output env variables
echo HOSTNAME=\"${HOSTNAME}\"
echo UPTIME_MIN=\"${UPTIME_MIN}\"
echo CPU_TEMPERATURE_C=\"${TEMPERATURE}\"
echo CPU_FREQUENCY_MHZ=\"${FREQUENCY}\"
echo ETH0_MAC=\"${ETH0_MAC}\"
echo ETH0_IP=\"${ETH0_IP}\"
