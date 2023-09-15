#!/usr/bin/env python
# coding: utf-8

import requests
import json

# Fiware Context Broker: Orion
orion_server = '161.22.45.53:1026'
orion_endpoint = '/v2'

# Fiware STH: Quantum
quantum_server = '161.22.45.53:8668'
quantum_endpoint = '/v2'

# Fiware Structure Service
fiwareservice = 'galileo'
fiwareservicepath = '/cordoba'

# Petición de servicio en base a la información global definida previamente.
fecha_inicio = "2023-09-10T00:00.000"
fecha_fin = "2023-09-15T01:00.999"

accion = '/entities/urn:ngsi-ld:station01:sta-001/value?fromDate='+fecha_inicio+'&toDate='+fecha_fin

url = 'http://'+quantum_server+quantum_endpoint+accion

payload={}
headers = {
  'Fiware-Service': fiwareservice,
  'Fiware-ServicePath': fiwareservicepath
}

response = requests.request("GET", url, headers=headers, data=payload)

# Debug
print(json.dumps(response.json(), indent=4))

# End
