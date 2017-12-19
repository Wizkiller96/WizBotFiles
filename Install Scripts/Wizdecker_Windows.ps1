docker pull wizkiller96/wizdecker:latest
docker stop wizbot
docker cp wizbot:/root/wizbot/credentials.json credentials.json
docker cp wizbot:/opt/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data/WizBot.db WizBot.db
docker rm wizbot
docker create --name=wizbot -v /wizbot/conf:/root/wizbot -v /wizbot/data/:/opt/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data wizkiller96/wizdecker:latest
docker cp credentials.json wizbot:/root/wizbot
docker cp WizBot.db wizbot:/opt/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data/WizBot.db
docker start -a wizbot