# FFB-Script
( Fast file backup script )

Script was orginally used for a rubber ducky

I've taken a malicious file exfiltration script designed for Windows and transformed it into a highly effective tool for securely backing up data to a USB device or an different/external hard drive, 
though it still retains the potential to be used as a more sinister file exfiltrator.

# NOTE: Please read.
```md
- This script is readily customizable. Please review the documentation first: https://adamtheautomator.com/robocopy/

- The orginal script used xcopy to transfer files, I had chosen to use robocopy instead because of its multi-threading capabilities.

- I would not recommend using this for comprehensive system backups,
  as dealing with a large number of files increases the likelihood of encountering corrupted copies.
  This happens because it copies 32 files at the same time. You do have the option to
  customize the number of files being copied to mitigate this.

- The script is designed with the assumption that the User folders
  you want copied are located on the C: drive. To adjust it for a different drive
  where your target files are stored, simply replace the drive letter in the script as needed.

- If you encounter issues running the script, you might need to adjust
  the PowerShell execution policy on the target computer to allow script execution.
   You can do this using the Set-ExecutionPolicy cmdlet in PowerShell.

- Ensure that you have the necessary permissions to execute scripts on the target computer
  and access the specified directories and files. Depending on the security settings of the computer,
  you may need administrative privileges.

# Im not responible for any damage done to your devices, use this script at your discretion, you have been warned.
```
# How to use
Simply, put the ffb.bat file onto an external hard drive and execute the script from there.

- You can monitor the script's progress in real-time.
- To halt the copying process, exit the terminal.
- The script also maintains detailed logs for your convenience.
- It stores all PC files in a folder named 'robocopy.' Unnecessary files have already been excluded from the copying process, but you can easily customize the script to behave differently.
- This script is set to transfer 32 files at a time. The speed of file transfers depends on your hard drive or SSD. For instance, copying 32GB of files from an SSD may take atleast a minute. whereas the same operation on an HDD could take anywhere from 10 to 20 minutes.
- This also saves your network information, if connected.

# Script is a WIP
