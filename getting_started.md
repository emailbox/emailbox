# Emailbox Getting Started for Developers  

> This guide assumes you have already signed up for emailbox (http://getemailbox.com/login), and as an emailbox developer (Developer signups are currently limited to those with a Private Beta code. Contact nick@getemailbox.com if you'd like one)

### Sign in to emailbox
https://getemailbox.com/login

### Create your first App  
https://getemailbox.com/developers  
![developers](http://dl.dropbox.com/u/6673634/Screenshots/oyg0.png)
You will choose a name for your application, and a default manifest will be created for you. 

#### What is the manifest?  
The manifest is how you tell emailbox which Events you care about, what permissions you need, and where you'll eventually set pricing. 
[Learn more about the manifest](https://github.com/emailbox/emailbox/blob/master/apps.md)

### Download a sample App  
Demo: https://github.com/emailbox/photos_app Source: https://github.com/emailbox/photos_app  
Demo: https://github.com/emailbox/insights Source: https://github.com/emailbox/insights

### Update App credentials  
Each App will have a credentials file (sometimes called creds.json, or credentials.json) that you need to edit. You will put your App's key (found on your App's edit page) in the credentials, replacing the existing value. 

### Launch your App  
I recommend tossing the app in your ~/Sites directory (on a mac) and browsing to http://localhost/~username/
You can also fork the repo, then add (or push to) the gh-pages branch on GitHub and viewing it at http://username.github.com/app_name  

### Learn More  
Read our API documentation, or see what other tools we offer ([DevTools](http://emailbox.github.com/dev_tools)). 

Suggestions appreciated at nick@getemailbox.com 



