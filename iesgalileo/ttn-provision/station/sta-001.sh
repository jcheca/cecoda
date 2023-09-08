curl localhost:4061/iot/devices -s -S --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'fiware-service: galileo' --header 'fiware-servicepath: /cordoba' -d @- <<EOF
 {
"devices": [{
    "device_id": "sta-001",
    "entity_name": "urn:ngsi-ld:station01:sta-001",
    "entity_type": "station01",
    "timezone": "Europe/Madrid",
    "attributes": [
        {
            "object_id": "S1-BatV",
            "name": "battery",
            "type": "Number"
        },
        {
            "object_id": "S1-H_in",
            "name": "humidity_in",
            "type": "Number"
        },
        {
            "object_id": "S1-T_in",
            "name": "temperature_in",
            "type": "Number"
        },
        {
            "object_id": "S2-VWC1",
            "name": "vwc",
            "type": "Number"
        },
        {
            "object_id": "S3-h",
            "name": "humidity_leaf",
            "type": "Number"
        },
        {
            "object_id": "S4-H",
            "name": "humidity",
            "type": "Number"
        },
        {
            "object_id": "S4-P",
            "name": "pressure",
            "type": "Number"
        },
        {
            "object_id": "S4-T",
            "name": "temperature",
            "type": "Number"
        },
        {
            "object_id": "S5-C",
            "name": "pulse_counter",
            "type": "Number"
        }
    ],
    "internal_attributes": {
        "lorawan": {
            "application_server": {
                "host": "eu1.cloud.thethings.network",
                "username": "station-01@ttn",
                "password": "NNSXS.WVMHGGXPLFMTLGJY2GECAO24XURPG4J7GSX5FKY.T2FOK24A3QXHU2PXDVWVL5K3KDYHEKX7NLE2V5ZCFKSI5RQUNGAA",
                "provider": "TTN"
            },
            "dev_eui": "000000003A0695DE",
            "app_eui": "24E124C0002A0001",
            "application_id": "station-01@ttn",
            "application_key": "06504D6122A2F853FC7D39D02C5B562C",
            "data_model": "application_server"
        }
    }
}]}
EOF
