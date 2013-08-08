Cuis-NamedColors
================

Packages extend Color class to support choice of color naming "standards".

Each package loads one color dictionary.

	XKCD-ColorNames.pck.st		-- Major survey of agreed upon names for colors 
	NBSISCC-ColorNames.pck.st	-- National Bureau of Standards rationalized names
	CSS2-ColorNames.pck.st		-- W3C Standard
	CSS3-ColorNames.pck.st		-- W3C Standard
	
To use these packages use Cuise version 4.2 or higher.
````Smalltalk
	Feature require: 'XKCD-NamedColors'.
	Feature require: 'NBSISCC-NamedColors'.
	Feature require: 'CSS2-NamedColors'.
	Feature require: 'CSS3-NamedColors'.
````

Then execute something like:
````Smalltalk
	Color xkcdColorDictionary explore.
	Color darkColorDict explore.
	Color pinkColorDict explore.
	Color @@@@ColorDict explore.  "you get the idea"
````

To set the Color name->color dictionary to the dictionary of your choice:
````Smalltalk
 	Color setColorNamesDict: (Color xkcdColorDictionary).
````

Likewise for other dictionaries.  Look in Color>><NAME>ColorDictionary

Using Color>>setColorNamesDict: you can make and use your own dictionaries of color names.

Note: http://en.wikipedia.org/wiki/List_of_colors
