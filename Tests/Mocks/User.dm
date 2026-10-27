mock/user
	Lisa
		get()
			return new/json/user(
				name = "Lisa",
				age = 44,
				location = zen.mock(/mock/location/Springfield),
				pets = list(
					zen.mock(/mock/pet/Snowball_VI),
					zen.mock(/mock/pet/Snowball_VII),
				)
			)

	Snowball_VII
		get()
			new/json/pet("Snowball VII", "Cat")
