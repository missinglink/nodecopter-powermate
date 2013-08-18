
PowerMate = require('./pm')
powermate = new PowerMate()

arDrone = require('ar-drone');
client = arDrone.createClient();
client2 = arDrone.createUdpControl();

state = require('./state')

[ 'debug',
  'fader',
  'keyboard',
  # 'reset',
  'toggle',
  'turn'
].map (action) ->
  ( require './actions/'+action )({
    client: client,
    powermate: powermate,
    state: state
  })

# powermate.on 'reset', state.reset