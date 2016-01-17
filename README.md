# Groopify code challenge

##Web App skeleton -- pets app.  

**Notes**

*The app was built up from scratch using TDD. 
All the gems/frameworks required for the exercice were integrated in the app.*


**Development process**

1.  ``` Because of the reasonable given deadline for delivering the exercice,
 I tried to build the app using TDD, even if this way was slower,
 in order to make it more solid, instead of using a Test Unit approach at the end of job.
 I used RSPEC as asked, and also FACTORYGIRL upon it, for a better solution.```

2.  ```The authentication was done with DEVISE. And a simple functionality was implemented in the nav-bar to get in or out of the app depending on the logging of the user.```

3.  ```The framework used for the front-end was BOOTSTRAP.```

4.  ```The AJAX called asked to be used was done in the show action, in which the user clicks to get the file 
    of a specific pet. The construction of the responded data was included in a modal view via javascript + Html dinamically.```

5.  ```The PAPERCLIP gem was added at the end, to load thumbnails of the pets```

**Key points**


**TESTING**

Because of the different gems used in the project, as I added each of them,
for the validations already tested, I had to add a new layer upon them to make the tests keep
working effectively.
I`m talking about FactoryGirl, Devise and Paperclip, additions.
The integration of Devise, to make all the logic of the Pet Model working with the condition
of User being logged in  was difficult to achieve.
Same thing when I added Paperclip, because added some extra fields to the model attached to.

**MODEL vs CONTROLLER**

Though the theory of the MVC states that the logic should be in the model side,
given the easiness of the project, I prefered an easier approach, keeping the funcionality 
for all the CRUD operations in the Controller. Further logic should be implemented in the Model. 
I consider that for the purpose of the es¡xercice the Controller is thin enough. 

**RELATIONS BETWEEN MODELS**

The 1-->n relation between the User and Pet model is considered. 
I didn`t nested the routes of both models cause the exercice didn´t say we had to.

**AJAX**

I only did one Ajax call, in order to get the details of a pet. 
I implemented the functionality of adding or not the Edit/Delete buttons 
of the Pet instance in the javaScript file,
by checking first the currentuser id against the user id of the pet owner. 
I re-construct the html and append it with JQuery. I show the details of the pet in a modal window.

###SUMMARY - Up´s & Down´s

**TESTING**
I´m happy to be able to use gems I didn´t work with before, such as Factorygirl or Paperclip.

**PAPERCLIP**
I used the Gem in the project as suggested, but I´m not happy with the result. 
Though I followed several tutorials and blogs I didn´t understand properly the way it stores the files,
and access it later on. This is a task to be done in the future. Anyway, I managed to load-show the files.

**EDIT FUNCTION**
In the last part of the project, as I added Paperclip, the EDIT functionality finished working properly.
I think is a problem with the form strong params, though for the creation of a new Pet is working ok.
  If you Git Check to a previous commit you can see that the EDIT function the exercice included was 
  working perfectly,
  and was just by adding Paperclip that started failing.

**AJAX**
I only did one Ajax call, in order to get the details of a pet.
I implemented the functionality of adding or not the Edit/Delete buttons 
of the Pet instance in the javaScript file, by checking first the currentuser id
against the user id of the pet owner.
I re-construct the html and append it with JQuery.
I show the details of the pet in a modal window.

###Behind the scene Technology / Frameworks
**Platform`s backend** is done with Ruby on Rails

**Platform`s frontend** is done with Bootstrap

**Ruby Gems** Devise Mechanize Rspec

**Api´s** CartoDB JavaScript Api
