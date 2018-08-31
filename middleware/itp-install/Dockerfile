FROM k8s-registry.banksteel.com/base/jdk8:v1

#Install fonts
RUN yum -y install fontconfig
COPY fonts/ /usr/share/fonts/chinese/
RUN chmod -R 755 /usr/share/fonts/chinese
COPY fonts.conf /etc/fonts/fonts.conf

#Install Chrome
RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y
COPY google-chrome /usr/bin/google-chrome

#Install chromedriver
COPY chromedriver /apply/selenium/
RUN chmod +x /apply/selenium/chromedriver
