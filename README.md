# Dockerized go-spacemesh

A dockerized version of go-spacemesh.  The docker build downloads the release and installs it into an Ubuntu container.

Notes:

* This mode of running go-spacemesh is **not officially supported**! (Use only if you know what you're doing.)
* Currently, the dockerized go-spacemesh version **does not auto-update**. This means you must manually update when a new version of go-spacemesh is released (or your node may stop working correctly). 
* This version was only tested with Nvidia GPUs. 

## Building and Updating

* For a first build, 
  
  - run, in the current directory:
    
        cp sample-env .env
  
  - Optionally, Edit the  `SMESH_HOST_DATA_PATH` in `.env`.  This will determine where the node data is stored.

* Edit the `GO_SPACEMESH_VERSION` in `.env` to reflect the [latest go-spacemesh version](https://github.com/spacemeshos/go-spacemesh/releases).

* Run:
  
      docker compose build
  
  This will download the release build from Github and install it in the docker container.

## Running

* Run: 
  
      docker compose up -d
  
  This will start go-spacemesh, storing the data as specified in the `.env` variable `SMESH_HOST_DATA_PATH`. Note that the directory specified will be mapped to `/home/spacemesh/` inside the container.
