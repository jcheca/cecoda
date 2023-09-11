//
// Generado por https://app.cesens.com/ttn-formatter.php
//
//
function decodeUplink(input) {
  const sensorIds = [255,141,7,33,21];
  const metadata = {"255":{"BatV":{"minimo":3.1,"maximo":3.72,"precision":0.01,"bits":6},"T_in":{"minimo":-14,"maximo":70,"precision":6,"bits":4},"H_in":{"minimo":16,"maximo":100,"precision":6,"bits":4}},"141":{"VWC1":{"minimo":0,"maximo":64,"precision":0.1,"bits":10}},"7":{"h":{"minimo":0,"maximo":100,"precision":1,"bits":7}},"33":{"H":{"minimo":0,"maximo":100,"precision":1,"bits":7},"T":{"minimo":-40,"maximo":60,"precision":0.1,"bits":10},"P":{"minimo":850,"maximo":1050,"precision":0.1,"bits":11}},"21":{"C":{"minimo":0,"maximo":4000,"precision":1,"bits":12}}};
  const unpack = (params, numero) => {
    numero = parseInt(numero.join(''), 2);
    if (Math.pow(2, params.bits) === numero) return null;
    return Math.min(params.minimo + numero * params.precision, params.maximo);
  };

  const data = {};
  const warnings = [];
  if (input.bytes[0] === 0xFF) {
    warnings.push('Frame not supported');
    data.bytes = input.bytes;
    data.length = input.bytes.length;
  } else {
    const bits = [];
    for (const byte of input.bytes) {
      const thisByte = byte.toString(2).split('').map(Number);
      while (thisByte.length < 8) thisByte.unshift(0);
      bits.push(...thisByte);
    }

    let i = 0;
    let index = 10;
    for (const sensorId of sensorIds) {
      i++;
      if (sensorId === null) continue;
      for (const [metrica, params] of Object.entries(metadata[sensorId])) {
        data['S' + i + '-' + metrica] = unpack(params, bits.slice(index, index + params.bits));
        index += params.bits;
      }
    }
  }
  return { data, warnings, errors: [] };
}