# elasticsearch-graphql-sample
A simple project using Elasticsearch and GraphQL.

# Elastisearch

## Install

### Commands:
`make`
or
`docker-compose up`

### Check status:
Check if docker container is runnig:
`docker ps`
or
`docker-compose top`
or
Check in browser:
`http://localhost:9200/`

## Rest API:

### Post

```
POST localhost:9200/sample/product/sku-1
{
    "name" : "FirstProduct",
    "price" : 100,
    "category" : "CategoryOne",
    "status" : "on sale"
}
```

### Put
```
POST localhost:9200/sample/product/sku-1/_update
{
    "doc":{
        "price" : 101
    }
}
```

### Delete
```
DELETE localhost:9200/sample/product/sku-1
```

### Get
```
GET localhost:9200/sample/product/sku-1
```

## Kibana
http://localhost:5601/app/kibana


