The Gossip Project
The Gossip Project is a simple web application built with Sinatra that allows users to create, view, and explore gossips. Users can add new gossips, browse a list of existing gossips, and view individual gossip profiles. This README provides an overview of the project's structure and functionality.

Project Structure
lib: This directory contains the core components of the project.
gossip.rb: The Gossip class definition with methods to handle gossip creation, storage, and retrieval.
controller.rb: The main Sinatra controller that defines the application's routes and interactions between the views and Gossip class.
views: Contains the ERB templates for the project's web pages.
index.erb: The homepage that displays a list of gossips and allows users to navigate to individual gossip pages.
new_gossip.erb: A form for creating new gossips.
show.erb: The page that displays individual gossip details.
db: A directory where gossips are stored in a CSV file.
gossip.csv: The CSV file where gossips are saved.
Functionality
Homepage (index.erb)
The homepage displays a list of all gossips stored in the gossip.csv file.
Each gossip is displayed with the author's name and content.
Users can click on a gossip to view its individual page.
Create New Gossip (new_gossip.erb)
The "Add a New Gossip" link on the homepage takes users to a form where they can submit a new gossip.
Users must provide an author's name and gossip content.
After submitting the form, the new gossip is saved to the CSV file, and the user is redirected to the homepage.
Individual Gossip Page (show.erb)
Each gossip has its individual page where users can view detailed information.
The page displays the gossip's author and content.
Users can return to the homepage by clicking a "Back to Gossips" link.
Routing
The application uses dynamic URLs to allow users to access individual gossip pages.
For example, /gossips/1 will display the details of the first gossip.
The routing is handled in the controller.rb file.
Running the Application
Ensure you have Ruby installed on your system.
Install the required gems using bundle install (make sure you have a Gemfile with the necessary gems).
Run the application with the command ruby controller.rb.
Access the application in your web browser at http://localhost:4567.
Dependencies
Sinatra: A lightweight web application framework for Ruby.
CSV: Used to read and write gossips to a CSV file.
Rerun: A tool for automatically restarting the Sinatra application during development.
Puma: A web server for running the Sinatra application.
Contributions
Feel free to contribute to this project by submitting pull requests or reporting issues. We welcome any improvements, bug fixes, or new features to make The Gossip Project even better!

Project
This project is under the supervision of THP
