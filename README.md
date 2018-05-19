# elasticsearch-graphql-sample
A simple project using Elasticsearch and GraphQL.

# Elastisearch

## Install:

### Commands:
run `make` or `docker-compose up`

### Check status:

#### Check if docker container is running:
run `docker ps` or `docker-compose top`

#### Check in browser:
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

## Bulk import
` products-sample.json`
```
{"index":{"_index":"sample","_type":"products","_id":"sku-1"}}
{"name": "FirstProduct", "price": 100, "category": "CategoryOne", "status": "instock"}
```
Run command:
```
curl -XPOST 'localhost:9200/sample/_bulk?pretty' --data-binary @products-sample.json
```

## Query

Simple query:
```
GET localhost:9200/_search?q=FirstProduct
GET localhost:9200/sample/_search?q=FirstProduct
GET localhost:9200/sample/products/_search?q=FirstProduct
```
Query by fields:
```
GET localhost:9200/sample/products/_search?q=category:(CategoryOne|CategorySecond) status:instock
```

```
POST localhost:9200/sample/products/_search
{
    "query":{
        "bool": {
         "must" : [
             {
                 "match" : {
                     "category" : "CategoryOne"
                 }
             },
             {
                 "match" : {
                     "status" : "instock"
                 }
             },
             {
                 "match" : {
                     "price" : 200
                 }
             }
         ]
        }
    }
}
```
https://www.elastic.co/guide/en/elasticsearch/reference/5.5/query-dsl-query-string-query.html#query-string-syntax

## Aggregations
```
POST localhost:9200/sample/products/_search
{
    "size":0,
    "aggs" : {
        "Popular categories" : {
            "terms" : {
                "field" : "category.keyword"
            }
        }
    }
}
```


## Kibana:
http://localhost:5601/app/kibana


