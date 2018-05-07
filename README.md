
# dropkitchen-challenge


This is the project to the DropKitchen challenge described below.

[![Build Status](https://travis-ci.org/lucascorrea/brewdog-challenge.svg?branch=master)](https://travis-ci.org/lucascorrea/brewdog-challenge)
[![codecov](https://codecov.io/gh/lucascorrea/brewdog-challenge/branch/master/graph/badge.svg)](https://codecov.io/gh/lucascorrea/brewdog-challenge)
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat"></a>

## Demo

![Brewdog Demo](http://www.lucascorrea.com/images/brewdog1.gif)
![Brewdog Demo](http://www.lucascorrea.com/images/brewdog2.gif)

## Running:

Execute `pod install`

`CMD + u` will run all test cases via Quick and Nimble


## Build:

- Xcode version  9.3

- Project pattern MVVM

- Swift 4.1


#### Drop - iOS Code Challenge

Solve the Brewdog Beer Challenge at home spending as much time & effort as you wish.

##### Brewdog Beer Challenge

Build an iOS app that lists a number of beers from the Brewdog public API. The app must also provide a detail view for a beer. The app must keep track of the ingredients and methods used. The UI, UX and implementation details are at the discretion of the candidate.

> Note: Work through the business requirements one by one, please don't feel the need to complete them all.

##### Beer List Screen

Fetch a small number of beers and display them in a list. Each item should show a few critical details:
- Image Name
- ABV Description
- Beer Details Screen
- Image
- Name
- ABV

Description

Display all Hops in a list Display all Malts in a list Display all Methods in a list
Business Requirements

1. Implement beer details as follows:
For each element of each list (i.e. Hops, Malts & Methods), a button with two possible states - IDLE and DONE - should be present.

The buttons should start in the IDLE state.
When the button is tapped, there is a transition to the DONE status, indicating that the ingredient has been used or the method has been applied.
In the case where a method has a duration, when the button is tapped a countdown timer will start for the duration. While the countdown is running if the user taps on the button again the timer will be paused. If the user taps on the button while it is paused, the timer will resume. When the countdown finishes, the button will transition to the DONE state. The button in this case needs two extra states, RUNNING & PAUSED.

2. Implement hop ordering as follows:
A hop element with the attribute add=middle can’t be DONE until all the hops with add=start are done.
A hop element with the attribute add=end can’t be DONE until all the hops with add=middle are done.

##### Technical Requirements

1. Use Swift 4.
2. Try to minimize the number of dependencies. (Networking and JSON parsing libraries are
fine.)
3. We do care about SOLID principles, especially the single responsibility. Each requirement
should be properly encapsulated and the architecture should allow the developer to add new business requirements, not necessarily involving changes the UI, but just adding a new encapsulated component.
4. Any business logic should be unit tested.
5. The app should be ready to accept a beer that has hundreds of ingredients or methods.
6. Include a README file with instructions to run the project. In this file, also mention your
architectural decisions, known issues, dependencies or anything else that you think is important.

##### Public API

The beer list can be accessed through the PUNK API: https://punkapi.com/documentation/v2
Feel free to use attached response.json file if you need to develop offline or in case you have any problems with the public API.
