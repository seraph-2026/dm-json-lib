
mob
	Login()
		/**
		 * How to construct a /json object
		 */
		var/json/user = new/json/user(
			name = "lisa",
			age = 44,
			location = new/json/location(
				city = "Springfield",
				country = "US"
			),
			pets = list(
				new/json/pet("Snowball VI", "Cat"),
				new/json/pet("Snowball VII", "Cat"),
			)
		)

		/**
		 * Nicely formatted output
		 */
		world << user

		zen.exec(src)