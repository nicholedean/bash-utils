#!/bin/sh

databricks_username=$(echo "$DATABRICKS_USERNAME")
databricks_passwd=$(echo "$DATABRICKS_PASSWD")

# Call the API to destroy the cluster
stopCluster="$(curl -X POST -H "Content-Type: application/json" \
-u $databricks_username:$databricks_passwd \
https://seekasia.cloud.databricks.com/api/2.0/clusters/delete \
-d "@default-cluster-stop.json")"

# Put into log for logging purpose
echo $(date) "| stop-cluster | " $(cat default-cluster-stop.json) >> \
/Users/nicholedean/Documents/GitHub/python-batch/databricks/automated-spark-cluster-creation/cluster-status.log