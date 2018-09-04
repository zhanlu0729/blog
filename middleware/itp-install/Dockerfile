FROM baseImage:jdk8

#Install fonts
RUN yum -y install fontconfig
COPY fonts/ /usr/share/fonts/chinese/
RUN chmod -R 755 /usr/share/fonts/chinese
COPY fonts.conf /etc/fonts/fonts.conf

#Install Chrome
RUN yum install -y google-chrome-stable --nogpgcheck
RUN yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y
COPY google-chrome /usr/bin/google-chrome

#Install chromedriver
RUN mkdir -p /apply/attach && chmod -R 755 /apply/attach/
COPY chromedriver /apply/selenium/
RUN chmod +x /apply/selenium/chromedriver
