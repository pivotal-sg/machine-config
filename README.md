# Pivotal SG pairing machine configuration

The configuration files that come with a new machine image. Together with
instructions for how to create a new base image together with our other
configs.

## How to get going from a restored base image

1. Open `Terminal`
  ```shell
  sudo -s "echo '/user/loca/bin/zsh' >> /etc/shells"
  cd ~workspace/machine-config
  git pull
  ./setup.sh
  ```

This will:
  - Allow you to use zsh as the shell
  - Ask you to name this machine (there should be a sticker on the machine
    telling you it's name)
  - Clone [thoughtbot/laptop] and run the laptop script
  - Use [rcm] to install our config files
  - Run the laptop script again so our local laptop configuration gets run

After this you'll have to manually configure some apps.

### Configuring iTerm2

iTerm2 will be installed by the laptop script. After installation configure it by:

1. Open iTerm2
1. Open `Preferences`
1. Select `Load preferences from a custom folder or URL`
1. Select the `~/workspace/machine-config/manual-config/iTerm2` folder
  - Click on `Don't copy` in the dialog asking whether you want to overwrite
    the saved config.

### Configure Alfred

1. Open Alfred
  - Select `Launch Alfred at login`
  - Click on `Alfred Hotkey`
    - Set hotkey to `Cmd Space`
  - Click on the `Features` tab
    - Click on `System`
      - Select `Eject`

### Configure Jumpcut

1. Open Jumpcut
  - Click on the `Hotkeys` tab
    - Change `Main Hotkey` to `Cmd+Shift+V`
1. Open System preferences
  - Open `Users & Groups`
  - Select `Pivotal` as the current user
  - Click on the `Login Items` tab
  - Click on the `+` button
    - Select `~/Applications/Jumpcut`

### Install virtualenvwrapper

Virtualenvwrapper, for Python development, is annoying to get installed. The
easiest way I've found is to just get it onto the base system installation and
then use it from there.

1. `sudo easy_install virtualenvwrapper`
