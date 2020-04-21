# smregistrering-backend-docker-compose
Docker-compose miljø for å starte et lokalt kjøremiljø for utvikling for [smregistrering-backend](https://github.com/navikt/smregistrering-backend). 

Oppsettet for Kafka (zookeeper, kafkadminrest, schema-registry, openldap) er lånt fra [navkafka-docker-compose](https://github.com/navikt/navkafka-docker-compose)

## Starte miljøet
You know the drill.

Kjøre denne commandoen først
```docker login -u [BRUKERNAVN] -p [TOKEN] docker.pkg.github.com```
Der du bytter ut med [BRUKERNAVN] med ditt github brukernavn, og byttet ut [TOKEN], med eit personal access token
 med skope `read:packages`.
 
```docker-compose -f docker-compose.yml up```

## Legge til nødvendige Kafka topics for å tilfredsstille smregistrering-backend
```curl --user igroup:itest -X POST "http://localhost:8840/api/v1/topics" -H "accept: application/json" -H "content-type: application/json" -d "{ \"name\": \"privat-syfo-papir-sm-registering\", \"numPartitions\": 1}"
curl --user igroup:itest -X POST "http://localhost:8840/api/v1/topics" -H "accept: application/json" -H "content-type: application/json" -d "{ \"name\": \"privat-syfo-sm2013-automatiskBehandling\", \"numPartitions\": 1}"
curl --user igroup:itest -X POST "http://localhost:8840/api/v1/topics" -H "accept: application/json" -H "content-type: application/json" -d "{ \"name\": \"privat-syfo-sm2013-manuellBehandling\", \"numPartitions\": 1}"
curl --user igroup:itest -X POST "http://localhost:8840/api/v1/topics" -H "accept: application/json" -H "content-type: application/json" -d "{ \"name\": \"privat-syfo-sm2013-behandlingsUtfall\", \"numPartitions\": 1}"
curl --user igroup:itest -X POST "http://localhost:8840/api/v1/topics" -H "accept: application/json" -H "content-type: application/json" -d "{ \"name\": \"aapen-syfo-oppgave-produserOppgave\", \"numPartitions\": 1}"```