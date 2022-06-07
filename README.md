# dwoker

## Introduction

This is a docker image made for the purpose to create a ready to go development and analysis environment on any machine/server.
It is ephemeral, so the data can be lost but if you mount a volume on this. You will be able to access the data inside the container.

## Usage

Start the container
`docker run -d --name my-dworker akashdeepnandi/dworker`

This will make the container keep running in the background.

Now you can attach a shell on this container.
`docker exec -it my-dworker zsh`

You can stop running the container using
`docker rm my-dworker`

And start it again using
`docker start my-dworker`

## Notes

For using the nvim, and its LSP features. You will need to install node. There is a script which can help guide on how to do that.

## ROADMAP

- [ ] Fix the node installation issue
- [ ] Refactor structure and code for cleanup
- [ ] Make it extensible, so that it can serve as the base image for specialiazed dockers (go, elixir etc).
