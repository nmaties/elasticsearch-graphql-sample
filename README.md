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
    "categories" : "category-1",
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
Delete one single document
```
DELETE localhost:9200/sample/product/sku-1
```
Delete all documents from an index
```
DELETE localhost:9200/sample
```

### Get
```
GET localhost:9200/sample/product/sku-1
```

## Bulk import
` products-sample.json`
```
{"index":{"_index":"sample","_type":"product","_id":"sku-1"}}
{"name": "FirstProduct", "price": 100, "categories": ["category-1", "status": "instock"}
```
Run command:
```
curl -XPOST 'localhost:9200/sample/_bulk?pretty' -H 'Content-Type: application/json' --data-binary @products-sample.json
```

## Query

Simple query:
```
GET localhost:9200/_search?q=FirstProduct
GET localhost:9200/sample/_search?q=FirstProduct
GET localhost:9200/sample/product/_search?q=FirstProduct
```
Query by fields:
```
GET localhost:9200/sample/product/_search?q=categories:(category-1|category-2) status:instock
```

```
POST localhost:9200/sample/product/_search
{
    "query":{
        "bool": {
         "must" : [
             {
                 "match" : {
                     "categories" : "category-1"
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
POST localhost:9200/sample/product/_search
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


