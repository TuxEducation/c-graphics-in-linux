#
# C graphics.h installation file.
# Please Do Not Modify This File.
# Author : Vishal Nagda (Team ATOM)
# Version 0.1
#!/bin/bash
#
function netchk {
sudo wget -q --spider http://google.com

if [ $? -ne 0 ]; then
    echo -e "\n\n\tPlease Check Your Internet Connection Then Try Again...\n\n"
    exit
fi
}
scgp()
{
     local file="circle_eg.c"
     if [ ! -f "$file" ] ; then
         touch "$file"
     fi
     user_input="#include<graphics.h>\nint main()\n{\nint gd = DETECT, gm = 0;\ninitgraph(&gd,&gm,\"\");\ncircle(300,300,150);\ngetch();\nclosegraph();\nreturn 0;\n}"
     echo -e "$user_input" > "$file"
     return
}
fchkd()
{
     local file="libgraph-1.0.2.tar.gz"
     if [ ! -f "$file" ] ; then
         sudo wget -c -q --tries=10 --timeout=60 --show-progress "http://download.savannah.gnu.org/releases-redirect/libgraph/libgraph-1.0.2.tar.gz"
     fi
     return
}
fchk()
{
     local file="libgraph-1.0.2.tar.gz"
     if [ ! -f "$file" ] ; then
         clear
         echo -e "\n\n\tSorry Required File '$file' Is Not Available Or Unable To Download...\n\n\tPlease Try The Link Given Below To Download The Required File And Then Try Again...\n\n\thttp://download.savannah.gnu.org/releases-redirect/libgraph/libgraph-1.0.2.tar.gz\n\n"
         exit
     fi
     return
}
clear
netchk
sudo dpkg --add-architecture i386
sudo apt-get update && apt-get -y dist-upgrade
netchk
sudo apt-get -y install build-essential libsdl-image1.2 libsdl-image1.2-dev guile-1.8 guile-1.8-dev libart-2.0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libxext-dev x11proto-xext-dev libfreetype6 libfreetype6-dev libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev
fchkd
fchk
sudo tar xvzf libgraph-1.0.2.tar.gz
cd libgraph-1.0.2/
./configure
sudo make
sudo make install
sudo cp /usr/local/lib/libgraph.* /usr/lib
cd ..
echo -e "\n\n\tPress Any Key To Verify Whether It's Working Or Not !!!"
read
scgp
gcc circle_eg.c -lgraph -o circle_eg.out
./circle_eg.out
if [ $? == 0 ]; then
echo -e "\n\n\tInstallation Done !!!\n\n"
else 
echo -e "\n\n\tInstallation Falied!!!\n\n"
fi
rm -r libgraph-1.0.2 circle_eg.*
exit
