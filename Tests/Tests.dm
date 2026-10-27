zen/jsonTest
	test()
		var/json/user/lisa = zen.mock(/mock/user/Lisa)

		zen.assertEquals("User has correct name, Lisa", lisa.name, "Lisa")
