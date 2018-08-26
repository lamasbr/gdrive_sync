# Google Drive sync tool (push/pull)

Push or pull directory/files to your Google Drive account using this docker image

This image use Google Drive client for command line called drive (https://github.com/odeke-em/drive)

## Usage

### Starting
First, you need start the container using the command:

Without share or volumes: `docker run -ti --name <container_name> -d lamasbr/gdrive_sync`

Using volumes: `docker run -ti --name <container_name> -v VOLUME_YOU_WANT_TO_USE:/gdrive/volume -d lamasbr/gdrive_sync` 

Using shares: `docker run -ti --name <container_name> -v /path/on/host:/gdrive/share -d lamasbr/gdrive_sync`

You can use multiple volumes or shares in a single command too, ex: `docker run -ti --name <container_name> -v VOLUME_YOU_WANT_TO_USE:/gdrive/volume -v /path/on/host:/gdrive/share -d lamasbr/gdrive_sync`.

### Init the directories

After this, you need to init the directories using the absolute path (you will be prompted to authenticate with your Google Account):

`docker exec -it <container_name> drive init <path you want to share>`

### Pull/Push commands

To pull files from your Google Drive account:

`docker exec -it <container_name> drive pull <path>`

To push files to your Google Drive account:

`docker exec -it <container_name> drive push <path>`

To pull/push without prompt messages:

`docker exec -it <container_name> drive pull -no-prompt -fix-clashes <path>`

`docker exec -it <container_name> drive push -no-prompt -fix-clashes <path>`

To backup your files to Google Drive (without sync), use:

`docker exec -it <container_name> drive push -no-prompt -fix-clashes -no-clobber <path>`