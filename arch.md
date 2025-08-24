# Arch Linux

On arch, we use [Omarchy](https://omarchy.org/) as a base configuration.
It provides a nice, minimal opinionated setup for Arch Linux. However, we
are not going to use it directly, as it's a bit too opinionated, so we
keep it as a git submodule and then only fetch the files we need.

## Tailscale

Use systemctl to enable and start the service:
sudo systemctl enable --now tailscaled

Connect your machine to your Tailscale network and authenticate in your browser:
sudo tailscale up

You can find your Tailscale IPv4 address by running:
tailscale ip -4

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
hyprctl output crate headless sunshine
hyprctl keyword monitor "sunshine,2560x1600@120,auto,1.25"
xrandr -q
# Note down the id (number) of the headless output (probably 1)
```

Set the id in the sunshine -> audio/video settings -> "Display Number"

Then, create and dispatch workspace 10 to the headless output:

```bash
hyprctl dispatch workspace 10
hyprctl dispatch moveworkspacetomonitor 10 sunshine
hyprctl dispatch workspace 10
```

## 1Password

1Password is installed. If there are issues with storing 2FA tokens, try:

```bash
# Check if gnome-keyring is running
systemctl --user status gnome-keyring-daemon.socket
# If not, enable and start it
systemctl --user enable --now gnome-keyring-daemon.socket

# Create a test key (to set up the default keyring)
secret-tool store --label="test" testkey testvalue
# Retrieve the test key
secret-tool lookup testkey testvalue
# Remove the test key
secret-tool clear testkey testvalue
```

Now restart the 1Password app and see if it works.

### Setting up the 1Password Agent

1. Make sure you have an SSH key added to your 1Password account.
2. Open the 1Password app, then select your account or collection at the top of the sidebar and select Settings > Developer.
   Select Set Up SSH Agent, then choose whether or not you want to display SSH key names when you authorize connections.
3. Also selct "Integrate with 1Password CLI"
