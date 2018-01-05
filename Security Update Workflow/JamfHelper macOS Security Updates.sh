#!/bin/bash

JAMFHELPER="/Library/Application Support/JAMF/bin/jamfhelper.app/Contents/MacOS/jamfHelper"


#Get User's Selection
RESULT=`"$JAMFHELPER" -windowType hud -windowPosition center -title "macOS Security Update" -heading "macOS Security Update" -alignHeading center -description "This update will install important security updates required for your computer to be within compliance.  Please save all work, then click Update below to proceed. " -alignDescription center -icon /PATH/TO/LOGOFILE.PNG -button1 "Update Now" -button2 "Run Later"`
if [ $RESULT == 0 ]; then
    # do button1 stuff
    sudo jamf policy -event macosupdates
    sudo jamf recon
elif [ $RESULT == 2 ]; then
    # do button2 stuff
    echo "Cancel was pressed!"
fi