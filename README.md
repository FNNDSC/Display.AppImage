# Display.AppImage

This repository provides a way to build an
[AppImage](https://appimage.org/) of MNI
[Display](https://www.bic.mni.mcgill.ca/software/Display/Display.html)
from the [minc-toolkit-v2](https://bic-mni.github.io/#containers) container image.

## Usage

```shell
# download
wget https://github.com/FNNDSC/Display.AppImage/releases/download/1.9.18.build2/Display.AppImage
chmod +x Display.AppImage

# print usage
./Display.AppImage -help
```

### Examples

```shell
# Download sample data
wget http://packages.bic.mni.mcgill.ca/mni-models/icbm152/mni_icbm152_lin_minc2.zip
unzip mni_icbm152_lin_minc2.zip
wget https://github.com/aces/CIVET/raw/master/models/icbm/icbm_avg_white_sym_mc_left.obj
wget https://github.com/aces/CIVET/raw/master/models/icbm/icbm_avg_white_sym_mc_right.obj

# run Display
./Display.AppImage icbm_avg_152_t1_tal_lin.mnc icbm_avg_white_sym_mc_{left,right}.obj
```

## Build

Prerequisites:

- make
- Docker or Podman

```shell
make
```
