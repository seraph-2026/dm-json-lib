# DM JsonLib

## Overview

This library is intended to make it easier to work with JSON in DM (Dream Maker).

## How to build a JSON object

It's designed to work just like regular datums.

```NIM
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
```

## How to define JSON types

Defining JSON types means that now we get compile time errors intead of run time errors when there's a data mismatch. This means less suprise failures.

```NIM
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
```

## How to output

These are the different ways you can output a JSON object

### Pretty output

```NIM
world << user
```

```NIM
world << user.stringify()
```

### Plain output

```NIM
world << user.toString()
```

## What it looks like

### Pretty

Nicely formatted for debugging.
```json
{
    "name": "lisa",
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
}
```

### Plain

No formatting, everything on a single line with no spaces. 

```json
{"name":"lisa","age":44,"location":{"city":"Springfield","country":"US"},"pets":[{"name":"Snowball VI","species":"Cat"},{"name":"Snowball VII","species":"Cat"}]}
```
