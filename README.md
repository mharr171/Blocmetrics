# Blocmetrics
An extremely lightweight analytics script that lets you record simple events to a dashboard on Heroku.


> FROM: app/assets/javascripts/application.js

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
