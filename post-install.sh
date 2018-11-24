# enable sabnzbd at boot
sysrc sabnzbd_enable=YES;

# bounce sabnzbd to bootstrap /usr/local/sabnzbd
service sabnzbd onestart;
sleep 5;
service sabnzbd onestop;
sleep 5;

# listen on all interfaces, not just localhost
sed -i '' "s/^host = 127.0.0.1/host = 0.0.0.0/g" /usr/local/sabnzbd/sabnzbd.ini;

# really start sabnzbd
service sabnzbd start;
