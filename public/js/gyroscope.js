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
    }, false);
  }
};

