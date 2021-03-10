Welcome to the Study Hall!
This App is a place where students can go to share resources and enroll in different courses. It's an ideal place 
to share information that is related to specific subjects, creating a focused experiencce for the user to 
have different sources of a course in one convenient place. A user can enroll in a course and be able to post about 
Students can create different courses along with that so that they can study different subjects as they please!




To get started: 
Make sure you run bundle install or use your favorite bundler. If you run into any issues with any of the gems, 
make sure you intall the necessary gems in your personal machine order for the app to function. 

Once everything is installed, you will need to create a ".env" file and generate a random alphanumeric code. 
This will guarantee that the session secret is kept a secret.

In the main directory, run `touch .env` and in that file write:

ENV[SESSION_SECRET] =  ## alphanumeric value goes here ##



For the alphanumeric value, you can go into your rake console and type `SecureRandom.hex(40)`. This will generate a string of random characters, which you can copy and paste into your `.env` file, setting that as the session secret. 

Create a `.gitignore` file by running `touch .gitignore` in your main directory. You can use a template from 
https://www.toptal.com/developers/gitignore. From there, just copy and paste it into your `.gitignore` file.





To run the application, you will need to run "shotgun" in your terminal. This will start the server.
On your browser, open the URL 'localhost9393' and you should see the application so long as the server is still running.



