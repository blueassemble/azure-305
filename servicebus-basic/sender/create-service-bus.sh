myLocation=eastUS
myNameSpaceName=az204svcbus$RANDOM

az group create --name az204-svcbus-rg --location $myLocation

az servicebus namespace create \
    --resource-group az204-svcbus-rg \
    --name $myNameSpaceName \
    --location $myLocation

az servicebus queue create --resource-group az204-svcbus-rg \
    --namespace-name $myNameSpaceName \
    --name az204-queue

ConnectionString=$(az servicebus namespace authorization-rule keys list --name RootManageSharedAccessKey \
    --namespace-name $myNameSpaceName \
    --resource-group az204-svcbus-rg \
    --query "primaryConnectionString")

echo $ConnectionString

#az group delete --name az204-svcbus-rg --no-wait
