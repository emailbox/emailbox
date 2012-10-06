# emailbox

> emailbox is a set of building blocks for developers to create a simple and extendable email client. 

The goal of emailbox is to be the most developer friendly and versatile email and communication platform. By showing emailbox at this early stage, I hope that other developers will realize the potential inherent in the idea and get excited to contribute with code, designs, criticisms, or suggestions. 

Contact nick at [nick@getemailbox.com]() 

#### What is emailbox?

**emailbox is a self-hosted email platform that makes it easy to build and install apps** that run seemlessly in browsers, and on your mobile devices. Apps can affect any part of emailbox. For example, you could write an app that runs when a new email comes in and resizes all the images. Or, you could simply modify the CSS theme for the UI and mobile clients.

#### Why build emailbox?  

Progress in email clients has stalled. Everyone uses email differently, yet clients from Gmail to Outlook to Sparrow heavily restrict what developers can do, and don't offer many tools for development. It should be easier for a developer to build apps that affect every aspect of the email chain, and allow end users to determine how their client looks, what applications they want, and how efficiently they want to communicate. Rapportive, Boomerang, and Streak are example of awesome products/companies built on top of an email client, but I believe many more products and companies would exist if we had better tools to work with, and a distribution network.

#### Doesn't the Chrome Web Store already have apps?  

No, not like the apps that emailbox will encourage. You can download an extension from the Chrome Web Store and install it in Chrome, but that Extension probably won't be able to act upon incoming emails as soon as they arrive, it won't work in multiple browsers, and it definitely won't work on your phone!

### Features and Architecture  

#### Under development or planned

1. Straightforward API that handles the complexities of storing, queuing, searching, notifications, events, and permissions

1. UI that works seemlessly with any device (desktop, tablet, phone)

1. Developer friendly microformat-esque creation ("packages") for communications across any email client, but with significant benefits for emailbox users

1. Easy installation of apps from a package manager similar to npm or yum

#### API

Documentation at [api.md](api.md)  

Currently this includes endpoints for writing, updating, searching, queuing (soon), and triggering events. API calls all follow the same structure and include authentication for the calling application and user.

### User Interface

Emails are viewed on many different devices, and emailbox should handle desktop, tablets, and phones out of the box. Native apps for Android and iOS devices are created using the same codebase as the web version, but with additional native-only features such as Push Notifications or gestures available by using Trigger.io.

#### Storage

All text data is stored in a Mongo database. S3 stores all received/sent attachments.

#### Email Server Architecture

Email accounts are currently limited to Gmail only. The original emails are kept on Gmail's servers and only accessed once by emailbox, either through the one-time retrieval process, or with the always-on IMAP script. Each email is parsed, attachments are uploaded to S3, and the parsed data is sent to the API along with an Email.new event. In the future, emails will also be parsed for their "package" data and that will be sent through the API as well.

Sent emails are triggered by the "EmailDraft.send" event from the client and are passed all the email details (to, from, body, etc.). Attachments are uploaded using filepicker.io and available to the server as a URL. Sending uses Gmail's SMTP servers.

#### Packages

__status: planning__  
emailbox uses the standard email protocol, but will include a way of reading a JSON mime type out of the email. This JSON encoded string defines an app that can trigger events on the receiving client, both on the web and mobile. For example, emailbox users with the Todo application can add events to a friend's Todo list, and mark them off when they have been completed, all within the email client. Users without emailbox or the todo application would instead receive a Text or HTML version of the request that includes a link to click when the Todo item is done.

A package is very similar to a microformat, except with a focus on communication and the transmission of information, instead of display.

### Challenges of emailbox

#### App Architecture

The app (interchangably called plugins) architecture needs to be:

1. Easy for developers to build apps that run against server events, or affect the UI

1. Can communicate with disparate emailbox API instances

1. Easy to install for consumers, without them worrying about conflicting apps that may break UI elements

1. Easily packagable and distributable

1. Less prone to piracy to encourage revenue-producing development

1. Work offline seemlessly, or degrade gracefully  

I'm not yet sure of the best way to do this, but I am currently using a pubsub-like approach for server events. Server apps are simply URL endpoints that are triggered when an event such as Email.new is fired. URLs are triggered in parallel. The json also includes a list of Model/Collection permissions that the app can access. This is to limit exposure in the case of a dishonest or rogue app. Apps can also run JavaScript on the UI web client, the mobile web edition, or the native app (uses Trigger.io). This JavaScript is included in the app's package, and apps are not allowed to dynamically load JavaScript into the page. Some exceptions may be made for apps such as Google maps.


emailbox copyright 2012 Nicholas Reed
