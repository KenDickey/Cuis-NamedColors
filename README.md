Cuis-NamedColors
================

NamedColor class supports choice of color naming "standard"

To load the package

    | slash |
    slash := FileDirectory slash.
     CodePackageFile installPackageStream:
        (FileStream concreteStream readOnlyFileNamed: 
            '..', slash, 'Cuis-NamedColors', slash, 'NamedColors.pck.st'
        )

Then execute

	NamedColor useXKCD.
	NamedColor dictionary explore.
	Color red lighter lighter asNamedColor closestColor explore.
