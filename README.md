## Introduce
**multi-gitter** allows you to make changes in multiple repositories simultaneously.

## Use Cases
- Upgrade package dependence (sc-game-base, sc-slot-game-base, ...).
- Update environment config.

## Installation
- Install Go (link: https://go.dev/dl/)
- Using Git Bash run following cmd:
```sh
	go install github.com/lindell/multi-gitter@latest
```

## Config (config.yml)
- Token: using Gitlab persional access token having `api` permission.
- conflict-strategy: highly recommend using the `skip` strategy. Only using the `replace` strategy when needed.

## Run Gitter
```sh
	multi-gitter run "bash $PWD/{script}" --config="./config.yml"
```
- Example: multi-gitter run "bash $PWD/package-update.sh" --config="./config.yml"
## Example scripts
- package-update.sh : upgrade sc-game-base
- db-connnection-update.sh: update database connection string

## Reference
https://github.com/lindell/multi-gitter

