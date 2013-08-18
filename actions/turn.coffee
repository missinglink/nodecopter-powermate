
direction = null
speed = 0
turnPerc = 0

update = (delta) ->

  change = false

  if delta > 0
    if direction != 'clockwise' then change = true
    direction = 'clockwise'

  else if delta < 0
    if direction != 'anticlockwise' then change = true
    direction = 'anticlockwise'

  if direction == 'clockwise' or direction == 'anticlockwise'
    if speed != Math.abs(delta) then change = true
    speed = Math.abs delta

    if direction == 'clockwise' then turnPerc += speed
    else if direction == 'anticlockwise' then turnPerc -= speed

    # if turnPerc > 100 then turnPerc = 100 - turnPerc
    # else if turnPerc < 0 then turnPerc = 100 - turnPerc

  return change

module.exports = ( quad ) ->

  quad.powermate.on 'reset', ->
    direction = null
    speed = 0
    turnPerc = 0

  quad.powermate.on 'wheelTurn', (wheelDelta) ->

    change = update wheelDelta

    console.log 'turnPerc', turnPerc

    # console.log 'speed', speed
    # quad.state.lastSpin = new Date()

    # console.log 'change', change

    if true

      if quad.state.buttonState is 'up'

        # console.log 'spin', direction
        # if( direction == 'clockwise' )
        #   s = Math.abs( turnPerc / 50 )
        #   console.log 'clockwise', s
        #   quad.client.clockwise( s )
        # else
        #   s = Math.abs( turnPerc / 50 )
        #   console.log 'counterClockwise', s
        #   quad.client.counterClockwise( s )

        if( turnPerc > 0 )
          s = Math.abs( turnPerc / 25 )
          console.log 'clockwise', s
          quad.client.clockwise( s )
        else if( turnPerc < 0 )
          s = Math.abs( turnPerc / 25 )
          console.log 'counterClockwise', s
          quad.client.counterClockwise( s )


      else if quad.state.buttonState is 'down'

        if( direction == 'clockwise' )
          quad.client.up( speed )
        else
          quad.client.down( speed )

  # wheelTurn { '0': 1 }