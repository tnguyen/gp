module.exports = function() {
	var express = require('express');
	var app = express();
	app.locals.basedir = "." + '/views';

	app.get('/', function(req, res) {
		var param = {
			loggedin: false,
		};

		login.checkLogin(req, res).then(function(result) {
			param.loggedin = true;
			var cookies = new Cookies(req, res);
			userId = cookies.get('id');

			// var profileInfo = getProfileInfo(userId);

			param.user_data = {
				userID: userId,
				firstname: result.Firstname,
				surname: result.Surname,
				mugshot: result.ProfileImage
			};


			res.render('frontpage', param);
		}, function(err) {
			res.render('frontpage',param);
		});

	})

	return app;
}();