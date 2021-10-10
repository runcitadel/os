[![Version](https://img.shields.io/github/v/release/rubcitadel/dashboard?color=%235351FB&label=version)](https://github.com/runcitadel/dashboard/releases)
[![Docker Build](https://img.shields.io/github/workflow/status/runcitadel/umbrel-dashboard/Docker%20build%20on%20push?color=%235351FB)](https://github.com/runcitadel/dashboard/actions?query=workflow%3A"Docker+build+on+push")
[![Docker Pulls](https://img.shields.io/docker/pulls/runcitadel/dashboard?color=%235351FB)](https://hub.docker.com/repository/registry-1.docker.io/runcitadel/dashboard/tags?page=1)
[![Discord Server](https://img.shields.io/badge/Community%20Chat-Discord-%235351FB)](https://discord.gg/6U3kM2cjdB)
[![Twitter](https://img.shields.io/twitter/follow/runcitadel?style=social)](https://twitter.com/runcitadel)


# Citadel OS Tweaks - Base image

Citadel OS is the operating system of Umbrel Bitcoin and Lightning node. It's based on Raspberry Pi OS (formerly Raspbian) and uses [pi-gen](https://github.com/RPi-Distro/pi-gen) for customization.

This is a modified image that contains the full commit history of pi-gen, and doesn't contain merge and empty commits from Umbrel OS.
In addition, it contains a few optimizations that aren't in Umbrel OS yet.

## ⚠️ Outdated information

The information below might be outdated and / or refering to Umbrel. This project is not yet fully off it's Umbrel roots.


## 🚀 Getting started

To run Citadel on:

- Raspberry Pi 4 (recommended) 
- Any other hardware

### Instructions:

1. Make sure you've everything ready:
    1. [Raspberry Pi 4 with 4GB or 8GB RAM](https://www.amazon.com/gp/product/B08C4SK5C3/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B08C4SK5C3&linkCode=as2&tag=umbrel08-20&linkId=d3f17fd4813568c4863d239839311d67)
    2. [1TB SSD](https://www.amazon.com/gp/product/B077SF8KMG/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B077SF8KMG&linkId=5fa12eae55f9ecaed22984bdb9ebb546)
    3. [SSD Enclosure](https://www.amazon.com/gp/product/B01LY97QE8/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B01LY97QE8&linkId=c73e0df3b8ebd4e5a03f37b7e3b371b3)
    4. [16GB+ microSD Card](https://www.amazon.com/gp/product/B07B98GXQT/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07B98GXQT&linkId=e72147bff5eef2a86d9d74300af70180)
    5. [microSD Card Reader](https://www.amazon.com/gp/product/B07G5JV2B5/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07G5JV2B5&linkId=474cdf41a783f4ea511b9affa05f33d8)
    6. [Ethernet Cable](https://www.amazon.com/gp/product/B07ZTR9K9Z/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07ZTR9K9Z&linkId=41269d57d8fbc8dfaf312893e689f5be)
    7. [Case](https://www.amazon.com/gp/product/B07WG4DW52/ref=as_li_tl?ie=UTF8&tag=umbrel08-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07WG4DW52&linkId=738df0605882b2422080f18d8a74e669)

2. Download the [latest release of Umbrel OS](https://github.com/getumbrel/umbrel-os/releases/latest), or [build the image from source](#-build-umbrel-os-from-source).
3. Use an image flasher such as [Balena Etcher](https://github.com/balena-io/etcher) to flash the image to a microSD card.
4. Put the microSD card in your Raspberry Pi, attach an external SSD or HDD (to USB 3 port), connect the Pi to your router with an ethernet cable.
5. Turn on the Pi and open http://umbrel.local from any device connected to the same network (it might take a while for it to be accessible).

**⚠️ All data on the external hard drive will be erased on first boot.**

> If you're running Umbrel OS on Bitcoin mainnet (default), the external SSD or HDD should be at least 750 GB in size (we recommend 1 TB+) so it can store the whole Bitcoin blockchain.

## 💻 SSH

SSH is enabled by default and you can use the following credentials to login to your Umbrel node.

- Hostname: `umbrel.local`  
- User: `umbrel`  
- Password: The same password you use to log in to the Umbrel dashboard
 
> If you haven't yet run through the setup process, the password will be set to `moneyprintergobrrr`.

## 🛠 Build Umbrel OS from source

> Don't trust. Verify.

Step 1. Clone this repo
```
git clone https://github.com/UmbrelOS-Tweaks/base.git
```

Step 2. Switch to repo's directory
```
cd base
```

Step 3. BUIDL!
```
sudo ./build.sh
```

After the build completes (it can take a looooooong time), the image will be inside `deploy/` directory.

## 🔧 Advanced

**Config variables**

The `config` file has system defaults which are used when building the image and for automated builds.

- `CITADEL_VERSION` - To install the specific [Umbrel](https://github.com/getumbrel/umbrel) version.

- `GITHUB_USERNAME` - To automatically login to your node without typing a password.

- `CITADEL_REPO` - A custom git repo used to download Citadek. `CITADEL_VERSION` is ignored if this is set, but it is required to also set `CITADEL_BRANCH`.

- `CITADEL_BRANCH` - The git branch or commit SHA in the custom repo that should be checked out.

Other Raspbian-related stuff can be found in [Raspbian's documentation](https://github.com/RPi-Distro/pi-gen/blob/master/README.md) which is still applicable.

---

### ⚡️ Don't be too reckless

> Citadel is still in an early stage and things are expected to break every now and then. We **DO NOT** recommend running it on mainnet with real money just yet, unless you want to be really *#reckless*.

## ❤️ Contributing

We welcome and appreciate new contributions!


---

_"Being open source means anyone can independently review the code. If it was closed source, nobody could verify the security. I think it's essential for a program of this nature to be open source." — Satoshi Nakamoto_


## 📜 License

### ⚠️ This information is refering Citadel's Umbrel basis, it is migrating off Umbrel to AGPL.

Umbrel (and Umbrel Dashboard) is licensed under the PolyForm Noncommercial 1.0.0 license. [...]
