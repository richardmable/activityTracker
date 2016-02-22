Rails application to display, store, and communicate with data from a Tessel unit that captures a user's step count.

This data will then be blended with cycling activities from Strava via their API, and computed to find a total stress score for the day.

This is useful if you find yourself walking for miles, then wondering why your legs feel terrible on the Sunday ride.

Idea is to use Angular.js for the front end, and communicate via http requests to the Rails application.

The Tessel unit will communicate to the application to store data, probably in JSON format. Ruby will be used to parse the data. (details to follow on how exactly that entire process will work)
