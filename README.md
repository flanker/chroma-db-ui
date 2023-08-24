# Chroma DB UI

A simple UI for Chroma database.

Using Ruby with [Sinatra](http://www.sinatrarb.com/) and [Chroma Ruby Client](https://github.com/mariochavez/chroma).

![screely-1691280117525-min](https://github.com/flanker/chroma-db-ui/assets/109811/4fe06524-c61a-41cf-95ca-fd51cffb0f95)

## Run it locally

Clone the repo and run the following commands:

```bash
bundle install

ruby app.rb
```

To config the database, you can set the following environment variable:

```bash
export CHROMA_URL=http://localhost:8000
ruby app.rb
```

## Run local Chroma in the docker

A docker-compose file is provided to run Chroma in a docker container.

```bash
docker-compose up chroma
```

Note: You need to wait for the Chroma to be ready before running the UI.
