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

	NamedColors useXKCD.
	NamedColors dictionary explore.
