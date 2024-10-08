# Installation
[](){#installation-index .jump-top}

getML is a software suite for automated feature engineering on relational data and time series. It enables you to complete your data science projects in a fraction of their usual time and with better results.

getML is available for Python 3.8 to 3.12 and supported on the following 64-bit systems and architectures:

- Linux (amd64/arm) with glibc 2.28 or above (also via docker)
- macOS (amd64/arm) via docker
- Windows (amd64/arm) via docker

The [getML Suite][getml-suite] is comprised of [Python API][python-api-concepts], [Engine][engine-concepts] and [Monitor][monitor-concepts]. The Monitor is shipped along with the Engine.

Both our [Community](https://github.com/getml/getml-community) and [Enterprise][enterprise-benefits] editions use the same Python API.


## Linux

Use Python's `pip` package manager to install both the [Python API][python-api-concepts] and the [Engine][engine-install] on Linux natively.

[Read the Linux install guide](packages/linux.md){ .md-button .md-button--primary }

## macOS, Windows & Linux

Setup a Docker container to run the [Engine][engine-install]. Install the [Python API][python-api-concepts] with `pip`.

[Read the Docker install guide](packages/docker.md){ .md-button .md-button--primary }


## From source

Install the Python API from source.

[Read the API install guide](source/python-api.md){ .md-button .md-button--primary }

Build Engine and the API from source.

[Read the Engine & API build guide](source/build.md){ .md-button .md-button--primary }



## Using versioned archives

In some scenarios, installing getML from an archive might be necessary.

[Read the archive install guide](packages/package.md){ .md-button .md-button--primary }