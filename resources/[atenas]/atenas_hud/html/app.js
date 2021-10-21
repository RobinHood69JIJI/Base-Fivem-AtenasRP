function rgba(hex,opacity){
    hex = hex.replace('#','');
    redColor = parseInt(hex.substring(0,2), 16);
    greenColor = parseInt(hex.substring(2,4), 16);
    blueColor = parseInt(hex.substring(4,6), 16);

    result = 'rgba('+redColor+','+greenColor+','+blueColor+','+opacity/100+')';
    return result;
}

var loadJS = function(url, implementationCode) {
	var scriptTag = document.createElement('script');
	scriptTag.src = url;

	scriptTag.onload = implementationCode;
	scriptTag.onreadystatechange = implementationCode;

};



function ajaxio(method,url,type=null,data=null) {
	return new Promise((resolve, reject) => {
		const req = new XMLHttpRequest();
		req.open(method, url, true); 

		if (method == 'POST') {
			if (type == 'json' && data != null) {
				req.setRequestHeader('Content-Type', 'application/json');
				var data = JSON.stringify(data);
			}
			else { req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); }
		}

		req.onload = () => req.status === 200 ? resolve(req.response) : reject(Error(req.statusText));
		req.onerror = (e) => reject(Error(`Network Error: ${e}`));

		if (method == 'POST') { req.send(data); }
		else { req.send(); }
	});
}


Object.prototype.addMultiListener = function(eventNames, listener) {
	var events = eventNames.split(' ');

	if (NodeList.prototype.isPrototypeOf(this) == true) {
		for (var x=0, xLen=this.length; x<xLen; x++) {
			for (var i=0, iLen=events.length; i<iLen; i++) { this[x].addEventListener(events[i], listener, false); }
		}
	}

	else if (HTMLElement.prototype.isPrototypeOf(this) == true) {
		for (var i=0, iLen=events.length; i<iLen; i++) { this.addEventListener(events[i], listener, false); }
	}
}


window.onload = function () {

		var eventCallback = {
			ui: function(data) {
				var config = data.config;

				if (config.showVipMoney == true) { document.querySelector('#vip').style.display = 'block'; }
				if (config.showWalletMoney == true) { document.querySelector('#wallet').style.display = 'block'; }
				if (config.showBankMoney == true) { document.querySelector('#bank').style.display = 'block'; }
				if (config.showBlackMoney == true) { document.querySelector('#blackMoney').style.display = 'block'; }
				if (config.showSocietyMoney == true) { document.querySelector('#society').style.display = 'block'; }

				if (config.showJob == true) { document.querySelector('#job').style.display = 'block'; }
			
			},
			element: function(data) {
				if (data.task == 'enable') { document.querySelector('#'+data.value).style.display = 'block'; }
				else if (data.task == 'disable') { document.querySelector('#'+data.value).style.display = 'none'; }
			},
			setText: function(data) {
				var key = document.querySelector('#'+data.id+' span');
				var html = data.value;
				saferInnerHTML(key, html);
			},
			setFont: function(data) {
				document.querySelector('#font').href = data.url;
				document.body.style.fontFamily = data.name;
			},
			
			setMoney: function(data) {
				data.value = data.value.toLocaleString();
				var oldValue = document.querySelector('#'+data.id+' span').innerHTML;
				if (oldValue != data.value) { document.querySelector('#'+data.id).classList.add('pulse'); }
				eventCallback['setText'](data);
			},
			
			toggleUi: function(data) {
				var uiID = document.querySelector('#ui');
				if (data.value == true) {
					uiID.style.display = 'block';
				}
				else {
					uiID.style.display = 'none';
				}
			},

		};

		document.querySelectorAll('.icon i').addMultiListener('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () { this.parentElement.classList.remove('pulse'); this.parentElement.classList.remove('shooting'); });

		window.addEventListener('message', function(event) {
			eventCallback[event.data.action](event.data);
		});

}