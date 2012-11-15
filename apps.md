## Apps  
 
An App is defined by a manifest.json. It describes your App and what permissions and data it will need

#### manifest.json example  
    
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
        "dependencies": []
    }

### Let's look at each entry individually

#### name  
The name of your Application  
**Requirements:** Must be at least 2 characters

#### package  
A unique identifier for your App. This is used by "dependencies" and "follow" (later)  
**Requirements:** Must start with "pkg."  
** Example:** pkg.developer_name.example1

#### description  
**Requirements:** Must be at least 2 characters 

#### provision_url  
The URL we will call when a new user authenticates your App. This occurs in case the person install your App from within our store.  
**Requirements:** A valid, public URL  

#### plain_permissions  
In plain english (translation later) describe the permissions your App requires. This will be reviewed and must match your requirest permissions.  
**Requirements:** Must be at least 2 characters 

#### permissions.read
Define the Models, as well as paths and conditions, that your App will need to access for the user. 

#### permissions.write
Define the Models, as well as paths and conditions, that your App can modify for this user. 

#### permissions.storage
Allowed to store larger data for this user
**Requirements:** `true` or `false`

#### permissions.events  
Your App can listen/emit events to communicate with other Apps.  

#### permissions.events.emit  
An array of events that your App can emit. Use a `*` for a wildcard

#### permissions.events.listen  
Must include a **url**, an array of **follow** that includes the package name of the App to wait for a response before your App's url is run (`["pkg.native.email"]`), and **conditions** to match before calling the url. 










