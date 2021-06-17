# OS(neon-user-20210614-1203.iso) Instsll

```
cat /proc/version
Linux version 5.4.0-74-generic (buildd@lgw01-amd64-038) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #83-Ubuntu SMP Sat May 8 02:35:39 UTC 2021

```

sudo apt-get update -y && sudo apt-get upgrade -y  && sudo apt-get install -y onedrive
sudo apt-get install autojump -y && echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc && source ~/.bashrc
sudo apt-get install git -y && sudo apt-get install git bash-completion -y

## vscode
```
https://code.visualstudio.com/docs/setup/linux
sudo snap install --classic code # or code-insiders

cloud sync
gist: 304559f0bc5013355bac505b4ec06b1f
```

## smerg
https://www.sublimemerge.com/docs/linux_repositories
## sublime
https://www.sublimetext.com/docs/linux_repositories.html

# CCS &SDK Instsll
sudo dpkg --add-architecture i386 && sudo apt-get install libc6-i386 libusb-0.1-4 libgconf-2-4 libgtk2.0-0 libncurses5 libpython2.7 libtinfo5 build-essential mono-complete -y

```
tar xvf CCS10.3.1.00003_linux-x64.tar.gz
cd CCS10.3.1.00003_linux-x64
cat README_FIRST_linux
./ccs_setup_10.3.1.00003.run
```

```
./mmwave_sdk_03_05_00_04-Linux-x86-Install.bin 

┌──(opo2000tw㉿DESKTOP-03CNEHA)-[~/Desktop/Desk/New]
└─$                                                                                                                                                                                           
----------------------------------------------------------------------------
Select the components you want to install; clear the components you do not want 
to install. Click Next when you are ready to continue.

mmWave SDK and tools [Y/n] :y

mmWave SDK and tools - mmWave SDK 03.05.00.04 [Y/n] :n

mmWave SDK and tools - SYS/BIOS 6.73.01.01 [Y/n] :y

mmWave SDK and tools - TI CGT C6000 8.3.3 [Y/n] :y

mmWave SDK and tools - TI CGT ARM 16.9.6 [Y/n] :y

mmWave SDK and tools - DSPLIB C64Px 3.4.0.0 [Y/n] :y

mmWave SDK and tools - DSPLIB C674x 3.4.0.0 [Y/n] :y

mmWave SDK and tools - MATHLIB C674x 3.1.2.1 [Y/n] :y

mmWave SDK and tools - XDCtools 3.50.08.24 [Y/n] :y

Is the selection above correct? [Y/n]: y
./
----------------------------------------------------------------------------
Review Installation Decisions
```

# Shell
```
echo $SHELL
cat /etc/shells
grep kali /etc/passwd
chsh -s /usr/bin/bash
```

Known Issue 

1. In every VM ccs1031 and xds110 is not stable so testTarget by *.xxml will be fail but you can use command "xdsdfu -e" to test connection

-------------

# XDS110
sudo ln -s ~/ti/ccs1031/ccs/ccs_base/common/uscif/xds110/xdsdfu /usr/bin/xdsdfu

# Driver
sudo /home/blake/ti/ccs1031/ccs/install_scripts/install_drivers.sh

# Makefile Setting 
/home/blake/ti/mmwave_sdk_03_05_00_04/setting.sh
source /mnt/c/ti/mmwave_sdk_03_05_00_04/packages/scripts/unix/setenv.sh
source /mnt/c/ti/mmwave_sdk_03_05_00_04/packages/scripts/unix/checkenv.sh
