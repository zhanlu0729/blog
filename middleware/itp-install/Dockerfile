FROM k8s-registry.banksteel.com/base/jdk8:v1

#Install fonts
RUN yum -y install fontconfig
ADD fonts/ /usr/share/fonts/chinese/
RUN chmod -R 755 /usr/share/fonts/chinese
ADD fonts.conf /etc/fonts/fonts.conf

#Install Chrome
RUN yum install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -y
RUN yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y
ADD google-chrome /usr/bin/google-chrome

#Install chromedriver
ADD chromedriver /apply/selenium/
RUN chmod +x /apply/selenium/chromedriver
