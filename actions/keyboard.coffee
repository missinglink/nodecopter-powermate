
# process.stdin.on 'data', console.log

process.stdin.setRawMode( true )
process.stdin.resume()
process.stdin.setEncoding( 'utf8' )

# stdin = process.openStdin()
# require('tty').setRawMode(true);   

speed = 0.5

module.exports = ( quad ) ->

  process.stdin.on 'data', (key) ->

    # console.log 'key', key

    if key is ' '
      quad.powermate.emit 'reset'
      quad.client.stop()
    
    if key is ''
      quad.powermate.emit 'reset'
      quad.client.land()

    if key is 'w' then quad.client.front speed
    else if key is 's' then quad.client.back speed

    if key is 'a' then quad.client.left speed
    else if key is 'd' then quad.client.right speed

    if ( key is '\u0003' ) then process.exit()