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
- conflict-strategy: highly recommend using the `skip` strategy. Only using the `replace` strategy when needed.
- skip-pr: highly recommend using value `true`, cause  of when value is `false` that will create commit on base-branch (default: master).
- group: run gitter on multiple repo on group, example: `l1/game-services`, `l1/vg2/game-services`.
- Token: using Gitlab persional access token having `api` permission.

## Run Gitter
```sh
	multi-gitter run "bash $PWD/{script}" --config="./config.yml"
```
- Example: multi-gitter run "bash $PWD/package-update.sh" --config="./config.yml"
## Example scripts
- package-update.sh : upgrade sc-game-base
- db-connnection-update.sh: update database connection string

## NOTE
- There are some service created for testing multi-gitter, let's take some practice to avoid mistakes.
	https://git3.nexdev.net/l1/gitter/keno-power-service
	https://git3.nexdev.net/l1/gitter/mini-sedie-service
	https://git3.nexdev.net/l1/game-services/sedie-service

## Reference
https://github.com/lindell/multi-gitter

