## Apps  

Apps are triggered on Events (ex: `Email.new` => `your_url`), and assets (css/js) are loaded into the UI. 

### Building an App  
An App is defined by a manifest.json that describes the assets for the UI, and the url to call on an Event. 

#### Folder structure
    
    /js
    /css
    /img
    manifest.json
    

#### manifest.json example  
    
    {
      "name": "", // Theme: Blue
    	"id" : "",  // com.native.theme.blue
      "version" : "", // ex: 0.0.1
    	"description": "",
      "provision_url" : "", // optional. urls must be http or https
      "deprovision_url" : "", // optional
    	"events": {
        "Test1.test" : "" // optional. 
      },
    	"scripts": {
    		"img" : [
          "test.png"
    			],
    		"js" : [
    			"test.js"
    			],
    		"css": [
    			"test.css"
    			]
    	}
    }


### Installing an App  
> You will need the URL to a .zip version of your App  

From the UI, choose the `Developer` menu, and click `Apps`. Change to the Install tab and paste the URL to the .zip version of your App. 

### Developing locally  
To develop locally, first download the App to your UI directory so the structure looks like `/src/apps/com.app.here/manifest.json`. Then load the `Apps` page from the UI (under the `Developer` menu) and choose the "dev" option for your App. This causes the `manifest.json` to be read locally for all assets, ignoring the server or cached versions. 

### Publishing your App  
Zip up your App (manifest.json at the root) and put it on the web somewhere. 
> Tip: GitHub automatically provides a zipped version of your app, if the repo is publically visible. Apps hosted on GitHub can also be added to our Catalog of Apps  

### Catalog  
A catalog of hosted apps is at https://github.com/emailbox/emailbox/blob/master/catalog.json . Submit a Pull Request to be added. 


## Payload Apps  
Payload Apps send out additional information with an email, encoded as a special mime-type. Similar to microformats, except not standardized (yet). The recipient has 3 possible client scenarios:  

1. Using emailbox, App installed:
    1. App is triggered with the data supplied in the special mime-type
1. Using emailbox, App not installed:  
    1. When viewing email, User is directed to install the App  
    1. Email is an HTML or Text version of the data. For example, an Invitation App would include the event details in Text, and also in the special-mimetype. 
1. Not using emailbox:  
    1. See 2.2 








