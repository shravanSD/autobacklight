# autobacklight
Turns on backlight at a given time range automatically. Works on Linux only.

## Help

```
1.	SET BACKLIGHT TO ON (minimum) @ 18:00 (PC Time)
2.	SET BACKLIGHT TO ON (maximum) @ 20:00 (PC Time)
3.	SET BACKLIGHT TO OFF @ 06 00 (PC Time)
4.	SET VALUE=1 for 50%; SET VALUE=100 for 100%.
5.	TIME_ON_min: The time in 24H with no ':' to set backlight ON to the minimum
6.	TIME_ON_max: The time in 24H with no ':' to set backlight ON to the maximum
7.	TIME_OFF: The time in 24H with no ':' to set backlight OFF
```

## CRON

```bash
vim /etc/cron.d/autobacklight

0 */1 * * * root /<path>/<of>/<script>.sh