# Estatic Info
curl -X POST \
  http://localhost:1026/v2/entities/urn:ngsi-ld:ws522:ws522-001/attrs \
  -H 'Content-Type: application/json' \
  -H 'Fiware-Service: galileo' \
  -H 'Fiware-ServicePath: /cordoba' \
  -H 'Postman-Token: 532e7461-6924-44d3-92ae-b2d59caf8ec9' \
  -H 'cache-control: no-cache' \
  -d ' {
        "location": {
            "type": "geo:json",
            "value": {
                "type": "Point",
                "coordinates": [ 37.88383836395509, -4.758375775934176 ]
            }
        },
       "base": {
            "type": "String",
            "value": "IES Galielo Galilei"
        }

 }        
 '
