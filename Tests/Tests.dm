zen/json_test
	test()
		var/json/user/lisa = zen.mock(/mock/user/Lisa)

		zen.assertEquals("JSON variables accessible like datums", lisa.name, "Lisa")

		zen.assertEquals("JSON variables accessible like list associations", lisa["name"], "Lisa")

		zen.assertEquals("JSON stringify is functioning", lisa.stringify(), 
@{"{
	"name": "Lisa", 
	"age": 44, 
	"location": {
		"city": "Springfield", 
		"country": "US"
	}, 
	"pets": [
		{
			"name": "Snowball VI", 
			"species": "Cat"
		}, 
		{
			"name": "Snowball VII", 
			"species": "Cat"
		}
	]
}"}
		)

		var/mockToStringData = "{\"name\":\"Lisa\",\"age\":44,\"location\":{\"city\":\"Springfield\",\"country\":\"US\"},\"pets\":\[{\"name\":\"Snowball VI\",\"species\":\"Cat\"},{\"name\":\"Snowball VII\",\"species\":\"Cat\"}]}"
		zen.assertEquals("JSON toString is functioning", lisa.toString(), mockToStringData)

		var/json/user/lisa2 = zen.mock(/mock/user/Lisa)
		lisa2.name = "Lisa2"
		zen.assertEquals("JSON variables setable", lisa2.name, "Lisa2")
