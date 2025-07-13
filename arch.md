# Arch Linux

On arch, we use [Omarchy](https://omarchy.org/) as a base configuration.
It provides a nice, minimal opinionated setup for Arch Linux. However, we
are not going to use it directly, as it's a bit too opinionated, so we
keep it as a git submodule and then only fetch the files we need.

## "Windows Hello" like face recognition auth

Use howdy for that.

```bash
yay -S --noconfirm howdy-git
```

Add the following to `/etc/pam.d/system-auth` on top:

```
auth sufficient pam_howdy.so
auth sufficient pam_unix.so try_first_pass likeauth nullok
```

This will allow to use your camera for all authentication mechanisms (login,
sudo, ...)

Use `v4l2-ctl --list-devices` to list all cameras. Output is something
like this:

```bash
v4l2-ctl --list-devices
Logitech BRIO (usb-0000:2a:00.1-2.2):
        /dev/video0
        /dev/video1
        /dev/video2
        /dev/video3
        /dev/media0
```

Next you need to find, which is the infrared camera. Use `mpv /dev/video0`, ...
This will open a camera feed. Remember the black and white one.

Next and finally, we need to configure `howdy`:

```bash
sudo howdy config
```

Find these entries and change them as follows:

```conf
certainty = 3.8
device_path = /dev/video2 # Change this to your infrared device
max_height = 640
```

Now we can add our face:

```bash
sudo howdy add
```

And finally, we can test if the face recognition works by running:

```bash
sudo pacman -S xorg-xhost
xhost si:localuser:root
sudo howdy test
```

## Sunshine

Running sunshine is still a bit manual.

```bash
systemctl --user start sunshine
hyprctl output crate headless sunshine
hyprctl keyword monitor "sunshine,2560x1600@120,auto,2"
xrandr -q # Note down the id (number) of the headless output (probably 1)
```

Set the id in the sunshine -> audio/video settings -> "Display Number"

Then, create and dispatch workspace 10 to the headless output:

```bash
hyprctl dispatch workspace 10
hyprctl dispatch moveworkspacetomonitor 10 sunshine
hyprctl dispatch workspace 10
```
