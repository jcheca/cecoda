#!/usr/bin/env python
# coding: utf-8

import requests
import json

# Fiware Context Broker: Orion
orion_server = '161.22.45.53'
orion_endpoint = '/v2'

# Fiware STH: Quantum
quantum_server = '161.22.45.53:8668'
quantum_endpoint = '/v2'

# Fiware Structure Service
fiwareservice = 'galileo'
fiwareservicepath = '/cordoba'

device_id = 'urn:ngsi-ld:station01:sta-001'

# Petición de servicio en base a la información global definida previamente.
accion = '/entities/'+device_id
url = 'http://'+orion_server+orion_endpoint+accion

# Debug
print(url)

payload={}
headers = {
  'Fiware-Service': fiwareservice,
  'Fiware-ServicePath': fiwareservicepath
}

# Respuesta de la solicitud
response = requests.request("GET", url, headers=headers, data=payload)

# Debug
print(json.dumps(response.json(), indent=4))

# End