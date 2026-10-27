json/user
	var
		name
		age
		json/location/location
		list/pets

	New(
		name, 
		age, 
		var/json/location/location,
		pets
	)
		src.name = name
		src.age = age
		src.location = location
		src.pets = pets