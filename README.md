# OMDB Project

# Project Architecture

MVVM:  The project folder is structured based on the role of the files into 
 - Models
 - Views
 - ViewModels
 - Controllers
 
Binding between the model and the UI can be achieved in multiple ways and I have followed a very simple approach for this task. Used property observer to bind the model and the view. 

### Observable
Libraries such as RxSwift helps achieve the binding in a reactive way. I have followed a very primitive approach towards it for the sake of simplicity and understanding. I created an Observable (Generics) which can be used to listen for any object changes. 

For the lack of time I didn't spend too much time on the UI and the number of fields displayed in the screen is limited to one. 

### Configuration
I have used a Configuration class which picks up environment based values. Uses preprocessor macros that can be defined in "Active Compilation Conditions" under "Swift Compiler - Custom flags".

### Unit Tests
I have kept this to a minimum and covered a basic RestApi test and couple of ViewModel test which uses the mocked rest api service. 

### Pods
I used Alamofire for its extensive feature set and for providing a pleasing way to implement Rest api calls :) You will be able to appreciate that when you take a look at the Router, I personally love the way it helps in creating a URLRequest.

### Git
I have used the master branch to push my changes, ideally in real world you will want to have your branches segregrated accordingly.

### Implemented feature
 - Fetched the list of movies and displayed in a grid
 - On tapping the movie the user is taken into a detail page where the title of the movie is displayed, I haven't fetched the /movie/{movie_id}. Ideally the steps would be very similar to what is done for the list with its own view model and the corresponding bindings to the other fields.
 - Unit test for APIService and List View model with mock api service
