# autobacklight
Turns on backlight at a given time range automatically. Works on Linux only.

## Help

This script has been developed to automatically turn on and off the keyboard backlight.

The time in the script is of this format: HHMMSS (24 hours representation).

### Some variables

1.	TIME_ON_min: This is the variable to place the time you want to use the low light for the backlight
2.	TIME_ON_max: This is the variable to place the time you want to use the brightest light for the backlight
3.	TIME_OFF: This is the variable to place the time you want your backlight to switch off.
4.	SET VALUE=1 for 50%. (Tested on Dell 7559)
5.	SET VALUE=100 for 100%.


## CRON

```bash
vim /etc/cron.d/autobacklight
```

Add the following cron to the file /etc/cron.d/autobacklight
```
0 */1 * * * root /<path>/<of>/<script>.sh
```