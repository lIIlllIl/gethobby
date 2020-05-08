$(function(){
	$.ajax(
			{
				url : "/searchHobbyClass/json/openChannelTalk",
				method : "get", 
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					(function() {
					    var w = window;
					      if (w.ChannelIO) {
					      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
					    }
					    var d = window.document;
					    var ch = function() {
					      ch.c(arguments);
					    };
					    ch.q = [];
					    ch.c = function(args) {
					      ch.q.push(args);
					    };
					    w.ChannelIO = ch;
					    function l() {
					      if (w.ChannelIOInitialized) {
					        return;
					      }
					      w.ChannelIOInitialized = true;
					      var s = document.createElement('script');
					      s.type = 'text/javascript';
					      s.async = true;
					      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
					      s.charset = 'UTF-8';
					      var x = document.getElementsByTagName('script')[0];
					      x.parentNode.insertBefore(s, x);
					    }
					    if (document.readyState === 'complete') {
					      l();
					    } else if (window.attachEvent) {
					      window.attachEvent('onload', l);
					    } else {
					      window.addEventListener('DOMContentLoaded', l, false);
					      window.addEventListener('load', l, false);
					    }
					  })();
					  ChannelIO('boot', {
					    "pluginKey": JSONData.channelTalk, //please fill with your plugin key
					    "userId": JSONData.userId, //fill with user id
					    "profile": {
					      "name": JSONData.userId, //fill with user name
					      "mobileNumber": JSONData.userPhone //fill with user phone number
					    }
					  });
				}
			}
	)
	
})