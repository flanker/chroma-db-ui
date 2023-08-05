# Chroma DB UI

A simple UI for Chroma database.

Using Ruby with [Sinatra](http://www.sinatrarb.com/) and [Chroma Ruby Client](https://github.com/mariochavez/chroma).

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
