
module.exports = ( quad ) ->

  quad.powermate.on 'buttonDown', () ->

    if quad.state.buttonState is null then quad.client.takeoff()

    quad.state.buttonState = 'down'

  quad.powermate.on 'buttonUp', () ->
    quad.state.buttonState = 'up'

    newDown = new Date()
    if( ( newDown.getTime() - quad.state.lastDown.getTime() ) < 500 )
      quad.client.land()
      quad.state.reset()

    quad.state.lastDown = newDown
    # quad.client.land();