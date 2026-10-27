
mob
	Login()
		new/json/user(
			name = "lisa",
			age = 25,
			location = new/json/location(
				city = "Paris",
				country = "France"
			)
		)
	
		
json/user
	New(
		name, 
		age, 
		var/json/location/location
	)

json/location
	New(
		city,
		country
	)