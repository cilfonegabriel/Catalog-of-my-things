# Ruby group capstone - Catalog of my things

## Description

In this project, we will create a console app that will help we to keep a record of different types of things we own: books, music albums, movies, and games.
Everything will be based on the UML class diagram presented below. The data will be stored in JSON files but we will also prepare a database with tables structure analogical to our program's class structure.


## General requirements

- Make sure that there are no linter errors.
- Make sure that we used correct Gitflow.
- Make sure that we documented our work in a professional way.
- Follow our list of best practices for Ruby.

### Project requirements

#### Logic

- Each class from the UML class diagram (./images/catalog_of_my_things.png) should be created in a separate .rb file.
- All associations (1-to-many relationships) and aggregations (parent-child relationships) between classes should be implemented.
- All properties visible in the diagram should be defined and set up in the constructor method. 
  Exception: properties for the 1-to-many relationships should NOT be set in the constructor method. 
  Instead, they should have a custom setter method created._
- All methods visible in the diagram should be implemented:
    - add_item method (in all classes that have that method)
        - should take an instance of the Item class as an input.
        - should add the input item to the collection of items.
        - should add self as a property of the item object (by using the correct setter from the item object).
    - can_be_archived?() in the Item class
        - should return true if published_date is older than 10 years.
        - otherwise, it should return false.
    - move_to_archive() in the Item class
        - should reuse can_be_archived?() method.
        - should change the archived property to true if the result of the can_be_archived?() method is true.
        - should do nothing if the result of the can_be_archived?() method is false.
    - can_be_archived?() in the Book class
        - should override the method from the parent class.
        - should return true if parent's method returns true OR if cover_state equals to "bad".
        - otherwise, it should return false.
    - can_be_archived?() in the MusicAlbum class
        - should override the method from the parent class.
        - should return true if parent's method returns true AND if on_spotify equals true.
        - otherwise, it should return false.
    - can_be_archived?() in the Movie class
        - should override the method from the parent class.
        - should return true if parent's method returns true OR if silent equals true.
        - otherwise, it should return false.
    - can_be_archived?() in the Game class
        - should override the method from the parent class.
        - should return true if parent's method returns true AND if last_played_at is older than 2 years.
        - otherwise, it should return false.
- Add unit tests for all implemented methods.

#### User interface

- Create a main.rb file that will serve as our console app entry-point.
- our console app, at the start, should:
    - Present the user with a list of options to perform.
    - Let users choose an option.
    - If needed, ask for parameters for the option.
    - Have a way to quit the app.
- The following options should be available:
    - List all books
    - List all music albums
    - List all movies
    - List of games
    - List all genres (e.g 'Comedy', 'Thriller')
    - List all labels (e.g. 'Gift', 'New')
    - List all authors (e.g. 'Stephen King')
    - List all sources (e.g. 'From a friend', 'Online shop')
    - Add a book
    - Add a music album
    - Add a movie
    - Add a game
 - All data should be preserved by saving collections in .json files.

### Database
- Create a schema.sql file with tables that will be analogical to the structure of the classes in our app. As we cannot implement inheritance in the database tables - add all properties and associations from the parent Item class as table columns to all tables based on the child classes. Thanks to that it can be used to store data in the future.

### Project documentation

Once we have finished the development of the project, we should record a video presenting the features of the project we built. It is a video with a **maximum length of 5 minutes**. The content of the video should include:

- A description of the project.
- A demo of the project features.
- we should also highlight some interesting piece of code or something we built that we are very proud of.
- we all should appear in the video and talk about the project.

## Additional requirements

*These are all optional, but if we're interested in exploring this topic further, feel free to implement them. Any exploration here should be done outside program time.*

- Think about other options we might implement in our console app, e.g:
    - remove a selected book
    - add genre to selected book
    - ...

@ivanmvh