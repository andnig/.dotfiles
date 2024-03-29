# Android

These dotfiles are in general not for Android, but the following settings help
to use notes, scripts and taskwarrior in sync between Android and all the other
devices.

1. Install [Termux](https://termux.com/) and [Termux:API](https://play.google.com/store/apps/details?id=com.termux)
2. Make sure the app has storage permission
3. Run the termux app
4. Install the [syncthing app](https://play.google.com/store/search?q=syncthing)
5. In Syncthing add all the devices to sync. Make sure that the following folders
   are synced:
   - Notes: `/sdcard/notes`
   - Scripts: `/sdcard/scripts`
   - Tasks: `/sdcard/taskwarrior`
6. In termux, create a new folder `~/scripts`
7. Add the scripts you want to sync to the `sync` folder on the "source device".
   Then move the scripts from the `sync` folder to the `~/scripts` folder in termux.
8. Add a ~/.bashrc file to termux. This file should contain the following:

   ```bash
   # Path: ~/.bashrc
   export PATH=$PATH:~/scripts
   alias fo=~/scripts/find_and_open.sh
   ```

9. Copy the files from ./.secrets/ to /sdcard/secrets/.
10. For taskserver, run the following commands

    ```bash
    task config taskd.certificate -- /sdcard/secrets/task.andreas_nigg.cert.pem
    task config taskd.key -- /sdcard/secrets/task.andreas_nigg.key.pem
    task config taskd.ca -- /sdcard/secrets/task.ca.cert.pem
    task config taskd.server -- tasks.devopsandmore.com:53589
    task config taskd.credentials -- devopsandmore/Andreas Nigg/210de195-3cf3-4b91-b18d-e54450048630
    ```

11. Run `task sync init`
