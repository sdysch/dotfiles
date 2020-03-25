## List of installation instructions that I found useful
* https://www.youtube.com/watch?v=rnZm3g_rbwM&list=WL&index=4&t=0s
* i3 gaps: https://gist.github.com/dabroder/813a941218bdb164fb4c178d464d5c23
* i3status: https://i3wm.org/i3status/manpage.html

## Installation instructions
* Get i3 wm `sudo apt-get -y install i3-wm nitrogen`
* Open window manager and remove all keyboard shortcuts (can conflict with i3)
* Open keyboard and remove all shortcuts that have super+<key>
* Open session and startup.
	* Change xfdesktop restart style to never
	* Change xfwm restart style to never
	* Save session
* Add application autostart
	* Name i3wm
	* Description Tiling Window Manager
	* Command i3
* Reboot
