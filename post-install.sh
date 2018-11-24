# bounce sabnzbd once to bootstrap /usr/local/sabnzbd
service sabnzbd onestart;
sleep 5;
service sabnzbd onestop;
sleep 5;

# update configuration to listen on all interfaces
sed -i '' "s/^host = 127.0.0.1/host = 0.0.0.0/g" /usr/local/sabnzbd/sabnzbd.ini;

# really enable sabnzbd
sysrc sabnzbd_enable=YES;

# really start sabnzbd
service sabnzbd start;
