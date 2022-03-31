## Introduce
**multi-gitter** allows you to make changes in multiple repositories simultaneously.

## Installation
- Using Git Bash run following cmd:
```sh
	go install github.com/lindell/multi-gitter@latest
```

## Config (config.yml)
- Token: using Gitlab persional access token having `api` permission.

## Run Gitter
```sh
	multi-gitter run "bash $PWD/{script}" --config="./config.yml"
```

## Example scripts
- package-update.sh : upgrade sc-game-base
- db-connnection-update: update database connection string

## Reference
https://github.com/lindell/multi-gitter

