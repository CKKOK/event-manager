# Project 3 (Need a name)

# Useful readings for the design process
1. User stories - https://codingsans.com/blog/user-stories-with-templates
2. POV Statements - https://dschool-old.stanford.edu/groups/k12/wiki/41a18/POV_.html
3. DT Process: Problem Definition - https://www.interaction-design.org/literature/article/stage-2-in-the-design-thinking-process-define-the-problem-and-interpret-the-results
3. DT Process: Defining the Challenge - https://www.interaction-design.org/literature/article/define-and-frame-your-design-challenge-by-creating-your-point-of-view-and-ask-how-might-we

# Ideas
1. ~~Trip destination / itinerary one-stop recommendations and planner. Similar to tripadvisor?~~
 * ~~How to differentiate from Tripadvisor?~~
 * ~~Adding air ticket price prediction service. How will users react to this? Will they take it up?~~
 * ~~Planning / monitoring of trip in greater detail via timelines. Good value for user, e.g. takes a lot of mental stress away from vacations. But how will notifications be done?~~
2. ~~Events management app~~ *Scale might be too large for a 1 week project*
 * ~~What are all the different endpoints to the app?~~
 * ~~How does the ERD look like? Will it be too massive?~~
3. __Spinoff of events management app: eWedding planning / events registration app with QR code scanning capabilities__
4. ~~Equipment / venue rental service, combined with geolocation data and B2C communication~~ 
5. ~~Price and stock collation of IT equipment, i.e. advertising platform for IT vendors.~~ *As another advertising platform, the value proposition to both vendors and customers is still unclear.*
 * ~~User stories from the vendors and buyers? What problem does this solve for both parties? Note: Some shops do advertise their stuff on Carousell, so why aren't the rest doing it? Need to understand the problems they face first.~~
6. ~~Elder companion / monitoring / chat app~~
7. ~~User submitted video app (YouTube)~~
8. ~~Coding game app~~
9. ~~E-commerce site~~

# Tech Stack
1. Server:
  * Ruby and Rails
  * Devise
2. Client:
  * PWA for notifications???

# Tasks
1. Front end
  * Design, i.e. moodboard
  * Standard new / edit / index / show views
  * SCSS
2. Back end
  * CRUD functionality
  * API implementation
  * Writing tests (using rspec)

Service Components
(What are the front-ends?
What UI elements are needed?
What are their functions?)
============================
1.  Landing / login page
2.  User registration
3.  HTML email form
4.  RSVP - Yes form
5.  RSVP - No form
6.  Guest list for attendance taking


APIs Needed (No authorization)
==============================


APIs Needed (Require authorization)
=======================================
1.  Pushing of invitation list to the database (returns success indicator)
2.  Pushing of a guest's RSVP data to the database (returns success indicator)
3.  Retrieval of RSVP Yes guests (returns success indicator, and the guests who replied yes, along with their dietary requirements etc)
4.  Retrieval of RSVP No guests (returns success indicator, and the guests who replied no)
5.  Marking a guest as present (returns success indicator, the number of guests present, and number of guests in total)
6.  Marking a guest as absent (returns success indicator, the number of guests absent, and number of guests in total)
