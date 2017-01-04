// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getLocation() {
  if (navigator.geolocation) {
    return  navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}
function showPosition(position) {
  var hi = $.ajax({
    url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true',
    type: 'GET'
  }).done(function(response){
    var city = response.results[1].formatted_address.split(', ')[1];
    var handleResults = function(data){
      // debugger
      var results = data.query.results.place;
      if(results.length > 1){
        var woeid = results[0].woeid;
      } else {
        var woeid = results.woeid;
      }
      console.log(woeid);
      // $.ajax({
      //   url: '/calendars',
      //   method: 'post',
      //   data: calendar_params = {
      //     woeid: woeid
      //   }
      // });
    };
    $.getJSON('http://query.yahooapis.com/v1/public/yql', {'q': 'select * from geo.places where text="'+ city +'"', 'format': 'json'}, handleResults);
  });
};

getLocation();
