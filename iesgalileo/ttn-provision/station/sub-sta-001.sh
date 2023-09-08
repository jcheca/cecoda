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
                    "battery","humidity_in","temperature_in","vwc","humidity_leaf","humidity","pressure","temperature","pulse_counter"
                ]
            }
        },
        "notification": {
            "http": {
                "url": "http://quantumleap:8668/v2/notify"
            },
            "attrs": [
                    "battery","humidity_in","temperature_in","vwc","humidity_leaf","humidity","pressure","temperature","pulse_counter"
            ],
            "metadata": ["dateCreated", "dateModified"]
        },
        "throttling": 5
    }
EOF
