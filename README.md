# Smart Alarm Server
Startup Systems Project @ Cornell Tech

[![Build Status](https://travis-ci.org/smart-alarm/server.svg?branch=master)](https://travis-ci.org/smart-alarm/server)

###Background
Users often set their alarm clocks expecting their morning routine and commute to take the usual amount of time. However, life is not always so static. Oftentimes there are unexpected accidents or events that causes delays and mess up these morning plans. If an alarm is not smart enough to warn us ahead of time and wake us up earlier when these events occur, our mornings can be ruined.

###Challenge
We propose to create an alarm app that will periodically check your morning commute and estimate the amount of time your commute will take and wake you up with enough time to make your appointments.

###Specs
* Ruby 2.2.2
* Rails 4.1.8
* Production Database: PostgreSQL
* Development and Test Database: SQLite

###Deployment
The current server code is hosted on Heroku. The server can be reached at [http://smart-alarm-server.herokuapp.com/](http://smart-alarm-server.herokuapp.com/). This will be how we implement the API calls required by the mobile version of the Smart Alarm App. The server stores account information and user routines.

###Build
Prerequisites:
* Ruby 2.2.2
* Bundler Gem
* SQLite (for local deployment)
```
$ git clone https://github.com/smart-alarm/server.git
$ cd smart-alarm-server/
$ bundle install --without production
$ rake db:migrate
$ rails server
```
The server should now be running on localhost on port 3000. Navigate to http://0.0.0.0:3000 to view the app's homepage.