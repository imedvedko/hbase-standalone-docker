# Run HBase
    docker run -i -t --rm \
               --name hbase \
               imedvedko/hbase-standalone
# Open HBase Shell
    docker exec -i -t hbase hbase shell
