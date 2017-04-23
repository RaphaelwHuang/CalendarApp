# Project 6
### Hang Time - Ruby on Rails Project
Hang Time is a calendar app that wishes to make scheduling group meetings
easier.

#####Major Functionality:
* Users can create events which are added to a personal calendar
* Users can join Groups
  * Group members can view eachothers events
  * Group members can view eachothers profiles

### Program Execution
First, using the cd command to the file: calendar_app. Then you need to install the ruby gem by using "bundle install". The third step is to migrate the database by using rake, do "bundle exec rake db:migrate". You will see a message that said "=> Rails 4.2.8 application starting in development on http://localhost:3000". Open any web browser and enter http://localhost:3000. You will see our web app, the Hang Time! You can use Ctrl-C to shutdown server.

### Roles
* Overall Project Manager: Jenn Alarcon
* Coding Manager: Sunny Patel & Kenton Steiner
* Testing Manager: Tony Su
* Documentation: Raphael Huang

### Key Contributions

##### Sunny Patel (@SP) - Back-end/Support
* Implemented whole schema
* All things related to the models
* General schema modifications
* Implemented Devise with @KS
* Implemented all things related to devise (routes, controllers, model, views)
* Collapsible forms
* Implemented Group Controller with @KS
* Refracted code. Major revisions include
  * Initial Calendar commit
  * Controller code
  * Styling so that it utilized more Bootstrap
  * Buttons to work in Firefox
* Active comms to provide team with bug-support


##### Jenn Alarcon (@JA) - Stylist
* Installed bootstrap, and set up universal styling
* Made modifications to routes, added to/modified group controller, and views
* Created partials for adding event, creating/joining group
* Navigation bar, header and footer
* Routing modifications (when user logs in)
* groups home page and personal page layout
* Displaying proper events on calendar, and distinguishing between events
* Active comms on Slack

##### Kenton Steiner (@KS) - Back-end/Profile
* General schema modifications
* Styling and editing for the pages in views for groups, users
* Editing the navigation bar in the header
* Modified controller methods for groups, comprises
* General routing modifications
* Set devise settings
* Created Static pages about and contact
* Created button/skeleton for promote, demote, remove
* Homepage styling
* Implemented Group Controller with @SP
* Added attributes to User model
* Added paperclip functionality for profile photos
* Added view profile page, configured routes
* Added stying for forms
* Added bio attribute to groups, reconfigured controller and views to accomodate these changes
* Active comms on Slack



##### Raphael Huang (@RH) - Calendar/Stylist
* Added basic styling for events, calendar
* Made modifications to routes, model and views
* Modified controller methods for personal
* Created helpers for events, groups and personal
* Created calendar on personal page
* Created calendar on group page
* Implemented all things related to the event controller
* Realized the function that all group members' events can be added to group calendar
* Realized the function that all group meetings can be added to personal calendar
* Active comms on Slack

##### Tony Su (@TS)
* Create Static page help
* Styling Static page help
* Create function to check if the first name entered by user is valid
* Create function that only allow logged in user to access the web pages.
* Create function that check if there is time conflict among user's events.


### Test Plan
The final project is biggest project we have worked on so far. The size of code posts a great challenge on testing. Most of the testing we did is system test. We will go to our web site and test every feature to make sure everything runs as expected. To test our website, you should first sign up. Then, you can create as many new events as you want. You can see the events on calendar on the home page. If you wish to see the events as a list, click view event to go to event page. You can destory some random events to test the destory feature or update some events. To test the group feature, creating a group by clicking the create group button. You can add new group meetings and see them on your calendar. You can create additional users and add them to your group. You can promote those users or remove them.

### Bugs
We couldn't get the calendar to display from 0:00-24:00 and to show each events organized. I (SP) believe this would've been easier to do if we started over and instead started with a calendar that was empty, and had users fill in the calendar that way. However, we decided to stick with this version because of time constraints.