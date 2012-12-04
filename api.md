# API Guide  
This a guide to the API endpoints exposed by emailbox. [Learn more about emailbox](readme.md).  

## Links  
> Links are relative to your API url 

Console: http://emailbox.github.com/dev_tools  
Samples: https://gist.github.com/6074f1d65a47b00dfd64  

## Authentication  
Each App has a **key** and a **secret**. These are used in concert to make requests to the API. When an App is installed, a special **user_token** is created for that App/User relationship. Every request made to your server from us will include your App's **key** and App/User **user_token**. 

## Structure
We accept JSON-encoded POST requests to all api endpoints. Each request should also include Authentication information as part of the POST request. For example: 
  
    {
      auth: {  
	      app: 'pkg.native.dev_tools',  
	      user_token: 'e9b12882-4576-4f5d-8880-2965b1f7be22'  
      },
      data: { request examples below... }
    }


## Models (Email and Thread)  

[Email Model](https://github.com/emailbox/emailbox/blob/master/model_email.md)  
[Thread Model](https://github.com/emailbox/emailbox/blob/master/model_thread.md)  


## API Endpoints

### api/echo  
Just echos exactly the request you sent

### api/search  
Search across a Model. Depends on DB permissions for the app. 

Request:  
  
    {
      "model" : "Email",
      "fields" : ["original.headers" , "attributes"],
      "conditions" : {},
      "limit" : 25,
      "sort" : {"field1" : -1}
    }

Response:  
	
	{
      "code": 200,
      "msg": "",
      "time" : .01277891888
      "data": [{
            "Email" : {
              "_id": a_mongo_db_id,
              "attributes" : {...},
              "original": {
                "headers" : {...}
              }
            }
          },
          {
            "Email" : {
              "_id": another_mongo_db_id,
              "attributes" : {...},
              "original": {
                "headers" : {...}
              }
            }
      }]
	}


### api/write  
Write to the DB. Depends on permissions allowed for the app. 
You can also include an **event** in here that triggers additional apps to run (just like using api/event). This event will be triggered with the Object you include. 

Request:  
  
	{
	    "model": "Test",
	    "event": "Test.test_add",
	    "obj": {
	        "sample_data" : {
            "data1" : "example",
            "data2" : ["an array!"],
            "data3" : false
          },
	        "mongo_db_rules_apply" : true
	    }
	}

Response:  
	
	{
	    "code": 200,
	    "msg": "Written",
	    "data": {
	        "_id": a_mongo_db_id
	    }
	}


### api/update  
Updates objects in the DB. Depends on permissions allowed for the app. 

Request:  
  
	{
	    "model": "Testing",
	    "id": "modelid_here",
      "paths" : {
      	"attributes.read.status": 1
      }
	}

Response:  
	
	{
	    "code": 200,
	    "msg": "Updated",
	    "data": {
	        
	    }
	}
          

### api/event  
Trigger Apps to run on this plugin. These Apps will be called with the Object you specify

Request:  
  
	{
      "event": "Testing.random_event",
      "obj" : {
      	"_id" : "some_id",
        "model" : "SomeModel"
      }
	}

Response:  
	
	{
	    "code": 200,
	    "msg": "Event Fired"
	}
  

### api/queue [not currently active] 
At the appointed utctime, we'll send an HTTP POST request to your specified Plugin URL with the included obj.  

Request:  
	
	{
	    "url": "https://plugin_url_here/plugins/test",
	    "delay": 500,
	    "obj": {
	        "action" : "remind_me_in_no_replies",
	        "message-id" : "<sdfk23fdsf23y5gdfsdf9823fj329f8@gmail.com>"
	    }
	}

Response:  
	
	{
	    "code": 200,
	    "msg": "Saved to Queue",
	    "data": {
	        "delay": 120
	    }
	}

The `data` field will include a `delay` object that confirms the number of seconds until the Job will be fired. 


## Events [not currently active]  

### API Server

API events are triggered by `api/write` or `api/event`. When an Event is triggered, each App that requested to be notified on that event will be sent the following payload:

	
	{
	    "auth": {
                "user_token" : ...
            },
	    "obj": {
	        "Email": {
                    ...
                }
	    }
	}

### UI  

In addition, a new object will be pushed through the socket.io connection:

	{
	    "event": 200,
	    "data": {
	        "Email": {
                    ...
                }
	    }
	}














