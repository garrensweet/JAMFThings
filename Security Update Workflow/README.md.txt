# Setup Security Updates Notification / Installation

## Table of Contents

<!-- MarkdownTOC autolink=true depth=4 bracket=round -->

- [The Problem](#the-problem)
- [The Solution](#the-solution)
- [The Configuration](#the-configuration)

<!-- /MarkdownTOC -->

---

## The Problem

__Users are notorious for not applying important updates when they are needed most__


## The Solution

__Using this workflow we will tell JAMF Pro to check for security updates, deploy a popup if found, and download/install updates if necessary.__

This workflow includes the following:
	- __Extension Attribute__
	- __Smart Group based on EA__
	- __2 Policies: 1 that prompts user to install updates and another that installs updates__

### The Configuration


- Extension Attribute
    - Go to https://jss_url/computerExtensionAttributes.html
    - Click Upload and upload the xml file in this Repo.
    - Leave all settings default and hit Save.

- Smart Group
    - Create a Smart Group that looks like below
    https://github.com/zacharysfisher/JAMFThings/blob/master/Security%20Update%20Workflow/SecurityUpdateScreenshot.png

- Add a Script
	- The script in this Repo to JAMF Pro by going to https://jss_url/scripts.html
	- Under the options tab, be sure to select After
	- Edit the path of the logo file to your environment
	
JAMFHelper Policy
	- Create a new Policy called "JAMFHelper Security Update"
	- Check the box for "Recurring Check-in" and set frequency to "Once every day"
	- Click the Script payload and add the script you just added the previous step.
	- Under the Scope tab, scope the policy to the Smart Group you created.
	
Security Update Policy
	- Create another Policy called "Security Updates"
	- Check "Custom" and enter in "macosupdates" for custom event.
	- Set Frequency to Ongoing
	- Add a "Software Updates" payload and make sure "Each computer's default software update server" is selected.
	- Add a Maintenance payload and check "Update Inventory"
	- For the scope, add "All Computers"
	- Make sure the "Restart Options" payload is enabled.  Leave all settings default.
	
	
