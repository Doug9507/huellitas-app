import 'dart:convert';

const _mapStyle = [
  {
    "featureType": "administrative",
    "elementType": "geometry.fill",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#7b697f"}
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#b3a3b7"}
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#846c89"},
      {"saturation": "0"}
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "elementType": "labels.text",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#e1dfec"}
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#e1dfec"}
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#8a788e"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {"visibility": "off"},
      {"saturation": "-100"},
      {"color": "#ddcbe1"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#8a788e"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "on"},
      {"saturation": "-80"},
      {"lightness": "-5"},
      {"gamma": "2.00"},
      {"hue": "#c200ff"}
    ]
  },
  {
    "featureType": "poi.attraction",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "1"},
      {"lightness": "32"},
      {"weight": "0.01"},
      {"gamma": "0.66"}
    ]
  },
  {
    "featureType": "poi.government",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#cee094"},
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#f7f5f9"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"},
      {"saturation": "-10"},
      {"lightness": "10"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#bdacd0"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#bdacd0"},
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#8a788e"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-50"}
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#a978b4"},
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#696969"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {"visibility": "on"},
      {"color": "#8fcbf9"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#5da6f7"}
    ]
  }
];

final mapStyle = jsonEncode(_mapStyle);
