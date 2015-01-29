Look Up
=======

[![Code Climate](https://codeclimate.com/github/Tr1ckX/LookUp/badges/gpa.svg)](https://codeclimate.com/github/Tr1ckX/LookUp) [![Test Coverage](https://codeclimate.com/github/Tr1ckX/LookUp/badges/coverage.svg)](https://codeclimate.com/github/Tr1ckX/LookUp)

What is “LookUp”?
-----------------
LookUp is a web-app that guides the user through a number of simple steps to survey a roof that they believe might be a good site for community solar power. Its overall aim is to engage and inspire a wider audience to consider setting up environmentally-friendly community energy projects that take some of the monopoly away from large energy companies.

How it works
------------
The app collects the user's location using the google maps API, the direction that the roof is facing and the angle of the roof using your mobile’s in-built gyroscope and compass. It also collects other information such as the roof’s material and size, the potential shade that could fall on the roof during the day and a photograph of the site. At the end of the process the user is given an estimated amount of panels that can fit on the roof and the amount of power that these could generate based on the data collected.

How it was built
----------------
Built in Ruby with a Sinatra server and Postgres for the database. We used cucumber and capybara for our feature tests and RSpec for the unit tests. 

Techs overview
-------------- 

**Languages:**

- Ruby
- Javascript

**Frameworks:**

- Sinatra
- Foundation

**External libraries:** 

- jQuery
- Google maps API

**Database:**

- PostrgeSQL

**Test suites:**

- RSpec
- Cucumber
- Capybara

**Deployed:**

- Heroku
- AWS for saving images

Best code snippets
------------------

Retrieving geolocation in browser:
```javascript

navigator.geolocation.getCurrentPosition(getPosition); 
var lat;
var longit;
var id = $('.page-wrap').data("roof-id");
function getPosition(position) {
  lat = position.coords.latitude;
  longit = position.coords.longitude;
}
$('#submit_button').click(function() {
  $.post('/roofs/' + id + '/geolocation',{ latitude: lat, longitude: longit });
});
```
Getting mobile phone accelerometer data:
```javascript
if(window.DeviceOrientationEvent) {
  window.addEventListener('deviceorientation', function(event) {
  angle = Math.abs(Math.round(event.beta));
  if(angle !== null); 
  dataContainerOrientation.innerHTML = 'Roof angle: ' + angle + ' degrees';
  }, false);
  $('#capture').click(function(){
    $('#capture_hidden').attr('value', angle);
});
```
Checking if user running Safari, browser, as we encountered issues with complatibility with *.click* method:
```javascript
if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0)
  {
    $("#takePictureField").click();
  }
```


Challenges
----------
Used some external libraries, such as the map tool, which needed tweaking to make them work in our context. It wasn't possible to test the photo capture process or the touch screen map tool using cucumber/capybara which isn't ideal as they are quite complex steps. We made sure that we tested each on a number of different devices to ensure the feature's cross platform compatibility.

Team
----

<img src="https://avatars2.githubusercontent.com/u/8901119?v=3&s=35">  [Rich](http://github.com/ralake)

<img src="https://avatars3.githubusercontent.com/u/7409666?v=3&s=35">  [Pavel](http://github.com/palyrex)

<img src="https://avatars2.githubusercontent.com/u/8865160?v=3&s=35">  [Attila](http://github.com/Tr1ckX)

<img src="https://avatars2.githubusercontent.com/u/8972868?v=3&s=35">  [Shan](http://github.com/shanhasan)

