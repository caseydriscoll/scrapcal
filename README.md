# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Photos:



Prints:

Every 'Photo' should end up on a 'Print' at least once.

A standard 'Print' is comprised of two 'Photos', 'left' and 'right'

At first there are no 'Prints'. The user should be able to generate the initial set of 'Prints' by clicking a button in the 'Projects#edit' screen.


Project:

A 'Project' is a collection of 'Prints' that are downloaded at one time, typically bundled as a zip.

A 'Project' has zero or many 'Prints' and a 'Print' belongs to zero or many 'Projects'

A user should be able to add/remove 'Prints' to 'Projects' without deleting the actual 'Print.'


Generate all Prints:

When a user is creating a Project for the first time, on the Project edit screen they should be able to click a button to 'Generate all Prints.'

This will:
- Count the number of all Photos
- Create 1 print per 2 Photos in order by date
- Attach Print to Project


