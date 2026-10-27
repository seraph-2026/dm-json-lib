#define JSON_IGNORE_FIELDS list("parent_type", "tag", "vars", "type")

json
	/**
	 * Overrides the default string conversion function.alist
	 * 
	 * For example world << new/json()
	 */
	proc/operator""()
		return src.stringify()

	/**
	 * Override the default [] indexing
	 * 
	 * For example json["name"]
	 */
	proc/operator[](var/index)
		return src.vars[index]

	/**
	 * Converts this object to a plain json formatted string without
	 * spaces tabs or newlines.
	 */
	proc/toString()
		// Convert src to list
		var/list/jsonList = src.toList()

		// Return plain string with no formatting
		return json_encode(jsonList)
	
	/**
	 * Converts this object to a pretty json formatted string with
	 * spaces, tabs and newlines to make it look nice.
	 */
	proc/stringify()
		// Convert src to list
		var/list/jsonList = src.toList()

		// Return pretty json formatted string
		return json_encode(jsonList, JSON_PRETTY_PRINT)
	
	/**
	 * Returns this object as an associative list
	 */
	proc/toList()
		var/list/jsonList = alist()

		for(var/variableName in src.vars)

			// Ignore built in variable types
			if(variableName in JSON_IGNORE_FIELDS)
				continue

			var/variableValue = src.vars[variableName]

			// Convert child json into lists as well
			if(istype(variableValue, /json))
				var/json/jsonVariableValue = variableValue
				jsonList[variableName] = jsonVariableValue.toList()

			/**
			* For indexed list (not associative)
			* 
			* Convert json elements to lists
			*/
			else if(istype(variableValue, /list) && !JsonUtils.listHasAssociations(variableValue))
				var/list/safeList = JsonUtils.makeListJsonSafe(variableValue)
				jsonList[variableName] = safeList

			// Add to list directly with no conversions
			else
				jsonList[variableName] = variableValue
		
		return jsonList