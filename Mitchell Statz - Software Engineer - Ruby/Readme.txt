1. 
-Assuming your have MySQL running, you will need to make a new user "realstate" with an identical password "realstate" with privileges.
-- sql: create user 'realstate'@'localhost' identified by 'realstate'; grant all privileges on *.* to 'realstate'@'localhost' identified by 'realstate' with grant option; flush privileges; 
-Run the following from a command prompt in the project directory: mysql -urealstate -p < real_state_full.sql
-At this point you have the full development database schema and test data loaded for use by the app.

2.  
-I assume you have Ruby 2.2.3 installed already
-If you don't have bundler installed already, you will need to from command line: gem install bundler
-If you don't have the Ruby Development Kit install already you will need that: http://rubyinstaller.org/downloads/
--Once you have it downloaded, open it and choose a permanent location to extract it.
--Once extracted, go to the directory via command prompt and issue the following command: ruby dk.rb init
--Then run this command: ruby dk.rb install
-You will need to run the following from the project command prompt to get all the other dependencies: bundle install 
-To run the unit tests simply run the following from the project command prompt: rails spec
-Before running the app, you will need to install node.js if you haven't already, which can be downloaded from https://nodejs.org/en/
-Assuming you have a gmail account, set the following environmental variables: GMAIL_USERNAME=whatever@gmail.com  GMAIL_PASSWORD=yourpassword
--This will allowing the app to actually send emails like the sign_up confirmation email, otherwise you can just view the generated emails in the rails console.
-To run the app in an "API only" mode run: set REAL_STATE_APP_TYPE=API && rails s --port 3001
--This mode requires a "token" query string parameter with each request for authentication.  This can be retrieved via sql query "select email, role, api_auth_token from users;"  Or more easily by using the HTML version of the app and clicking on "Profile" after logging in.  The logged in users token will be listed on that page.
--Example: http://localhost:3001/properties.json?token=fHbJFzPUazQNttLh3LhU
-To run the app in an "HTML only" mode run: set REAL_STATE_APP_TYPE=HTML && rails s --port 3000
--Example: http://localhost:3000
--Pre-created user logins: admin@mail.com/password agent@mail.com/password customer_user@mail.com/password  Each one signifies a corresponding role.  If you sign up yourself, you will automatically be given a role of CUSTOMER_USER, the role with least access.  This can be changed by logging in as an admin, going to "Manage Users" and updating that users role.
-If running separate apps (one in API mode and one in HTML mode), you will need to copy the project to a separate directory and run it from there because of the server pid files.  If you get an error complaining about a pid file while trying to do this, just delete the server.pid file from the tmp/pids/ directory and then try again.
-To run the app having both available run: rails s 


3.  
I had to assume this was a "real estate" application.  The "secure" API didn't specify how it was to be secured, so I went with token authentication.
I went with a simple role-based authorization since the requirements didn't say how to create the three different types of users.  
Having the reports required to be PDF instead of say CSV or Excel was a bit weird.  The user can't do any extra data manipulation with a PDF report.
One of the requirements was "Real property address should be shown in google maps."  I didn't know if that meant you just wanted the marker to be the actual location of the property address, or if the address had to physically be shown on the google map.
I decided to play it safe and added an overlay of the property address onto the google map as well as show the actual location.

4.  
The main feedback I have is to make sure the name of the project reflects exactly what it should be.  
For instance "Real State" company could be some sort of local government company.  
Luckily I was able to assume that what was actually wanted was a "real estate" company app because of a few of the other requirements.  
Also, the fact that we are required to use "Wink" means that at least a portion of the work needs to be done in Windows or possibly linux, but the linux version of Wink does not appear to be working fully.
I do all my development (excepting for .Net projects) on Mac.  This means I had to set up an entirely new Windows Ruby environment and get things running on a bootcamp partition that I had installed.  
I don't know of any serious Ruby developers that use Windows for development, so this really bothered me.  "Wink" is also seriously old and outdated.  There are much better multi-platform solutions out there.
This was a fun project to develop though, and left a lot of the specifics for me to decide, which I liked.