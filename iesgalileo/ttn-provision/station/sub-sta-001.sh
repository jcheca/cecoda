# EnForma COMÚN
curl localhost:1026/v2/subscriptions -s -S --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'fiware-service: galileo' --header 'fiware-servicepath: /cordoba' -d @- <<EOF
{
        "description": "Sub urn:ngsi-ld:station01:sta-001",
        "subject": {
            "entities": [
            {
                "idPattern": "urn:ngsi-ld:station01:sta-001",
                "type": "station01"
            }
            ],
            "condition": {
                "attrs": [
                    "S1-BatV","S1-H_in","S1-T_in","S2-VWC1","S3-h","S4-H","S4-P","S4-T","S5-C"
                ]
            }
        },
        "notification": {
            "http": {
                "url": "http://quantumleap:8668/v2/notify"
            },
            "attrs": [
                    "S1-BatV","S1-H_in","S1-T_in","S2-VWC1","S3-h","S4-H","S4-P","S4-T","S5-C"
            ],
            "metadata": ["dateCreated", "dateModified"]
        },
        "throttling": 5
    }
EOF
