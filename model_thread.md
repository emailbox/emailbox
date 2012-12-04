# Thread Model

### The Query

	{
		"model": "Thread",
		"conditions": {},
		"fields": [],
		"sort": {
			"_id": -1
		},
		"limit": 1
	}

### The Response (JSON) 

The order/arrangement of the fields may differ from what is displayed below. 

	{
		"code": 200,
		"msg": "",
		"time": 0.065,
		"data": [{
			"Thread": {
				"attributes": {
					"attachments": 1, // 0 or 1, not a count of attachments
					"read": {
						"status": 0 // has it been "read"
					},
					"last_message_datetime": "2011-11-23T22:07:34Z",
					"labels": {
						"Important": 1
					},
					"last_message": "<p>Didnt hit the save button.  Reattaching results sheet.", // A short piece of the most recent message
					"accounts": ["nick@getemailbox.com"]
				},
				"original": {
					"subject": "RE: Pigskin sides" // This may change to accomodate Subject changes
				},
				"_id": "50be59d9be8461966b007057"
			}
		}]
	}