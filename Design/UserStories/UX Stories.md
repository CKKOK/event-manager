Problem Statements
==================
1.  As a __groom-to-be__, I have __too many events happening__ on the big day and wish they would be __organized in an glanceable and actionable manner__.
2.  As a __first-time-groom-to-be__ (how many aren't first-timers?!), I don't know about the __logistics__ involved in the entire wedding process and __how much resources I need to budget for it__.
3.  As a __brother of the groom-to-be__, I want to __have a central communication__ so i can __effectievly coordinate the actual day event with much ease__.
4.  As a __couple__, we want __creative ideas for our wedding__ to make it a really memorable once-in-a-lifetime bang of an event!
5.  As a __couple__, the __wedding banquet guest invitation, registration, and table assigning is very time consuming__.
6.  As a __guest__ with a lot going on in my schedule, I'm really afraid that I'll __forget an important friend's wedding__!
7.  As a __guest__, I __don't know how much ang bao money__ I should give...
8.  As a __invited guest of the groom__, I want to __be able to access the photographer's photography as well as other user's upload at a central location__ so i can __keep the memories of the wedding that i want__.
9.  As a __wedding merchant (photographer)__, I want to __have a central platform__ so i can __effectively reach out to couple planning to get married__.


POV Statements
==============
Our service can address the above needs with the following functions...
1.  Notifying of guests via email, and RSVP from guests through that email (inc. dietary requirements, +1, kids, parking needs)
    *   Guest registration and (graphical) table allocation
    *   (Good-to-have) Ruby QR Code Generator: https://github.com/whomwah/rqrcode and HTML5/JS QR Code Reader: https://github.com/schmich/instascan 
2.  For each role, a timeline panel and an update / next-action-to-take panel. Couple / another admin can have an overview.
3.  Photography Component: Couple, photographer, guest, wedding planner (assigned by the couple)
    *   Photo uploads by photographer and guest. Admins can delete all. Guests can delete their own photo.
    *   Photo filters when displayed, but not direct editing of the photo itself

User Stories (For Service Usage) (To be fleshed out into specifics for wireframe design)
========================================================================================
1. (JT) Couple registration
2. (JT) Uploading of invitation list
3. (CK) Invitees' forms (inc. dietary requirements, +1, kids, parking needs) for RSVP. See [RSVP - Yes](../Wireframes/RSVP - Yes.png?raw=true) and [RSVP - No](../Wireframes/RSVP - No.png?raw=true) for examples.
    *   From the email, the invitee taps on either a "Congratulations! I'll be right there!" or a "Terribly sorry but I can't be there" option from the email. If the invitee would like to attend, the couple will need some details from the invitee. If not, perhaps the invitee might not be able to attend due to scheduling conflicts but would still like to leave the couple his/her well wishes.
    *   *"Congratulations! I'll be right there!"*
        *   The invitee is directed to a form that has his/her name and contact pre-filled. The cover page of the form is a picture of the couple thanking him/her, which slides up to reveal the form. The data that needs to be collected are:
            *   Dietary needs - Halal, vegetarian, others (please specify)
            *   How many others is he/she bringing along? Option for providing names.
            *   Bringing babies along? How many booster seats needed? No food will be catered for babies.
            *   Bringing toddlers along? Food will be catered for toddlers.
            *   Require carpark?
    *   *"Terribly sorry but I can't be there"*
        *   The invitee is directed to a simple form with a single field. There is no cover page. It simply says "Aw would you like to leave the couple a lovely message instead?", in case he/she would like to offer a reason for absence. The cursor is autofocused on the input text area. There are 2 buttons below - "No I'm good", and "Yup send this" (which is initially disabled, then enabled as soon as there is input in the box).
4. (JP) Online RSVP-ed guest list (for registration purposes on the big day) for 
![Attendance Sheet](attendanceSheet.png?raw=true "Attendance Sheet")
* One page web page to display the full attendance list
* Two drop down tab on the right with fixed position to display live count for total guests and individual table filled rate
* Table which consist of the whole list of rsvp guests
* Search function to search for guest by name or table number
* Sorting function to sort rsvp list by name or table
* One click attendance taking tab which will toggle from red *"I am coming soon"* to green *"I'm Here!"*. Green status will be automatically sorted at the bottom of the rsvp list.

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
