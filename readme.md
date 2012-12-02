# emailbox  

Emailbox is trying to make it easier for developers to build applications on top of email data. It handles all the hard parts of dealing with email (parsing, segmenting, searching, permissions) and provide a safe way for consumers to give out filtered email data. 


### Features and Architecture  

#### Under development or planned

1. Straightforward API that handles the complexities of storing, queuing, searching, notifications, events, and permissions 

1. Developer friendly microformat-esque creation ("packages") for communications across any email client, but with significant benefits for emailbox users 

1. Easy installation of apps, as well as apps-within-apps

#### Outgoing Packages

emailbox uses the standard email protocol, but will include a way of reading a JSON mime type out of the email. This JSON encoded string defines an app that can trigger events on the receiving client, both on the web and mobile. For example, emailbox users with the Todo application can add events to a friend's Todo list, and mark them off when they have been completed, all within the email client. Users without emailbox or the todo application would instead receive a Text or HTML version of the request that includes a link to click when the Todo item is done.

A package is very similar to a microformat, except with a focus on communication and the transmission of information, instead of display.


emailbox copyright 2012 Nicholas Reed
