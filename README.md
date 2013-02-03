Cuis-NamedColors
================

Packages extend Color class to support choice of color naming "standards".

Each package loads one color dictionary.

	XKCD.pck.st		-- major survey of agreed upon names for colors 
	NBSISCC.pck.st	-- Rationalized color names (easy to remember/use)
	CSS2.pck.st		-- W3C Standard
	CSS3.pck.st		-- W3C Standard
	
To use these packages, the core Color class needs to be updated.  
Until this happens, file in changes through 1583 (Current).
Then filein 1584-CuisCore-KenDickey-2013Feb02-18h12m-KenD.1.cs.st
Then invoke

	Color intialize.


To load the XKCD color dictionary package:

    | slash |
    slash := FileDirectory slash.
     CodePackageFile installPackageStream:
        (FileStream concreteStream readOnlyFileNamed: 
            '..', slash, 'Cuis-NamedColors', slash, 'XKCD.pck.st'
        )
        
Then execute

	Color xkcdColorDictionary explore.
	Color darkColorDict explore.
	Color pinkColorDict explore.
	Color <selection>ColorDict explore.  "you get the idea"

To set the Color name->color dictionary:

 	Color setColorNamesDict: (Color xkcdColorDictionary).

Likewise for other dictionaries.  Look in Color>><NAME>ColorDictionary

Using Color>>setColorNamedDict: you can make and use your own dictionaries of color names.

Note: http://en.wikipedia.org/wiki/List_of_colors
