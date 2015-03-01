function Gyroscope() {
  this.angleContainer = document.getElementById('setRoofAngle');
}

Gyroscope.prototype.setAngle = function() {
  _this = this;
  if(window.DeviceOrientationEvent) {
    window.addEventListener('deviceorientation', function(event) {
    this.angle = Math.abs(Math.round(event.beta));
    if(this.angle !== null);
      _this.angleContainer.innerHTML = this.angle + '°';
      $('body').data('angle', this.angle);
      $('.roof_angler').css({
        '-ms-transform': 'rotate(-'+ this.angle +'deg)',
        '-webkit-transform': 'rotate(-'+ this.angle +'deg)',
        'transform': 'rotate(-'+ this.angle +'deg)',
      });
    }, false);
  }
};

