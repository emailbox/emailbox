## Apps  

### What are Apps? 
Any kind of App could be developed on emailbox, but a few sample Apps could be: 
- Kid-friendly Email Client (whitelisted senders, really visual, no fluff)  
- Analytics (examples: http://gigaom.com/2010/09/14/graph-your-inbox-analytics-for-gmail/ )  
- News Email (all the mailing lists, marketing lists, ect that you are on)  


### Manifest

An App is defined by a manifest. It describes your App and what permissions and data it will need.

#### Manifest example  
    
    {
        "name": "Example",
        "package": "pkg.hello.",
        "description": "Email receiving, parsing, and sending",
        "provision_url": "https://example.com/provision_new",
        "plain_permissions": "UI only needs access to emails marked as \"marketing\" by Emailbox",
        "permissions": {
            "read": {
                "Email": {
                    "conditions": {"attributes.classified" : "marketing"},
                    "paths": []
                }
            },
            "write": {
                "Email": {
                    "conditions": {"attributes.classified" : "marketing"},
                    "paths": []
                }
            },
            "storage": true,
            "events": {
                "emit": ["Email.*", "Thread.*", "Classifier.*"],
                "listen": {
                    "Email.sync": {
                        "url": "https://getemailbox.com/plugins/email_sync",
                        "follow": [],
                        "conditions": {}
                    },
                    "Email.send": {
                        "url": "https://getemailbox.com/plugins/email_send",
                        "follow": [],
                        "conditions": {}
                    }
                }
            }
        },
        "dependencies": ["pkg.native.email"]
    }

### Let's look at each entry individually

#### name  
The name of your Application  
_Requirements:_ Must be at least 2 characters

#### package  
A unique identifier for your App. This is used by "dependencies" and "follow" (later)  
_Requirements:_ Must start with "pkg."  
_Example:_ pkg.developer_name.example1

#### description  
_Requirements:_ Must be at least 2 characters 

#### provision_url  
The URL we will call when a new user authenticates your App. This occurs in case the person install your App from within our store.  
_Requirements:_ A valid, public URL  

#### plain_permissions  
In plain english (translation later) describe the permissions your App requires. This will be reviewed and must match your requirest permissions.  
_Requirements:_ Must be at least 2 characters 

#### permissions.read (not active yet) 
Define the Models, as well as paths and conditions, that your App will need to access for the user. 

#### permissions.write (not active yet) 
Define the Models, as well as paths and conditions, that your App can modify for this user. 

#### permissions.storage (not active yet)  
Allowed to store larger data for this user
_Requirements:_ `true` or `false`

#### permissions.events (not active yet)  
Your App can listen/emit events to communicate with other Apps.  

#### permissions.events.emit  (not active yet)   
An array of events that your App can emit. Use a `*` for a wildcard

#### permissions.events.listen  (not active yet)   
Must include a **url**, an array of **follow** that includes the package name of the App to wait for a response before your App's url is run (`["pkg.native.email"]`), and **conditions** to match before calling the url. 

<br />
<br />

Get started building Apps by registering as a developer (ask nick@getemailbox.com) and clicking "Create App" at https://getemailbox.com/developers 








