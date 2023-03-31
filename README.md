<a name="readme-top"></a>

<div align="center">

  <img src="./box.png" alt="logo" width="140"  height="auto" />
  <img src="./catalog_of_my_things.png" alt="logo" width="640"  height="auto" />
  <br/>

  <h2><b>Catalog of my things</b></h2>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo & Project Presentation](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Catalog of my things <a name="about-project"></a>

**Catalog of my things** In this project, you will create a console app that will help you to keep a record of different types of things you own: books, music albums, movies, and games. Everything will be based on the UML class diagram presented below. The data will be stored in JSON files but you will also prepare a database with tables structure analogical to your program's class structure.


 </br>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<ul>
  <li>Ruby</li>
  <li>Rspec</li>
</ul>

<!-- Features -->

### Key Features <a name="key-features"></a>

Logic

    Each class from the UML class diagram should be created in a separate .rb file.
    All associations (1-to-many relationships) and aggregations (parent-child relationships) between classes should be implemented.
    All properties visible in the diagram should be defined and set up in the constructor method. Exception: properties for the 1-to-many relationships should NOT be set in the constructor method. Instead, they should have a custom setter method created.
    All methods visible in the diagram should be implemented:
        add_item method (in all classes that have that method)
            should take an instance of the Item class as an input.
            should add the input item to the collection of items.
            should add self as a property of the item object (by using the correct setter from the item object).
        can_be_archived?() in the Item class
            should return true if published_date is older than 10 years.
            otherwise, it should return false.
        move_to_archive() in the Item class
            should reuse can_be_archived?() method.
            should change the archived property to true if the result of the can_be_archived?() method is true.
            should do nothing if the result of the can_be_archived?() method is false.
        can_be_archived?() in the Book class
            should override the method from the parent class.
            should return true if parent's method returns true OR if cover_state equals to "bad".
            otherwise, it should return false.
        can_be_archived?() in the MusicAlbum class
            should override the method from the parent class.
            should return true if parent's method returns true AND if on_spotify equals true.
            otherwise, it should return false.
        can_be_archived?() in the Movie class
            should override the method from the parent class.
            should return true if parent's method returns true OR if silent equals true.
            otherwise, it should return false.
        can_be_archived?() in the Game class
            should override the method from the parent class.
            should return true if parent's method returns true AND if last_played_at is older than 2 years.
            otherwise, it should return false.
    Add unit tests for all implemented methods.

User interface

    Create a main.rb file that will serve as your console app entry-point.
    Your console app, at the start, should:
        Present the user with a list of options to perform.
        Let users choose an option.
        If needed, ask for parameters for the option.
        Have a way to quit the app.
    The following options should be available:
        List all books
        List all music albums
        List all movies
        List of games
        List all genres (e.g 'Comedy', 'Thriller')
        List all labels (e.g. 'Gift', 'New')
        List all authors (e.g. 'Stephen King')
        List all sources (e.g. 'From a friend', 'Online shop')
        Add a book
        Add a music album
        Add a movie
        Add a game
    All data should be preserved by saving collections in .json files.

Database

    Create a schema.sql file with tables that will be analogical to the structure of the classes in your app. As you cannot implement inheritance in the database tables - add all properties and associations from the parent Item class as table columns to all tables based on the child classes. Thanks to that it can be used to store data in the future.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Project Presentation <a name="live-demo"></a>

- Project Presentation [here](https://drive.google.com/file/d/1Ym9vJvlVVk0NbdvNCqQ9dFjySIQOwYbo/view?usp=sharing)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

  ## To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Git
- A GitHub account
- Ruby installed

### Setup

Clone this repository to your desired folder:

```sh
git clone https://github.com/cilfonegabriel/Catalog-of-my-things.git
```

- Access the cloned directory with:

```sh
cd Catalog-of-my-things
```

- Open it with your favorite code editor or with the live server

### Install

Use the following command to run the project:

```sh
bundle install
```

### Usage

To run the project, execute the following command:

```
ruby main.rb
```

### Run tests

To run tests, run the following command:
```
rspec spec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>

👤 **Gabriel Cilfone**

- GitHub: [Gabriel Cilfone](https://github.com/cilfonegabriel)
- LinkedIn: [Gabriel Cilfone](www.linkedin.com/in/gabriel-cilfone/)

👤 **Francisco Quintero**

- GitHub: [@HunterX-7](https://github.com/HunterX-7)
- Twitter: [@franquin07](https://twitter.com/franquin07)
- LinkedIn: [Francisco Quintero](https://www.linkedin.com/in/francisco-asis-quintero-cede%C3%B1o/)

👤 **Ivan Martinez**

- GitHub: [@ivanmvh](https://github.com/ivanmvh)
- Twitter: [@imprivado](https://twitter.com/imprivado)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ivan-martinez-von-halle/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Add more interactivety to the function.
- [ ] Add more unique features.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/cilfonegabriel/Catalog-of-my-things/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

I really enjoyed working on this project. If you like it show your support by giving a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Acknowledgments -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Hat tip to anyone whose code was used.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
