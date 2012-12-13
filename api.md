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

### Working with MongoDB  
Emailbox uses MongoDB on the backend, so all queries you make will use Mongo syntax. The biggest difference is that emailbox uses `model` while MongoDB uses `collection`.  

**Mongo Query links**:  
http://www.mongodb.org/display/DOCS/Querying  
http://docs.mongodb.org/manual/reference/operators/  


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
	    	"$set" : {
	    		"attributes.read.status": 1
	    	}
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
		"delay" : 0, // Delay in seconds before firing event
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



## Events  

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

### Client-side UI  

Listen for events through a Socket.io connection. After creating the connection, join the room (use your unique user_token for your app/user relationship)  

	
	var socket = io.connect('https://getemailbox.com/'); // SSL
	socket.emit('room', App.Credentials.user_token); // immediately change room to my unique app user_token
	socket.on('event', function (new_event) {
		console.log(new_event);
	}
	
In this case `new_event` looks the same way coming out as it did going in

	{
	    "event": "AppFilemessCollection.update2",
	    "delay": 0,
	    "obj": {
	        "test": "this"
	    }
	}


An example of listening for events can be found in the [File Mess](https://github.com/emailbox/filemess) example. 














