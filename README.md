# Display.AppImage

This repository provides a way to build an
[AppImage](https://appimage.org/) of MNI
[Display](https://www.bic.mni.mcgill.ca/software/Display/Display.html)
from the [minc-toolkit-v2](https://bic-mni.github.io/#containers) container image.

## Usage

```shell
wget ...
chmod +x Display.AppImage
./Display.AppImage brain.mnc surface_81920.obj
```

## Build

Prerequisites:

- make
- Docker or Podman

```shell
make
```