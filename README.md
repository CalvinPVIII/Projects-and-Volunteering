# _Volunteer Center_

#### _Simple Managment of Volunteers and Projects, 1/10/2020_

#### By _**Calvin Will**_

## Description

_Volunteer Center is a basic web application that allows for a user to create, read, update and delete projects for any organizaion. They can also create, read, update, and delete volunteers for any projects that exist within the database._

## Specs
| Behavior  | Input  | Output  |
|---|---|---|
| A project can be created in the database and displayed on the page  | Walk dogs from the animal shelter  | Projects:  Walk dogs from the animal shelter |
| A person can volunteer for a project  | Rob  | Volunteers: Rob  |
| The name of a project can be updated  | Feed dogs from the animal shelter  | Projects:  Feed dogs from the animal shelter  |
| A person can update their name  | Bob  | Volunteers: Bob  |
| A person can delete their volunteering commitment  | Delete Volunteer  | Currently no on is volunteered  |
| A project can be deleted  | Delete Project  | Currently there are no projects to display  |

## Setup/Installation Requirements
**PSQL and Postgres is required for the database**
* _Clone from Github_
* _Using terminal navigate to the project folder_
* _Run the command "bundle install"_
* _Run the command "createdb volunteer_tracker"_
* _Run the command "psql volunteer_tracker < database_backup.sql"_
* _Run the command "ruby app.rb"_
* _In a web browser, navigate to "localhost:4567"_

_{Leave nothing to chance! You want it to be easy for potential users, employers and collaborators to run your app. Do I need to run a server? How should I set up my databases? Is there other code this app depends on?}_

## Known Bugs

_Currently there are no known bugs_

## Support and contact details

_For questions, comments, or concerns, you can reach me at calvinp003@gmail.com_

## Technologies Used
* _Ruby_
* _Postgresql 12_

### License

*Licensed under MIT*

Copyright (c) 2020 **_Calvin Will_**
