# inso-cli

Insomnia "inso" CLI in a container

## What for

To use it while "inso" isn't available for M1 Macs.

## Build

```sh
docker build --platform linux/amd64 -t andrevtg/inso .
```

## How to use

Use the provided helper script:

```sh
./inso.sh --help
```
