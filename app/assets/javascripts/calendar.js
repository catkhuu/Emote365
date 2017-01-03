// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var x = document.getElementById("demo");

function getLocation() {
  if (navigator.geolocation) {
    return  navigator.geolocation.getCurrentPosition(showPosition);
    // debugger
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}
function showPosition(position) {
  // console.log(position.coords.latitude);
  // console.log(position.coords.longitude);
  // debugger
  var hi = $.ajax({
    url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true',
    type: 'GET'
  }).done(function(response){
    debugger
    var city = response.results[2].formatted_address.split(', ')[0];
    console.log(city)
    // $.ajax({
    //   url: 'https://where.yahooapis.com/v1/places.q(SFO)?',
    //   type: 'GET'
    // }).done(function(response){
    //   console.log('I am a response:' +  response);
    // }).fail(function(a,b,c){
    //   debugger;
    //   console.log(a);
    //   console.log(a);
    //   console.log(a);
    //
    // });
    var handleResults = function(data){
      debugger
      var woeid = data.query.results.place.woeid;
      console.log(woeid);
    };
    $.getJSON('http://query.yahooapis.com/v1/public/yql', {'q': 'select * from geo.places where text="'+ city +'"', 'format': 'json'}, handleResults);
  });
};

getLocation();
