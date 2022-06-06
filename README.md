# Seattle Grace

This repository requires and has been tested on Ruby v2.7.2 and is based on Rails 5.2.5

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up (and not before), push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* How far you got through the user stories
  * Please include any user stories you partially complete, for example "completed user stories 1 and 2, really close to completing 3"
* A reflection on how you felt you did with this challenge

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview

Seattle Grace is based off of Grey’s Anatomy, but you need NO knowledge of Grey’s Anatomy to complete this final.

Some of the initial migrations and model set up has been done for you.

* Hospitals have a 'name'
  * Ex: name: "Grey Sloan Memorial Hospital"
* Doctors have a name, specialty, and university that they attended
  * Ex: name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"
* Patients have a name and an age
  * Ex: name: "Denny Duquette", age: 39
* Hospitals have many Doctors
* Doctors belong to a Hospital
* Doctors can have many patients
* Patients can have many doctors

![Screen Shot 2022-06-05 at 6 13 15 PM](https://user-images.githubusercontent.com/99001315/172076381-600389be-1bf2-445d-93e3-addd6ad9e072.png)

## User Stories

```
User Story 1, Doctors Show Page
​
As a visitor
When I visit a doctor's show page
I see all of that doctor's information including:
 - name
 - specialty
 - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has
```
​
​
```
User Story 2, Hospital Show Page
​
As a visitor
When I visit a hospital's show page
I see the hospital's name
And I see the number of doctors that work at this hospital
And I see a unique list of universities that this hospital's doctors attended
```
​
​
```
User Story 3, Remove a Patient from a Doctor
​
As a visitor
When I visit a Doctor's show page
Next to each patient's name, I see a button to remove that patient from that doctor's caseload
When I click that button for one patient
I'm brought back to the Doctor's show page
And I no longer see that patient's name listed

NOTE: the patient record should not be deleted entirely
```

## Extensions

```
Extension: Patient Index Page
​
As a visitor
When I visit the patient index page
I see the names of all patients listed from oldest to youngest
```
