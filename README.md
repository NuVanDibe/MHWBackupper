# MHW Backupper

#
#### Warning!
##### Do not backup or restore while Monster Hunter World is running! Doing so could corrupt your save! I'm not responsible if something goes wrong!
#
#
#### Another warning!
##### Restoring a save cannot be undone!
#
## TL;DR
Run MHWBackupper.bat and fill in the requested information. At the end, you'll generate another .bat file which is tailored to your Steam profile directory and preferred backup directory. In your backup directory, you'll find a restore.bat file which will restore your MHW save.

## What?

MHW Backupper is a tool for backing up Monster Hunter World saves to a specific folder on your computer. It's windows-only and only runs in the command line, but requires minimal configuration and is designed to be as easy to use as possible

## Why?

Why would I want to backup my save? Lots of reasons. Maybe you need to reformat your computer and you have Steam cloud disabled.. Maybe the game crashes often and you want a backup in case it crashes while saving, corrupting your save.

## How?

Download the latest release and run it. It'll ask you for your SteamID3. This is a unique number associated with every steam account. The .bat file will try to determine what it is, but if it cannot, you can find it on <https://steamidfinder.com/> and the launcher will offer to launch this page for you.

Once you have your SteamID3 put in, it'll ask for the destination directory. This should be typed in using the standard drive:\directory syntax. For example:
``C:\Backups\Monster Hunter World``

Finally, it'll ask you to set an output filename. In order to work properly, it must end in ``.bat`` or ``.cmd``.

This will generate a second .bat file which will back up your Monster Hunter World save file to a directory of your choosing.

## Where?
The output batch file will generate a new backup every time you run it, in the directory you configured when you ran the original file. It does this by creating a timestamped folder in the target directory which looks something like this:

``C:\Backups\Monster Hunter World\2018-08-20 13.53.08``

This example backup was made on August 20, 2018 at 1:53:08 PM.

In this directory will be a .bat file called "restore.bat". Run this file to restore the backup from this directory.

## Legalese

I am not responsible for lost saves, damage to computers, or loss of employment due to staying home to play video games that result from the use of this program. May the sapphire star light your way. Or scoutflies.