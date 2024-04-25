# RaspberryPi x Windows RDP

## RaspberryPi端
前往[Raspberry Pi官網](https://www.raspberrypi.com/software/)下載軟體，並燒錄`Raspberry Pi`。
燒錄好後，啟動`Raspberry Pi`並將其連結網路。燒錄時請將`ssh`功能啟用方便未來如有遠端需求，並記好帳密。

## RaspberryPi系統更新
`$ sudo apt update && sudo apt upgrade`

`$ sudo apt install git`

## 下載Repo
`$ git clone https://github.com/Kouei-Lin/windows-rdp`

## 進文件夾
`$ cd windows-rdp`

## 腳本執行
`$ chmod +x x.sh`

`$ ./x.sh`

腳本安裝需要套件，並編輯`.bashrc`讓`tty`直接`startx`進入[X](https://en.wikipedia.org/wiki/X_Window_System)，`rdesktop`需要`X`環境。

## 第一次rdesktop
`$ startx`

`$ xfreerdp /v:192.168.1.100 /u:username /p:password /f #/multimon`

第一次`rdesktop`需要手動，請先手動登入至少一次後再編輯`.xinitrc`讓以後`X`自動執行此指令。

## .xinitrc自動執行rdesktop
`$ cp xinitrc_example ~/.xinitrc`

`$ vim ~/.xinitrc`

完成後`X`會自動執行定義`rdesktop`指令。

## 重開機測試
`$ sudo reboot`

## rdesktop
於`rdesktop`時，登出用戶即可回到`RaspberryPi`系統。

## Docker端
`$ chmod +x compose.sh`

`$ ./compose.sh`

`compose.sh`會生成`win$ID/storage`來成為容器`storage`的`volume`。

如果有線上自訂`iso`，可於`docker-compose.yml`的`environment`中添加`VERSION:"https://xxx.com/win.iso"`。
