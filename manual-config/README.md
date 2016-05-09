Put all types of config that has to manually be put in place here.
Together with step by step instructions.

## Install OSX

1. Don't enable location services
1. Don't login to an Apple ID
1. Set the username to "pivotal"
1. Set location to Singapore
1. Don't send diagnostics & usage
1. Name the machine "newmachine"

## Configuring OSX from start

This is about configuring OSX from a completely new base image. The configured
image with all the necessary software has instructions in the main README.

### Install Xcode

To be able to finish any other installation after the base image has been done
we'll need Xcode.

1. Open the App Store
1. Search for Xcode and click `Get` and confirm the installation
1. Login with the office Apple Id (ex: labs-singapore-ops+appleid@pivotal.io)

### Uninstall bundled apps

- iMovie
- Garage Band

### The Dock

Remove all the apps from the dock except the Finder.

### System preferences

#### The Dock

- Select `Automatically hide and show the Dock`

#### Keyboard

1. `Keyboard` tab
  - Select `Use all F1, F2, etc. keys as standard function keys`
  - Pull `Delay Until Repeat` to `Short`
1. `Text` tab
  - Deselect `Correct spelling automatically`
  - Deselect `Use smart quotes and dashes`
1. `Shortcuts` tab
  These changes are done to make the shortcuts in IntelliJ work as far as
  possible.

  - Change Full keyboard access to `All controlls` at the bottom of the screen
  - `Launchpad & Dock` tab
    - Deselect `Turn dock hiding On/Off`
  - `Mission control` tab
    - Deselect all shortcuts
  - `Keyboards` tab
    - Deselect all shortcuts
    - Select `Move focus to next window`
    - Select `Move focus to the next window drawer`
  - `Services` tab
    - Deselect anything with a shortcut
  - `Spotlight` tab
    - Deselect all shortcuts
  - `Accessability` tab
    - Deselect all shortcuts

#### Sound

1. `Sound Effects` tab
  - Deselect `Play user interface sound effects`
  - Deselect `Play feedback when volume is changed`
  - Select `Show volume in menu bar`

#### Sharing

- Select `Remote login`

#### Energy Saver

To make long running tasks don't get turned off by the computer since no-one is
moving the mouse, or typing anything on the keyboard, we'll turn off any deep
sleep.

1. Select `Prevent computer from sleeping automatically when the display is
   off`
1. Deselect `Put hard disks to sleep when possible 

## Clone base config but don't install it

1. Open the terminal
1. `mkdir ~/workspace`
1. `git clone https://github.com/pivotal-sg/machine-config.git ~/workspace/machine-config`

## Configure Xcode

1. Open the terminal
1. `xcode-select --install`

## The Finder

- Open the Finder
- Open preferences
- Select `Connected servers`
- `New Finder windows show:`
  - Select `<icon of house> pivotal`

- Create the folder `~/workspace`
- Drag the folder into `Favorites` in the sidebar

## Name the machine newmachine

- Open the Terminal:

  ```shell
  sudo -s
  scutil --set HostName newmachine
  scutil --set ComputerName newmachine
  scutil --set LocalHostName newmachine
  diskutil rename / newmachine
  ```

## Clear all history

1. Clear out what you can from the shell:

  ```shell
  # Spotlight
  mdutil -E
  # History files
  : > ~/.zsh_history
  : > ~/.bash_history
  rm -rf ~/Library/Saved Application State/com.apple.Terminal.savedState
  ```
1. Clear out recent menu items:
  - Apple > Recent Items > Clear Menu
1. Empty trash

## Create the image

After following all the steps above it's time to create the image.

1. Reboot the machine
