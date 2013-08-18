
module.exports = ( quad ) ->

  setInterval ->
    if ( (new Date()).getTime() - quad.state.lastSpin.getTime() ) > 500
      quad.client.stop()

    # console.log 'a', state.buttonState
    # console.log 'b', state.lastDown
    # console.log 'c', state.lastSpin
  , 500