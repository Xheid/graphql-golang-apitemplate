# Graph gophers API template for beginners

Template to build clean API with graph-gophers package using go, graphql and postgresql

## Getting started

This template is for beginners it doesn't manage production environment. The main goal is to provide the simpliest template you can find to make it understandable for new people in golang and/or graphql. [You can find doc and examples on how to use graph-gophers graphql package there.](https://github.com/graph-gophers/graphql-go)

### Install packages

Go to root directory of the template and use this command line to install all packages dependancies you need

```
go get ./...
```

### Docker compose and your database

In your docker-compose file change your database environment (name, user, password) and your volume name then run this command line to build your database :

```
docker-compose up
```

### Rest API

This template is mainly for graphql api. However it is easily usuable for REST API. Now just follow the doc and enjoy :-) ! 

### Ressources 

* Build REST api with [mux](https://github.com/gorilla/mux).
* Build GRAPHQL api with [graph-gophers graphql library](https://github.com/graph-gophers/graphql-go).
