
var arDrone = require('ar-drone');
var control = arDrone.createUdpControl();
var start   = Date.now();

var ref  = {};
var pcmd = {};

console.log('Recovering from emergency mode if there was one ...');
ref.emergency = true;
setTimeout(function() {
  console.log('Takeoff ...');

  ref.emergency = true;
  ref.fly       = true;

}, 1000);

// setTimeout(function() {
//   console.log('Turning clockwise ...');

//   pcmd.clockwise = 0.5;
// }, 100);

setTimeout(function() {
  console.log('Going up ...');

  pcmd.up = 0.5;
}, 2000);

setTimeout(function() {
  console.log('Stop going up ...');

  pcmd.up = 0;
}, 9000);

setTimeout(function() {
  console.log('Landing ...');

  ref.fly = false;
  pcmd = {};
}, 10000);


setInterval(function() {
  control.ref(ref);
  control.pcmd(pcmd);
  control.flush();
}, 30);