/* -*- javascript -*- */

function munge_icon(id)
{
    if (!id.startsWith('http'))
    {
	if (!id.endsWith('.png') && !id.endsWith('.jpg'))
	{
	    return "https://maps.gstatic.com/mapfiles/ms2/micons/" + id + ".png";
	}
    }
    return id;
}

function populate_guesses(map, addrs)
{
    var geocoder = new google.maps.Geocoder();
    for (let addr of addrs.guesses) {
	geocoder.geocode(
	    {'address': addr.guess},
	    function(results, status) {
		if (status == 'OK') {
		    var marker = new google.maps.Marker(
			{
			    map: map,
			    position: results[0].geometry.location,
			    title: addr.call,
			    icon: munge_icon(addr.icon)
			}
		    );
		}
	    }
	);
    }
}

function style_features(map)
{
    map.data.setStyle(function(feature) {
	var style = {};
	if (feature.getProperty('icon'))
	{
	    style.icon = {url: munge_icon(feature.getProperty('icon'))};
	}
	if (feature.getProperty('title'))
	{
	    style.title = feature.getProperty('title');
	}
	return style;
    });
}

function add_infowindow(map)
{
    var infowindow = new google.maps.InfoWindow();
    map.data.addListener('mouseover', function(event) {
	if (event.feature.getProperty('description'))
	{
	    var descr = event.feature.getProperty('description');
	    infowindow.setContent(descr);
	    infowindow.setPosition(event.feature.getGeometry().get());
	    infowindow.setOptions({pixelOffset: new google.maps.Size(0, -30)});
	    infowindow.open(map);
	}
    });
    map.data.addListener('mouseout', function(event) { infowindow.close(); });
}

function add_legend(map, mapconfig)
{
    var legend = document.getElementById('legend');
    for (var key in mapconfig.legend)
    {
	var legenditem = mapconfig.legend[key];
	var div = document.createElement('div');
	div.setAttribute('class', 'legenditem');
	var img = document.createElement('img');
	img.setAttribute('src', munge_icon(legenditem.icon));
	var span = document.createElement('span');
	span.setAttribute('class', 'legendtext');
	span.innerHTML = legenditem.description;
	div.appendChild(img);
	div.appendChild(span);
	legend.appendChild(div);
    }
    map.controls[google.maps.ControlPosition.RIGHT_TOP].push(legend);
}

function add_guesses(map)
{
    var request = new XMLHttpRequest();
    request.responseType = 'json';    
    request.open('GET', 'geocode.json');
    request.onload = function() {
	if (request.readyState == 4) {
	    if (request.status == 200) {
		populate_guesses(map, request.response);
	    }
	}
    };
    request.send();    
}

function populate_map(mapconfig)
{
    var map = new google.maps.Map(
	document.getElementById('map'),
	{
	    center: mapconfig.center,
	    zoom: mapconfig.zoom
	}
    );
    map.data.loadGeoJson('geo.json');
    
    add_guesses(map);
    style_features(map);
    add_infowindow(map);
    add_legend(map, mapconfig);
}

function init_map()
{
    var request = new XMLHttpRequest();
    request.responseType = 'json';    
    request.open('GET', 'map.json');
    request.onload = function() {
	if (request.readyState == 4) {
	    if (request.status == 200) {
		populate_map(request.response);
	    }
	}
    };
    request.send();    
}
