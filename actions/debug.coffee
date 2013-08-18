
# powermate.on('buttonDown', callback);
# powermate.on('buttonUp', callback);
# powermate.on('wheelTurn', callback(wheelDelta));
# powermate.setBrightness(brightness, [callback]);
# powermate.brightness(callback(brightness));
# powermate.setPulseAwake(pulseAwake, [callback]);
# powermate.pulseAwake(callback(pulseAwake));
# powermate.setPulseAsleep(pulseAsleep, [callback]);
# powermate.pulseAsleep(callback(pulseAsleep));
# powermate.setPulseSpeed(pulseSpeed, [callback]);
# powermate.pulseSpeed(callback(pulseSpeed));
# powermate.buttonState(callback(buttonState));

navdata = {}

module.exports = ( quad ) ->

  quad.powermate.on 'buttonDown', () -> console.log 'buttonDown', arguments
  quad.powermate.on 'buttonUp', () -> console.log 'buttonUp', arguments
  quad.powermate.on 'wheelTurn', (wheelDelta) -> console.log 'wheelTurn', arguments

  quad.client.on 'navdata', (data) ->
    navdata = data
    console.log 'LOW BATTERY' if data.droneState.lowBattery