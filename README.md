# uberspaceScripts

## Features

- Create new domain, symlink and project folder with just one command
- Simple Backup script to zip home folder

## Installation

### Backup

- Setup passwordless shh connection for your external server or remove the lines near `## Send File to external server`
- Edit `USER`, `IP_TO_SERVER` and `PATH_TO_FOLDER` variables to your needs
- Optional: Edit `SLACK_TOKEN` and `SLACK_DOMAIN` to get a [Slack Notification](http://slack.com)

### create, delete Project

- Call script `sh ~/uberspaceScripts/bin/createProject.sh DOMAIN`

### create Laravel Project

- Call `sh ~/uberspaceScripts/bin/createLaravelProject.sh DOMAIN` or
- call `sh ~/uberspaceScripts/bin/createLaravelProject.sh DOMAIN GIT-REPO-URL` to clone your project directly into project folder