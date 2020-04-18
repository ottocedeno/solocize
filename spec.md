Name:

- Solocize

Description:

- An app where users can make short custom workouts to do at home during isolation.
- They can see other workouts from the community
- They can create/edit/delete their own workouts
- They can submit exercises to the community so all users can use

Requirements:

- DB / Model
  - User
    - First Name and Last Name (can’t be empty)
    - Username (unique)
    - Password (encrypted)
    - Has_many Workouts
  - Workout
    - Name
    - Short Description
    - Minutes
    - Belongs_to User
    - Belongs_to Workout_exercises
    - Has_many Exercises through Workout_exercises
  - Exercise
    - Name
    - Rep_count
    - Belongs_to exercise_category
  - Category
    - Name
    - Has_many Exercises
  - Workout_exercises (join table)
    - Workout_id
    - Exercise_id
- Controllers
  - Application_controller
    - Homepage
      - Redirect to /login
    - Login process
    - Sign up process
  - Workouts_controller
    - Workouts Home (after sign in)
    - User create a new workout
    - User edit an existing workout they own
    - User delete an existing workout they own
    - User can see any individual workout page
- Views
  - Index (home)
  - Signup form
  - Login form
  - User
    - Show a user page
      - User name
      - List of workouts they own
  - Workout
    - Index
      - Featured Workout
      - My Workouts
      - Community Workouts
      - Icon to add a new workout
      - Log out
    - Load new workout form
    - Load edit workout form
    - Show existing workouts
  - Exercise
    - Index
      - List of all exercises
    - Show form to add an exercise to the database

Plan of Attack

- [x]Plan out Application structure
- [x]Install Corneal / Generate skeleton
- [x]Link to GitHub
- [x]Clean up Corneal layout
- [x]Build one Model at a time
- [x]User
- [x]Workout
- [x]Exercise
- [x]Category
- [x]Workout_exercises
- [x]Test models thoroughly
- [x]Load in Seed Data into the DB
- []Wireframe views
- [x]Login / Sign up views
- [x]/workout/index view
- [x]Workout Create
- [x]Workout Edit
- [x]User Show
- [x]User Index
- [x]Exercise Create
- [x]Exercise Show
- []Create Controllers and corresponding views one at a time
- [x]Login / Sign up process
- [x]Workouts
- [x]Workout Show
- [x]Workout Create
- [x]Workout Edit
- [x]Workout Delete
- [x]User Show
- [x]User Index
- [x]Exercise Create
- [x]Exercise Show
- [x]Test persistence, core functionality
- [x]Style views and layouts to design specs
- [x]Have a few friends test it

Flatiron Checklist

Specs:

Specs:

- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users
- [x] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
