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
I'm hosting a catalog of apps at https://github.com/emailbox/emailbox/blob/master/catalog.json . Do a Pull Request to be added. 