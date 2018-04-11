function dynamodb-start() {
  cd $HOME/src/firstleads/dynamodb_local_latest && java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
}

function dynamodb-test-mode() {
  cd $HOME/src/firstleads/dynamodb_local_latest && java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -inMemory
}
