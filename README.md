# docker-mongo-tools
Container for mongo maintenance

```
mongoimport -h mongo --db users --collection contacts --file contacts.json
mongodump --host mongo --archive=full.30.04.2017.gz --gzip
mongorestore --host mongo --archive=full.30.04.2017.gz --gzip
```
