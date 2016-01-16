# Groopify code challenge

##Web App skeleton -- pets app.  

**Notes**

*The app was built up from scratch using TDD. 
All the gems/frameworks required for the exercice were integrated in the app.*


**Development process**

1. ```TDD
Because of the reasonable given deadline for delivering the exercice, I tried to build the app using TDD, even if this way was slower, in order to make it more solid, instead of using a Test Unit approach at the end of job.
I used RSPEC as asked, and also FACTORYGIRL upon it, for a better solution.```

2.  ```The authentication was done with DEVISE. And a simple functionality was implemented in the nav-bar to get in or out of the app depending on the logging of the user.```

3.  ```The framework used for the front-end was BOOTSTRAP.```

4.  ```The AJAX called asked to be used was done in the show action, in which the user clicks to get the file of a specific pet. The construction of the responded data was included in a modal view via javascript + Html dinamically.```

5.  ```The PAPERCLIP gem was added at the end, to load thumbnails of the pets```

###Difficulties creating the app


```In this view user can see different renderings of the phenomena using torque visualizations.```

**Shared maps**

```In this view user can see other user´s maps, but only the ones the author shares.
You can share your maps by first logging.```

**Creating a new map**

```If you are a logged user you can get access to "my Maps" tab, in which you´ll be able to do your own searches.
You´ll go through a form with different inputs.```

  - **username**  ```If you are a CartoDB user you could get data from you own datasets through your username.
  By default if this field is empty the form will use my own user CartoDB username to access my ufo dataset through the their javascript Api```
  - **table_name**  ```At the moment all the info is in a table called "ufo", to be typed in the field.```
  - **city**  ```You might find matches for your search by a city from USA filling the city name in this field.```
  - **state**  ```you might find matches for your search by state from USA filling the field with the first 2 capitalized letters of the state.```
  - **description**  ```A description for your map is requested before saving it.```
  - **dates**  ```If you want to see the matches for your search for a specific date you fill one of the 2 datafields.
  If you want to find results between 2 specific dates, you must use both given form datefields.```
  - **shared**  ``You as a user of the platform are given the option of sharing maps, so anybody wether user of the platform or not could see you shared maps. By default the private feature is also given.```

```You can now get a preview of your map or store it.```


###Behind the scene Technology / Frameworks
**Platform`s backend** is done with Ruby on Rails

**Platform`s frontend** is done with Bootstrap

**Ruby Gems** Devise Mechanize Rspec

**Api´s** CartoDB JavaScript Api
