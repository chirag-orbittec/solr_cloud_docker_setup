sudo docker network create --subnet 10.89.89.0/24 solrnet1

sudo docker run --name zookeeper --net solrnet1 --ip 10.89.89.10 -d -p 2181:2181 -p 2888:28888 -p 3888:3888 jplock/zookeeper

sudo docker run --name solr1 --net solrnet1 --ip 10.89.89.11 -p 9983:8983 -d solr solr-foreground -f -z 10.89.89.10:2181

sudo docker run --name solr2 --net solrnet1 --ip 10.89.89.12 -p 9984:8983 -d solr solr-foreground -f -z 10.89.89.10:2181


sleep 10


sudo docker exec  -it solr1 /opt/solr/bin/solr create_collection -c raw_data -shards 2 -p 8983



