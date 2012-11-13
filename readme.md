# emailbox

## The Email Gold Rush is coming, get your shovels at getemailbox.com

**Emailbox makes it easy for developers to build applications on top of email data. We handle all the hard parts of dealing with email (parsing, segmenting, searching, permissions) and provide a safe way for consumers to give out filtered email data. 

#### Why build emailbox?  

Progress in email clients has stalled. Everyone uses email differently, yet clients from Gmail to Outlook to Sparrow heavily restrict what developers can do, and don't offer many tools for development. It should be easier for a developer to build apps that affect every aspect of the email chain, and allow end users to determine how their client looks, what applications they want, and how efficiently they want to communicate. Rapportive, Boomerang, and Streak are example of awesome products/companies built on top of an email client, but I believe many more products and companies would exist if we had better tools to with which to work. 


### Features and Architecture  

#### Under development or planned

1. Straightforward API that handles the complexities of storing, queuing, searching, notifications, events, and permissions

1. Developer friendly microformat-esque creation ("packages") for communications across any email client, but with significant benefits for emailbox users

1. Easy installation of apps from a package manager similar to npm or yum

#### Packages

__status: planning__  
emailbox uses the standard email protocol, but will include a way of reading a JSON mime type out of the email. This JSON encoded string defines an app that can trigger events on the receiving client, both on the web and mobile. For example, emailbox users with the Todo application can add events to a friend's Todo list, and mark them off when they have been completed, all within the email client. Users without emailbox or the todo application would instead receive a Text or HTML version of the request that includes a link to click when the Todo item is done.

A package is very similar to a microformat, except with a focus on communication and the transmission of information, instead of display.


emailbox copyright 2012 Nicholas Reed
