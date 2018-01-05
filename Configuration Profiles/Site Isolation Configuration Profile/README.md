# Setup Configuration Profile to enalbe Site Isolation for Chrome

## Table of Contents

<!-- MarkdownTOC autolink=true depth=4 bracket=round -->

- [The Problem](#the-problem)
- [The Solution](#the-solution)
    - [Step One: Configuration Profile](#step-one-configuration-profile)
    - [Step Two: Smart Group](#step-two-smart-group)
    - [Step Three: Script](#step-three-script)
    - [Step Four: Policy](#step-four-policy)
    - [Follow Through](#follow-through)

<!-- /MarkdownTOC -->

---

## The Problem

__Because of recent vulnerabilities found in Intel Chips (Meltdown/Spectre), this makes our computers at risk.  
Apple has said that 10.13.2, 10.12.6, 10.11.6 all have had a Security Update on Dec. 6 that addresses some of these issues.
Further patches are expected.  To protect website data/browsing we need to enable Site Isolation Feature in Chrome__


## The Solution

__You can use a configuration profile to enable this Chrome Policy that will enable Site Isolation__

A configuration profile ensures that all keep the setting enforced even if user tries to adjust setting.


### Configuration Profile

__A configuration profile called “Redirect FileVault keys to JSS” does what the name says.__

- General
    - Name: __Site Per Process Setting__
    - Distribution Method: __Install Automatically__
    - Level: __Computer Level__
- Custom Settings
    - __Upload the plist in this repo to the Custom Settings__
- Scope
    - __All computers__


Once you hit save, the Configuration will push out to all computers.
If a computer does not recieve it or errors out trying typing the following two commands to fix the issue:
```sudo jamf removeMDMProfile```
```sudo jamf mdm```
