let status = [];
let radarIsShowing = true;
let isPaused = false;
let minimapData;
let blinking = [];
var spedselector = document.querySelector("#Velocimetro")
var spedselector2 = document.querySelector("#selectorspeed")
window.onData = function (data) {
	if(data.updateVehicle)
	{
		this.updateVehicle(data);
	}
};

$('#cinto_2').hide('slow')
$('#cinto').hide('hide')

this.updateVehicle = function(data) {
	
	var vehicleInfo = document.querySelector('.info.vehicle');
	var vehicleSeatbelt = document.querySelector('#cinto');
	var vehicleSeatbelt2 = document.querySelector('#cinto2');
	var vehicleCruiser = document.querySelector('#vehicle-speed strong');
	
	if (data.status == true) {	



		if (vehicleInfo.classList.contains('inactive')) {
			vehicleInfo.classList.remove('inactive');
			vehicleInfo.classList.add('active');
		}

	
		if (vehicleInfo.classList.contains('updated') == false) {

			var vehicleSpeedUnit = data.config.speedUnit.slice(0,2)+'/'+data.config.speedUnit.slice(-1);
			var vehicleAverageSpeed = Math.ceil(data.config.maxSpeed / 6);

			vehicleInfo.classList.add('updated');
			saferInnerHTML(vehicleCruiser,vehicleSpeedUnit);

		}
		var previousGear = document.querySelector('#vehicle-gear span').innerHTML;
		var currentGear = data.gear;
		if (previousGear != currentGear) { document.querySelector('#vehicle-gear').classList.add('pulse') }
		saferInnerHTML(document.querySelector('#vehicle-gear span'), data.gear);


		document.querySelector('#progress-speed svg circle.speed').style.strokeDashoffset = data.nail - 28;
		saferInnerHTML(document.querySelector('#vehicle-speed span'), data.speed);

		if ( (data.seatbelt.status == true) ) {
			vehicleSeatbelt2.style.display = 'none'
			vehicleSeatbelt.style.display = 'block'
		}
		
		else if ( (data.seatbelt.status == false) ) {
			vehicleSeatbelt.style.display = 'none'
			vehicleSeatbelt2.style.display = 'block'
		}

		if (vehicleCruiser.classList.contains(data.cruiser) == false) {
			vehicleCruiser.classList.remove('on','off');
			vehicleCruiser.classList.add(data.cruiser);
		}
		saferInnerHTML(document.querySelector('#vehicle-speed2 span'), data.currentKM+'KM');

	}
	
	else {
		if (vehicleInfo.classList.contains('active')) {
			vehicleCruiser.classList.remove('on');
			vehicleInfo.classList.remove('active');
			vehicleInfo.classList.add('inactive');
		}

	}
}

window.onload = function (e) {
	window.addEventListener('message', function (event) {
		onData(event.data);
	});
};