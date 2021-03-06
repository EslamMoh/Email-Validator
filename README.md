# Email Validator Task

This application is validating if the entered email is right or not , it supports connection through Api's and views (Browser) , There is also a rate limit for requests `(at most 5 requests per second are allowed)` , it is built using [Mailboxlayer Api's](https://mailboxlayer.com)

## Setting up the app


- Make sure you run the correct version of Ruby `2.4.1`
- Run Redis server (default port: 6379) and Elasticsearch server (default ports: 9200 and 9300)
- Navigate to the project folder from the terminal
	- Run `bundle install`
	- Run Rails local server using command `rails s`
- To connect through view , from your browser : Open localhost:3000 , enter the email in the page and you will be redirected to the result of the email
- To connect through Api , from your Api client ex.: `postman` 
	- enter url : localhost:3000/api/emails?email=`ENTER THE EMAIL HERE`
	- method : `GET`
- Application is also deployed on heroku , you can check it on this url : [https://damp-springs-72463.herokuapp.com/](https://damp-springs-72463.herokuapp.com/) , this is the base url
	- To connect to Heroku through Api ,  from your Api client enter url : https://damp-springs-72463.herokuapp.com/api/emails?email=`ENTER_THE_EMAIL_HERE` , method : `GET`
	- To connect to Heroku through views , open [this url](https://damp-springs-72463.herokuapp.com/) from your browser
