
var arDrone = require('ar-drone');
var client  = arDrone.createUdpControl();

// client.on('navdata', console.log);

client.takeoff();

client.nugdeLeft = function( delay, speed, duration ) {
  this.after( delay, function() {
    this.left( speed );
  });
  this.after( duration, function() {
    this.stop();
  });
  return this;
};

client.nugdeRight = function( delay, speed, duration ) {
  this.after( delay, function() {
    this.right( speed );
  });
  this.after( duration, function() {
    this.stop();
  });
  return this;
};

client

  .after(1000, function() {
    this.up(1);
  })
  .after(5000, function() {
    this.stop();
  })

  // .after(1000, function() {
  //   this.animate( 'flipRight', 700 );
  // })
  // .after(1000, function() {
  //   this.stop();
  // })

  // .after(1000, function() {
  //   this.animate( 'flipLeft', 700 );
  // })
  // .after(1000, function() {
  //   this.stop();
  // })


  // .nugdeLeft( 5000, 0.5, 500 )
  // .nugdeRight( 5000, 0.5, 500 )

  // .after(5000, function() {
  //   this.animate( 'wave', 700 );
  // })
  // .after(5000, function() {
  //   this.animate( 'wave', 700 );
  // })


  // .after(1000, function() {
  //   this.up(0.2);
  // })
  // .after(1000, function() {
  //   this.stop();
  // })
  // .after(5000, function() {
  //   this.animate( 'flipAhead', 700 );
  // })

  // .after(1000, function() {
  //   this.up(0.2);
  // })

  .after(500, function() {
    this.stop();
    this.land();
  });