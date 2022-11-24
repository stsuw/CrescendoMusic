var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var bodyParser = require('body-parser');
var flash = require('express-flash');
var session = require('express-session');
var db=require('./dbConfig');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
    secret: '123456catr',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
}))

app.use(flash());

app.use(express.json()); 

app.use(express.urlencoded({ extended: true })); 

app.use(express.static(path.join(__dirname, 'public'))); 

/* GET statements */
app.get('/home', function(req, res, next) {
  res.render('home', { title: 'Home', session:req.session });
});

app.get('/portfolio', function(req, res, next) {
  res.render('portfolio', { title: 'portfolio',session:req.session });
});

app.get('/reviews', function(req, res, next) {
  res.render('reviews', { title: 'reviews' });
});

app.get('/getintouch', function(req, res, next) {
  res.render('getintouch', { title: 'getintouch' });
});

app.get('/feedback', function(req, res, next) {
  res.render('feedback', { title: 'feedback' });
});

app.get('/users', function(req, res, next) {
  res.render('users', { title: 'users' });
});

app.get('/booking', function(req, res) { 
  res.render('booking');
}); 

app.get('/login', function(req, res) { 
res.render('login'); 
}); 

app.get('/mybooking', function(req, res) { 
res.render('mybooking'); 
});

/* GET statements to retrieve the database */
app.get('/getfeedback', function(req, res){ 
db.query("SELECT * FROM feedback", function (err, result) { 
if (err) throw err; 
console.log(result); 
res.render('getfeedback', { title: 'xyz', feedbackData: result}); 
}); 
}); 

app.get('/getmessage', function(req, res){ 
db.query("SELECT * FROM getintouch", function (err, result) { 
if (err) throw err; 
console.log(result); 
res.render('getmessage', { title: 'xyz', getintouchData: result}); 
}); 
}); 

app.get('/getusers', function(req, res){ 
db.query("SELECT * FROM users", function (err, result) { 
if (err) throw err; 
console.log(result); 
res.render('getusers', { title: 'xyz', usersData: result}); 
}); 
}); 

app.get('/getbooking', function(req, res){
    db.query("SELECT booking.booking_id, booking.first_name, booking.last_name, users.lesson_type, users.lessons_enrolled, users.email, booking.proposed_day, booking.proposed_time, booking.phone, booking.notes, booking.booking_at, booking.starting_date FROM users INNER JOIN booking ON users.email=booking.email ORDER BY booking.starting_date", function (err, result) {
        if (err) throw err;
        console.log(result);
        res.render('getbooking', { title: 'xyz', bookingData: result});
    });
});

/* POST statements to retrieve forms*/
app.post('/getintouch', function(req, res, next) {
  var first_name = req.body.first_name;
  var last_name = req.body.last_name;
  var email = req.body.email;
  var phone = req.body.phone;
  var interest = req.body.interest;
  var lesson_type = req.body.lesson_type;
  var message = req.body.message; 

  var sql = `INSERT INTO getintouch (first_name, last_name, email, phone, interest, lesson_type, message, message_at) VALUES ("${first_name}", "${last_name}", "${email}", "${phone}", "${interest}", "${lesson_type}", "${message}", NOW() )`;
  db.query(sql, function(err, result) {
	  console.log(result);
    if (err) throw err;
    console.log('record inserted');
    req.flash('success', 'Data added successfully!');
    });
    res.send('Thank you. We will contact you within 24 hours');
    res.end();
});

app.post('/feedback', function(req, res, next) {
  var name = req.body.name;
  var email = req.body.email;
  var phone = req.body.phone;
  var lessons_enrolled = req.body.lessons_enrolled;
  var lesson_type = req.body.lesson_type;
  var feedback = req.body.feedback;
  var consent = req.body.consent;  

  var sql = `INSERT INTO feedback (name, email, phone, lessons_enrolled, lesson_type, feedback, consent, feedback_on) VALUES ("${name}", "${email}", "${phone}", "${lessons_enrolled}", "${lesson_type}", "${feedback}", "${consent}", NOW() )`;
  db.query(sql, function(err, result) {
	  console.log(result);
    if (err) throw err;
    console.log('record inserted');
    req.flash('success', 'Data added successfully!');
    });
    res.send('We’re so happy to hear from you! Thank you for your valuable feedback.');
    res.end();
});

//The below /users post to register the new students
app.post('/users', function(req, res, next) {
  var first_name = req.body.first_name;
  var last_name = req.body.last_name;
  var email = req.body.email;
  var password = req.body.password;
  var dob = req.body.dob;
  var phone = req.body.phone;
  var lessons_enrolled = req.body.lessons_enrolled;
  var lesson_type = req.body.lesson_type;
  var notes = req.body.notes; 

  var sql = `INSERT INTO users (first_name, last_name, email, password, dob, phone, lessons_enrolled, lesson_type, notes, generated_at) 
  VALUES ("${first_name}", "${last_name}", "${email}", "${password}", "${dob}", "${phone}", "${lessons_enrolled}", "${lesson_type}", "${notes}", NOW() )`;
  db.query(sql, function(err, result) {
	  console.log(result);
    if (err) throw err;
    console.log('record inserted');
    req.flash('success', 'Data added successfully!');
    });
	res.send('Great! New user recorded');
    res.end();
});

app.post('/booking', function(req, res, next) {
  var first_name = req.body.first_name;
  var last_name = req.body.last_name;
  var proposed_day = req.body.proposed_day;
  var proposed_time = req.body.proposed_time;
  var starting_date = req.body.starting_date;
  var email = req.body.email;
  var phone = req.body.phone;
  var notes = req.body.notes; 
 
  var sql = `INSERT INTO booking (first_name, last_name, proposed_day, proposed_time, starting_date, email, phone, notes, booking_at) 
  VALUES ("${first_name}", "${last_name}", "${proposed_day}", "${proposed_time}", "${starting_date}", "${email}", "${phone}", "${notes}", NOW() )`;
  db.query(sql, function(err, result) {
	  console.log(result);
    if (err) throw err;
    console.log('record inserted');
    req.flash('success', 'Data added successfully!');
	});
	res.send('Thanks. Your booking has been captured. Tutor will contact you to confirm changes within 24 hours');
    res.end();
});

/* POST statements for registered user to login and response towards combination of email and password*/
app.post('/auth', function(req, res) { 
	let email = req.body.email; 
	let password = req.body.password; 
	if (email && password) { 
	db.query('SELECT * FROM users WHERE email = ? AND password = ?', [email, password], function(error, results, fields) { 
	if (error) throw error; 
	if (results.length > 0) { 
		req.session.loggedin = true; 
		req.session.email = email; 
		res.render('mybooking', {title:' My Booking', mybookingdata:results});
		} else { 
		res.send('Incorrect Email and/or Password!'); 
		}			 
		res.end(); 
		}); 
		} else { 
		res.send('Please enter Email and Password!'); 
		res.end(); 
		} 
		}); 

/*Users can access this if they are logged in*/ 
	app.get('/booking', function (req, res, next) { 
	if (req.session.loggedin) { 
    res.render('booking.ejs'); 
	} else { 
	res.send('Please login to view this page!'); 
	} 
	}); 

/*Statement for logging out users and redirect to the home page*/ 
app.get('/logout',(req,res) => { 
    req.session.destroy(); 
    res.redirect('/home'); 
}); 

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
/*app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};*/

// port must be set to 3000 because incoming http requests are routed from port 80 to port 8080
app.listen(3000);
console.log('Node app is running on port 3000');




module.exports = app;