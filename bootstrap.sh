#!/bin/bash

CMD=${1:-"exit 0"}

if [[ "$CMD" == "master" ]]; then
  /bin/bash -c "$SPARK_HOME/sbin/start-master.sh -h $SPARK_MASTER_HOST"
  /bin/bash -c "tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.master.Master*"
elif [[ "$CMD" == "worker" ]]; then
  /bin/bash -c "$SPARK_HOME/sbin/start-slave.sh $SPARK_MASTER_URL"
  /bin/bash -c "tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.worker.Worker*"
elif [[ "$CMD" == "history" ]]; then
  /bin/bash -c "$SPARK_HOME/sbin/start-history-server.sh"
  /bin/bash -c "tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.history.HistoryServer*"
else
  /bin/bash -c "$*"
fi
