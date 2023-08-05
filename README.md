# Chroma DB UI

A simple UI for Chroma database.

Using Ruby with [Sinatra](http://www.sinatrarb.com/) and [Chroma Ruby Client](https://github.com/mariochavez/chroma).

![screely-1691256080299-min](https://github.com/flanker/chroma-db-ui/assets/109811/892f1795-bfa3-4e62-930c-be97abe6942a)

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
