Look Up
=======

[![Code Climate](https://codeclimate.com/github/Tr1ckX/LookUp/badges/gpa.svg)](https://codeclimate.com/github/Tr1ckX/LookUp)

[![Test Coverage](https://codeclimate.com/github/Tr1ckX/LookUp/badges/coverage.svg)](https://codeclimate.com/github/Tr1ckX/LookUp)

What is “LookUp”?
-----------------
LookUp is a web-app that guides the user through a number of simple steps to survey a roof that they believe might be a good site for community solar power. Its overall aim is to engage and inspire a wider audience to consider setting up environmentally-friendly community energy projects that take some of the monopoly away from large energy companies.

How it works
------------
The app collects the user's location using the google maps API, the direction that the roof is facing and the angle of the roof using your mobile’s in-built gyroscope and compass. It also collects other information such as the roof’s material and size, the potential shade that could fall on the roof during the day and a photograph of the site. At the end of the process the user is given an estimated amount of panels that can fit on the roof and the amount of power that these could generate based on the data collected.

How it was built
----------------
Built in Ruby with a Sinatra server and Postgres for the database. We used cucumber and capybara for our feature tests and rSpec for the unit tests. 

Challenges
----------
Used some external libraries, such as the map tool, which needed tweaking to make them work in our context. It wasn't possible to test the photo capture process or the touch screen map tool using cucumber/capybara which isn't ideal as they are quite complex steps. We made sure that we tested each on a number of different devices to ensure the feature's cross platform compatibility.

Team
----

[Rich](http://github.com/ralake)
[Pavel](http://github.com/palyrex)
[Attila](http://github.com/Tr1ckX)
[Shan](http://github.com/shanhasan)

