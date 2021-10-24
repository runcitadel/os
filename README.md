[![Version](https://img.shields.io/github/v/release/runcitadel/os?color=%235351FB&label=version)](https://github.com/runcitadel/os/releases)
[![Discord Server](https://img.shields.io/badge/Community%20Chat-Discord-%235351FB)](https://discord.gg/6U3kM2cjdB)
[![Twitter](https://img.shields.io/twitter/follow/runcitadel?style=social)](https://twitter.com/runcitadel)


# Citadel OS - Base image

Citadel OS is the operating system of Umbrel Bitcoin and Lightning node. It's based on Raspberry Pi OS (formerly Raspbian) and uses [pi-gen](https://github.com/RPi-Distro/pi-gen) for customization.


## 🔧 Advanced

**Config variables**

The `config` file has system defaults which are used when building the image and for automated builds.

- `CITADEL_VERSION` - To install the specific [Citadel](https://github.com/runcitadel/core) version.

- `GITHUB_USERNAME` - To automatically login to your node without typing a password.

- `CITADEL_REPO` - A custom git repo used to download Citadek. `CITADEL_VERSION` is ignored if this is set, but it is required to also set `CITADEL_BRANCH`.

- `CITADEL_BRANCH` - The git branch or commit SHA in the custom repo that should be checked out.

Other pi-gen-related stuff can be found in [pi-gen's documentation](https://github.com/RPi-Distro/pi-gen/blob/master/README.md) which is still applicable.

---

### ⚡️ Don't be too reckless

> Citadel is still in an early stage and things are expected to break every now and then. We **DO NOT** recommend running it on mainnet with real money just yet, unless you want to be really *#reckless*.

## 📜 License

Citadel OS is licensed under the GNU Affero General Public License v3.0 or later.

[![License: AGPL-3.0](https://img.shields.io/badge/License-AGPL%203.0-blue.svg)](https://opensource.org/licenses/AGPL-3.0)

It includes code from `umbrel-os` and `pi-gen`, which are

```
Copyright (c) 2015 Raspberry Pi (Trading) Ltd.
Copyright (c) 2020 Umbrel. https://getumbrel.com/
```


---

_"Being open source means anyone can independently review the code. If it was closed source, nobody could verify the security. I think it's essential for a program of this nature to be open source." — Satoshi Nakamoto_

[![License: AGPL-3.0](https://img.shields.io/badge/License-AGPL%203.0-blue.svg)](https://opensource.org/licenses/AGPL-3.0)
