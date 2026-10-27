
/**
 * Global instance of json utils
 */
var/JsonUtils/JsonUtils = new/JsonUtils()

JsonUtils
	proc
		/**
			Return true if list is associative, false if not
		**/
		listHasAssociations(list/anyList)
			for(var/key, value in anyList)
				if(!isnull(value))
					return TRUE

			return FALSE

	/**
	 * Ensures this list and any sub lists have any /json 
	 * objects converted to lists. 
	 */
	proc/makeListJsonSafe(var/list/someList)
		var/list/replacementList = list()

		for(var/listItem in someList)
			// Encountered a list
			if(istype(listItem, /list) && !JsonUtils.listHasAssociations(listItem))
				var/list/listListItem = listItem
				replacementList += list(JsonUtils.makeListJsonSafe(listListItem))

			// Encountered json
			else if(istype(listItem, /json))
				var/json/jsonListItem = listItem
				replacementList += list(jsonListItem.toList())

			// Something primitive or alist
			else
				replacementList += listItem
		
		return replacementList