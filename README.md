# windows10-usb-mic-fix
Wrote a batch script to fix the issue with Windows detecting USB microphones on restart. Removes and re-enables USB microphones to force Windows to re-install drivers on restart. Stems from an issue where the driver doesn't initialize properly until you plug it in the port and kick-start the OS device discovery process.

## Making the script run on startup
1. Open File Explorer.
1. Locate the folder with the batch file.
1. Right-click the file and select the Copy option.
1. Use the Windows key + R keyboard shortcut to open the Run command
1. Type the following command:

`shell:startup`
Inline-style:
[](https://www.windowscentral.com/sites/wpcentral.com/files/styles/w830/public/field/image/2020/04/shell-startup-run.jpg?itok=_sfMwqDC)

1. Run shell startup command
1. Click the OK button.
1. Click the Paste option from the "Home" tab in the Startup folder. (Or you can click the Paste shortcut button to create a shortcut to the batch file.)
1. Sign out of the Windows 10 account.
1. Sign back into the account.


