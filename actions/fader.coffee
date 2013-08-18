
cycle = 'up'
brightness = 0

module.exports = ( quad ) ->

  setInterval ->
    if cycle is 'up' then brightness++ else brightness--
    if brightness > 249 then cycle = 'down'
    if brightness < 0 then cycle = 'up'
    else
      # console.log brightness;
      try
        quad.powermate.setBrightness( brightness );
      catch e
        null
  , 1