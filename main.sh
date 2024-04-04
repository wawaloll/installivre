sudo apt-get update && sudo apt-get install -y python3 python3-pip nmap masscan apache2 tesseract-ocr imagemagick ffmpeg phantomjs && pip install MySQLdb PIL krbV matplotlib psycopg2 pycurl sqlalchemy tinydb elasticsearch elasticsearch_dsl && sudo apt -y --no-install-recommends install python3-pymongo python3-cryptography python3-bottle python3-openssl apache2 libapache2-mod-wsgi-py3 dokuwiki mongodb && git clone https://github.com/ivre/ivre && cd ivre && python3 setup.py build && sudo python3 setup.py install && cd /var/www/html && rm index.html && ln -s /usr/local/share/ivre/web/static/* . && cd /var/lib/dokuwiki/data/pages && ln -s /usr/local/share/ivre/dokuwiki/doc && cd /var/lib/dokuwiki/data/media && ln -s /usr/local/share/ivre/dokuwiki/media/logo.png && ln -s /usr/local/share/ivre/dokuwiki/media/doc && cd /usr/share/dokuwiki && patch -p0 < /usr/local/share/ivre/patches/dokuwiki/backlinks-20200729.patch && cd /etc/apache2/mods-enabled && for m in rewrite.load wsgi.conf wsgi.load ; do [ -L $m ] || ln -s ../mods-available/$m ; done && cd ../ && echo 'Alias /cgi "/usr/local/share/ivre/web/wsgi/app.wsgi"' > conf-enabled/ivre.conf && echo '<Location /cgi>' >> conf-enabled/ivre.conf && echo 'SetHandler wsgi-script' >> conf-enabled/ivre.conf && echo 'Options +ExecCGI' >> conf-enabled/ivre.conf && echo 'Require all granted' >> conf-enabled/ivre.conf && echo '</Location>' >> conf-enabled/ivre.conf && sed -i 's/^\(\s*\)#Rewrite/\1Rewrite/' /etc/dokuwiki/apache.conf && echo 'WEB_GET_NOTEPAD_PAGES = "localdokuwiki"' >> /etc/ivre.conf && service apache2 reload && cd /var/www/html && yes | ivre ipinfo --init && yes | ivre scancli --init && yes | ivre view --init && yes | ivre flowcli --init && yes | sudo ivre runscansagentdb --init && sudo ivre ipdata --download && clear && echo installation done! && to run a scan with ports, run "sudo ivre runscans --routable --limit [how many hosts you want] --output XMLFork" && echo to import the scans to your website, run "ivre scan2db -c ROUTABLE,ROUTABLE-CAMPAIGN-001 -s Main -r scans/ROUTABLE/up && ivre db2view nmap"
