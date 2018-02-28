# Blocmetrics

Blocmetrics is an extremely lightweight analytics script that lets you record
simple events to a dashboard on Heroku. Blocmetrics features a client-side
JavaScript snippet that allows a user to track events on their website. A
server-side API captures and saves those events to a database and a rails
application displays the captured event data for the user.

Try it at on [heroku](https://blocmetrics-4893.herokuapp.com).


FROM: app/assets/javascripts/application.js
  ADD TO: app/assets/javascripts/application.js in app you want to track

```js
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "https://blocmetrics-4893.herokuapp.com/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
```

ADD TO: any view you want to track

```js
<script>blocmetrics.report('REPORT GOES HERE');</script>
```

![alt text](https://imgur.com/ksMsc4y.png "Blocmetrics Screenshot")
![alt text](https://imgur.com/Ri1kXug.png "Blocmetrics Screenshot")
