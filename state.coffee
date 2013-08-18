
state =
  buttonState: null
  lastDown: new Date()
  lastSpin: new Date()

state.reset = ->
  state.buttonState = null
  state.lastDown = new Date()
  state.lastSpin = new Date()

module.exports = state