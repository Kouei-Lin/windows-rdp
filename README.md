# RaspberryPi x Windows RDP

## 燒錄RaspberryPi
前往[Raspberry Pi官網](https://www.raspberrypi.com/software/)下載軟體，並燒錄你的`Raspberry Pi`。
燒錄好後，啟動`Raspberry Pi`並將其連結網路。燒錄時請將`ssh`功能啟用，並記好帳密。

## RaspberryPi系統更新
`$ sudo apt update && sudo apt upgrade`

`$ sudo apt install git`

## 下載Repo
`$ git clone https://github.com/Kouei-Lin/windows-rdp`

## 進文件夾
`$ cd windows-rdp`

## 腳本執行
`$ chmod +x x.sh`

`./x.sh`

腳本安裝需要套件，並編輯`.bashrc`讓如果是`tty`會直接`startx`進入[X](https://en.wikipedia.org/wiki/X_Window_System)，`rdesktop`需要`X`環境。

## 第一次rdesktop
`$ rdesktop -f IP:port`

第一次`rdesktop`需要手動，請先手動登入至少一次後再將`rdesktop -f IP:port`放入`.xinitrc`以後`X`會自動執行此指令。

## .xinitrc自動執行rdesktop
`$ cp xinitrc_example ~/.xinitrc`

`$ vim ~/.xinitrc`

## 重開機測試
`$ sudo reboot`

## rdesktop
於`rdesktop`時，登出用戶即可回到`RaspberryPi`系統。
