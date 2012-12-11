# Email Model

### The Query

	{
		"model": "Email",
		"conditions": {}, // mongodb conditions
		"fields": [], // [] means get all fields this app can see
		"sort": {
			"_id": -1
		},
		"limit": 1
	}

### The Response (JSON) 

The order/arrangement of the fields may differ from what is displayed below. 

	{
		"code": 200, // Anything other than 200 is a failure. Better error docs coming
		"msg": "", // Error message, if any error occurred
		"time": 0.007,
		"data": [{
			"Email": {
				"_id": "50bd1f32be8461966b002e8d", // unique ID for the Email
				"attributes": {
					"thread_id": "50bd1669be8461966b002d7b" // Correlates to Thread._id
				},
				"common": { // Some data we parsed out that might commonly be used
					"date": "2012-12-03T21:48:35Z",
					"date_sec": 1354571315,
					"email_account": "nick@getemailbox.com",
					"Message-Id": "<CAMbRqCBA=wacVJxVd8FtOzYxzh4VvQRgqoHGqG4FwTD5HTwVsw@mail.gmail.com>",
					"uniq_id": "1420370972772922086"
				},
				"original": { // Read-only. Not allowed to modify anything in here
					"ParsedData": [{
						"Data": "<p>Test 6\n\nNick",
						"Part": 0,
						"Type": "Email"
					}, {
						"Data": "&gt; Testing 4\n&gt;\n&gt; Nick\n&gt;\n&gt;\n&gt; On Mon, Dec 3, 2012 at 1:36 PM, Nicholas Reed wrote:\n&gt;\n&gt;&gt; Testing 3 images.\n&gt;&gt;\n&gt;&gt; Nick\n&gt;&gt;\n&gt;&gt;\n&gt;&gt;\n&gt;&gt; On Mon, Dec 3, 2012 at 1:32 PM, Nicholas Reed wrote:\n&gt;&gt;\n&gt;&gt;&gt; Trying again.\n&gt;&gt;&gt;\n&gt;&gt;&gt; Nick\n&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;&gt; On Mon, Dec 3, 2012 at 1:15 PM, Nicholas Reed wrote:\n&gt;&gt;&gt;\n&gt;&gt;&gt;&gt; This is testing an image attachment.\n&gt;&gt;&gt;&gt;\n&gt;&gt;&gt;&gt; Nick\n&gt;&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;\n&gt;</p>",
						"Part": 1,
						"Type": "Email"
					}],
					"ParsedDataHtml": [{
						"Data": "<div>Test 6</div><div><br></div>Nick<br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:38 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\"><div>Testing 4</div><div><br></div>Nick<div class=\"HOEnZb\"><div class=\"h5\"><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:36 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Testing 3 images. <div><br></div><div>Nick<div><div><br><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:32 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Trying again. <div><br></div><div>Nick<div><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:15 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">This is testing an image attachment. <br><div><br></div><div>Nick</div>\n</blockquote></div><br></div></div>\n</blockquote></div><br></div></div></div>\n</blockquote></div><br>\n</div></div></blockquote></div><br>",
						"Part": 0,
						"Type": "Email"
					}],
					"attachments": [{ // attachments are in a list/array
						"name": "DSC00388.jpg", // filename
						"thumbs": { // thumbnail. Currently only one 300 by X thumbnail, but will change to be multiple thumbs
							"basewidth300": {
								"width": 300,
								"path": "2012/12-03/c1a834ac-3d93-11e2-872d-12314101160c/DSC00388.jpg_thumbs/thumb300/RFNDMDAzODguanBn.jpg",
								"height": 168
							}
						},
						"path": "2012/12-03/c1a834ac-3d93-11e2-872d-12314101160c/DSC00388.jpg", // https://s3.amazonaws.com/emailboxv1/...
						"name_base64": "RFNDMDAzODguanBn.jpg",
						"type": "image/jpeg",
						"size": 921256 // in bytes
					}],
					"labels": ["\\\\Inbox", "\\\\Important"], // Pulled from Gmail
					"HtmlBody": "<div>Test 6</div><div><br></div>Nick<br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:38 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\"><div>Testing 4</div><div><br></div>Nick<div class=\"HOEnZb\"><div class=\"h5\"><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:36 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Testing 3 images. <div><br></div><div>Nick<div><div><br><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:32 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Trying again. <div><br></div><div>Nick<div><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:15 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">This is testing an image attachment. <br><div><br></div><div>Nick</div>\n</blockquote></div><br></div></div>\n</blockquote></div><br></div></div></div>\n</blockquote></div><br>\n</div></div></blockquote></div><br>",

					"headers": { // Any "." in the key have been replaced with "-"
						"Received": "by 10.64.167.204 with HTTP; Mon, 3 Dec 2012 13:48:35 -0800 (PST)",
						"Delivered-To": "nicholas.a.reed@gmail.com",
						"Received-SPF": "neutral (google.com: 209.85.223.195 is neither permitted nor denied by best guess record for domain of nick@getemailbox.com) client-ip=209.85.223.195;",
						"From": "Nicholas Reed <nick@getemailbox.com>",
						"From_Parsed" : ["NicholasReed", "nick@getemailbox.com"]
						"Return-Path": "<nick@getemailbox.com>",
						"Subject": "Re: Testing image",
						"Authentication-Results": "mx.google.com; spf=neutral (google.com: 209.85.223.195 is neither permitted nor denied by best guess record for domain of nick@getemailbox.com) smtp.mail=nick@getemailbox.com",
						"Cc": "",
						"Cc_Parsed" : "",
						"X-Gm-Message-State": "ALoCoQkTKeKrhi3muC+njBTWgHverkko8Kk1Kb4osvs20NH0M1Jm2H4SFKKo7la+QlmGyCYULiSq",
						"X-Google-DKIM-Signature": "v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=google.com; s=20120113;\r\n        h=mime-version:x-originating-ip:in-reply-to:references:date\r\n         :message-id:subject:from:to:content-type:x-gm-message-state;\r\n        bh=rAFPVYN3ZH6n9u9V4jXgZDuv2Ydb5MkWxNYoNeeQaPE=;\r\n        b=m1GD2mPONegmSTDStCTlCVdXw5VYS1E9qbn0VSbR9QG0cJX9bYnvYaCzX6tE5qIRiY\r\n         WTDcqYX8rlkBBW/I+J6H329TxNfQxfNEaUaMevqUGmqFhisY1upe7xfrUgN9j5N6G09S\r\n         nd/Elz+HEagqPJ+N/6A0lZB4f2B89Ja9mmuZ7aXpGsaqXKcIWrHuPyQRdwr/muvX2Wnu\r\n         Ylun51qlU6ofG3ogCc2Yac3wkg2PW2YTGRsotwrrVEpQM/+obbqCsL7rX3uWmB+w7hCx\r\n         21x9lusFPYE5PyK5+ZHwR/QaXMeyH1IgdLKCcJuo7Be0/2CkDJHdTYuBQK6G6Mym509u\r\n         v51w==",
						"To": "Nicholas Reed <nicholas.a.reed@gmail.com>",
						"To_Parsed" : ["Nicholas Reed", "nicholas.a.reed@gmail.com"],
						"References": "<CAMbRqCBjQxmZ=G6cEaTP6qyKJG+R3UgA-5G=NriLcP-jTO3FHw@mail.gmail.com>\r\n\t<CAMbRqCA2wfFyCHehmZK3Uuae38cx7nagmVRutcHbPxj2SHWPmQ@mail.gmail.com>\r\n\t<CAMbRqCDpTMTsSBM-QkED9NpNGpHufaLa9bqEBgTMgComHFf2cQ@mail.gmail.com>\r\n\t<CAMbRqCD=Zi9CwyM5gPEmQWD2C8Tj4Rf6Ps9f5rxUQyU0hxsPGg@mail.gmail.com>",
						"In-Reply-To": "<CAMbRqCD=Zi9CwyM5gPEmQWD2C8Tj4Rf6Ps9f5rxUQyU0hxsPGg@mail.gmail.com>",
						"Date": "Mon, 3 Dec 2012 13:48:35 -0800",
						"Reply-To": "Nicholas Reed <nick@getemailbox.com>",
						"Message-ID": "<CAMbRqCBA=wacVJxVd8FtOzYxzh4VvQRgqoHGqG4FwTD5HTwVsw@mail.gmail.com>",
						"Content-Type": "multipart/mixed; boundary=90e6ba6e8e20231ab104cff9b675",
						"X-Originating-IP": "[50.131.45.2]",
						"MIME-Version": "1.0"
					},
					"flags": [], // \\\\Draft or \\\\Sent (straight from Gmail)
					"HtmlBodyOriginal": "<div>Test 6</div><div><br></div>Nick<br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:38 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\"><div>Testing 4</div><div><br></div>Nick<div class=\"HOEnZb\"><div class=\"h5\"><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:36 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Testing 3 images. <div><br></div><div>Nick<div><div><br><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:32 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">Trying again. <div><br></div><div>Nick<div><br><br><div class=\"gmail_quote\">On Mon, Dec 3, 2012 at 1:15 PM, Nicholas Reed <span dir=\"ltr\">&lt;<a href=\"mailto:nick@getemailbox.com\" target=\"_blank\">nick@getemailbox.com</a>&gt;</span> wrote:<br>\n\n\n\n<blockquote class=\"gmail_quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">This is testing an image attachment. <br><div><br></div><div>Nick</div>\n</blockquote></div><br></div></div>\n</blockquote></div><br></div></div></div>\n</blockquote></div><br>\n</div></div></blockquote></div><br>",
					"TextBody": "<p>Test 6\n\nNick\n\nOn Mon, Dec 3, 2012 at 1:38 PM, Nicholas Reed  wrote:\n\n&gt; Testing 4\n&gt;\n&gt; Nick\n&gt;\n&gt;\n&gt; On Mon, Dec 3, 2012 at 1:36 PM, Nicholas Reed wrote:\n&gt;\n&gt;&gt; Testing 3 images.\n&gt;&gt;\n&gt;&gt; Nick\n&gt;&gt;\n&gt;&gt;\n&gt;&gt;\n&gt;&gt; On Mon, Dec 3, 2012 at 1:32 PM, Nicholas Reed wrote:\n&gt;&gt;\n&gt;&gt;&gt; Trying again.\n&gt;&gt;&gt;\n&gt;&gt;&gt; Nick\n&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;&gt; On Mon, Dec 3, 2012 at 1:15 PM, Nicholas Reed wrote:\n&gt;&gt;&gt;\n&gt;&gt;&gt;&gt; This is testing an image attachment.\n&gt;&gt;&gt;&gt;\n&gt;&gt;&gt;&gt; Nick\n&gt;&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;&gt;\n&gt;&gt;\n&gt;</p>"
				}
			}
		}]
	}