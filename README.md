# Blocmetrics
An extremely lightweight analytics script that lets you record simple events to a dashboard on Heroku.


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
