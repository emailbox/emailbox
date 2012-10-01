# emailbox Install Instructions

### Hosting, Installation Requirements
- Should always be using a standard port 80 or 443 (SSL) for web requests, prevent blocking of non-standard ports (aka 3000)  
- Always On  
  - has to query Apps on new emails, events  
- SSL  
  - security  
- Run python script  
- Email app  
- Publicly accessible API  
- Restart service when it crashes  
- Use subdomains pointing to different apps 
  - port 443: Email app and API

### Questions  
- 2 domain names on 1 heroku account?
     - subdomains allowed instead?
- what will the size of the mongodb look like with 1,000,000 emails? S3? 

### Publicly accessible
- Email App, port 443 (now is 80 because I haven't done node.js ssl yet)  
- API, port 443 (now is 3000...needs to change)  
- API Socket.IO, port 443 (same as API. Any problem with connection and ssl?)  
- MongoDB, port ? (limit incoming connections to not from Heroku?)  

### Why to use Heroku  
- piggyback SSL (this is super important)  
- easily add services to test, easy to write an install guide  
- free up to a point  
- controllable environment for install  
- more adventurous people could install on EC2, or somebody could write a guide  

## Heroku install instructions  
Starting at square zero...  

Accounts/Services to Register
- Heroku (free)  
- MongoLab (free) (heroku add-on)  
- Xeround (free) (mysql heroku add-on)  
- Piggyback SSL (free) (heroku add-on)  
- Filepicker.io (free?) (ui uploads)  
- Google Consumer Key/Secret  
- Amazon S3  
- Trigger.io  


# Setup  
Create a heroku account
Install heroku gem locally


## API
Language: node.js, express  
git clone nodejs API to local directory  
create new app on heroku (free)  
install MongoLab add on (.5gb free, only storing text)  
install xeround mysql add on (10mb free)  
turn on piggyback ssl for app  
add credentials to API (mysql, mongodb, s3)  
push api repo to newly-created heroku app  
- runs installation checks (credentials, db tables exist, create as necessary)  
- installs packages  
- starts the node.js server  

## Email App  
Create Google Consumer Key and Secret to access your (or any) Gmail account  
Languages: python, django (not really using anything django-specific)  
- all credentials regarding your gmail account are stored in here. this handles all communication with gmail  
create new heroku app  
- includes: web server for handling webhooks, collector of previous emails, imap idler for new emails  
git clone email_app to local directory  
add S3 credentials for attachments  
- should we get credentials  
push email_app repo to newly-created heroku app  
start python script that peeks into the db and starts the python scripts for the existing users  
- also checks for new additions to the db (or when told to, by an event emitter)  
python web server is running, manifest.json is served at host/manifest.json  

## Frontend (backbone.js)  
visit heroku-hosted html page  
- assumes the api is at the same domain, with ssl on  

## Mobile App (trigger.io)  
Languages: javascript, trigger.io for iOS/Android integration  
Platform: trigger.io (free)  

## Signup and Email Plugin Addition  
- start on the Frontend UI  
create new account on the modal popup signup page  
- adds info to api mysql db as User  
display the "install a plugin" page  
- no plugin is registered for the "onstart" event,   
copy/paste manifest.json url from Email Plugin  
- adds plugin to api mysql db table:Services  
- sends a request to the manifest.json's "register_url" with a new user_token (depends on manifest's app_key too)  
- adds entry to table:ServicesUser in api mysql db  
reload the page, causing plugins to be reloaded  
after reload, the Email Plugin's JS is fired on the "onstart" event and a modal pops up asking to authenticate with Gmail  
- modal is a hosted iframe from the plugin page  

I might be thinking too hard about how to do plugins, and overlooking something simpler. I was thinking that plugins/apps should be as simple as possible to distribute, like just a manifest.json file that describes the events and webhooks offered, js to download, css, and images. Then I could provide a few simple plugin code samples that could be installed by most developers (just a simple web server, js example files, etc). I'm trying to find some sort of balance between helping people distribute easily (probably too early for this) and install other apps easily to help a community grow. If I write a boomerang plugin, I want a really easy way to share it with you. For fronted improvements, this works great, but anything that requires a server is totally different and more difficult to distribute.   

Each server plugin will need to store some information. Email plugin needs to know S3 credentials, Gmail Consumer Keys, OAuth tokens for each user, user_token linked to the gmail credentials.  
- the API should be handling the s3 credentials, etc.  
- instead of handling credentials, it should offer that service, with an optional backend  
     - api/storage = s3  
- each plugin says that it will handle some resource, and everything is passed through with Event Emitters (maybe)
I'm not really doing shit for authentication. No secret keys or anything right now, just passing identifiers unique ids that represent a User.  

## The Todo App:  
HTML, Text Template for email.   
- passed in handlebar format  
Write Email.send event, using the template we provide  
Include the new mime-type as a json object  
Public Server component:  
- link containing unique key (public) that the person clicks on when done (http://app_url/done?code=fkjo23jf203etc  


Need to make it easy for a developer to bring their account on board, then test things against it, without losing previous data in emailbox  
- "Ghost" your other inbox  
     - creates another user with exactly your credentials?  
     - which API events would be doubled up?  
     - I don't think Ghosting would actually work, because the incoming messages would cease to go to both accounts  
- need some sort of Safe Mode that prevents damage from being too widespread  
     - or can roll back changes  

