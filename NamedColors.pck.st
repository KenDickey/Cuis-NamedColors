'From Cuis 4.1 of 12 December 2012 [latest update: #1576] on 24 January 2013 at 4:19:01 pm'!
'Description Choose color naming model'!
!classDefinition: #NamedColor category: #NamedColors!
Color subclass: #NamedColor
	instanceVariableNames: ''
	classVariableNames: 'ColorNameDict'
	poolDictionaries: ''
	category: 'NamedColors'!
!classDefinition: 'NamedColor class' category: #NamedColors!
NamedColor class
	instanceVariableNames: ''!


!NamedColor commentStamp: '<historical>' prior: 0!
Named Colors
	There are quite a large number of naming schemes for colors.  Note: 			http://en.wikipedia.org/wiki/Color_names
	
	 CSS2, CSS3 	http://www.w3.org/TR/css3-color/#hsl-color
	
	 NBS-ISCC 		http://tx4.us/nbs-iscc.htm
	
	 XKCD 			http://blog.xkcd.com/2010/05/03/color-survey-results
	
	For experimentation, support has been added for multiple name->color dictionaries.
	Only one dictionary is in use at a time.
	
	Change the default dictionary by use* class methods:
		NamedColor useNBSISC
	
	Color named: nameStringOrSymbol  -- returns match in current dictionary or nil..

	Look at the class side for most useful methods.
	!

!NamedColor methodsFor: 'access' stamp: 'KenD 1/24/2013 15:23'!
icon
	"trivial method to include selector #icon for Object Explorer"
	^super icon! !

!NamedColor methodsFor: 'access' stamp: 'KenD 1/24/2013 14:27'!
name
	"Return this color's name, or nil if it has no name. Only returns a name if it exactly matches the named color."
	
	^NamedColor dictionary keyAtValue: self  ifAbsent: [nil]! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 14:11'!
colorDictSelectors
	"Return a collection color dictionary selectors suitable for #perform:"
	"Change dictionary selector order to prefer a naming scheme"

	^ {  #traditionalColorNames. 
		#xkcdNamedColors.
		#nbsisccNamedColors. 
		#css3NamedColors. 
		#css2NamedColors }! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 13:57'!
colorNamed: aColorName

	"Answer color matching name ot nil from my ColorName->Color Dictionary"
	
	^ self dictionary at: (aColorName asSymbol) ifAbsent: [nil]! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 13:54'!
colorNames

	"Answer the names from my ColorName->Color Dictionary"
	^ self dictionary collect: [ :association | association key]! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 15:32'!
css3NamedColors
	"Answer a dictionary of CSS3 compliant color names to Color objects.
	http://www.w3.org/TR/css3-color/#hsl-color"
"
	self css3NamedColors explore.
"

	| css3Dict |
	css3Dict _ self css3NamedColors1 addAll: 
		self css3NamedColors2; addAll: 
		self css3NamedColors3; addAll: 
		self css3NamedColors4; addAll: 
		self css3NamedColors5; addAll: 
		self css3NamedColors6; addAll: 
		self css3NamedColors7; addAll: 
		self css3NamedColors8; yourself.
		
	^css3Dict! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:05'!
css3NamedColors1
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
   at: #cornflowerBlue
		put: (NamedColor
			r: 0.39215686274509803
			g: 0.5843137254901961
			b: 0.9294117647058824);
   at: #darkSlateBlue
		put: (NamedColor
			r: 0.2823529411764706
			g: 0.23921568627450981
			b: 0.5450980392156862);
   at: #slateBlue
		put: (NamedColor
			r: 0.41568627450980394
			g: 0.35294117647058826
			b: 0.803921568627451);
   at: #mediumSlateBlue
		put: (NamedColor
			r: 0.4823529411764706
			g: 0.40784313725490196
			b: 0.9333333333333333);
   at: #lightSlateBlue
		put: (NamedColor
			r: 0.5176470588235295
			g: 0.4392156862745098
			b: 1.0);
   at: #mediumBlue
		put: (NamedColor
			r: 0
			g: 0
			b: 0.803921568627451);
   at: #royalBlue
		put: (NamedColor
			r: 0.2549019607843137
			g: 0.4117647058823529
			b: 0.8823529411764706);
   at: #blue
		put: (NamedColor
			r: 0
			g: 0
			b: 1.0);
   at: #dodgerBlue
		put: (NamedColor
			r: 0.11764705882352941
			g: 0.5647058823529412
			b: 1.0);
   at: #deepSkyBlue
		put: (NamedColor
			r: 0
			g: 0.7490196078431373
			b: 1.0);
   at: #skyBlue
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.807843137254902
			b: 0.9215686274509803);
   at: #lightSkyBlue
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.807843137254902
			b: 0.9803921568627451);
   at: #steelBlue
		put: (NamedColor
			r: 0.27450980392156865
			g: 0.5098039215686274
			b: 0.7058823529411765);
   at: #lightSteelBlue
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.7686274509803922
			b: 0.8705882352941177);

   at: #lightBlue
		put: (NamedColor
			r: 0.6784313725490196
			g: 0.8470588235294118
			b: 0.9019607843137255);

   at: #powderBlue
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.8784313725490196
			b: 0.9019607843137255);
   at: #paleTurquoise
		put: (NamedColor
			r: 0.6862745098039216
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #darkTurquoise
		put: (NamedColor
			r: 0
			g: 0.807843137254902
			b: 0.8196078431372549);
   at: #mediumTurquoise
		put: (NamedColor
			r: 0.2823529411764706
			g: 0.8196078431372549
			b: 0.8);
   at: #turquoise
		put: (NamedColor
			r: 0.25098039215686274
			g: 0.8784313725490196
			b: 0.8156862745098039);

   at: #cyan
		put: (NamedColor
			r: 0
			g: 1.0
			b: 1.0);
   at: #lightCyan
		put: (NamedColor
			r: 0.8784313725490196
			g: 1.0
			b: 1.0);

   at: #cadetBlue
		put: (NamedColor
			r: 0.37254901960784315
			g: 0.6196078431372549
			b: 0.6274509803921569);
   at: #mediumAquamarine
		put: (NamedColor
			r: 0.4
			g: 0.803921568627451
			b: 0.6666666666666666);
   at: #aquamarine
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0.8313725490196079);
   at: #darkGreen
		put: (NamedColor
			r: 0
			g: 0.39215686274509803
			b: 0);
   at: #darkOliveGreen
		put: (NamedColor
			r: 0.3333333333333333
			g: 0.4196078431372549
			b: 0.1843137254901961);
   at: #darkSeaGreen
		put: (NamedColor
			r: 0.5607843137254902
			g: 0.7372549019607844
			b: 0.5607843137254902);
   at: #seaGreen
		put: (NamedColor
			r: 0.1803921568627451
			g: 0.5450980392156862
			b: 0.3411764705882353);
   at: #mediumSeaGreen
		put: (NamedColor
			r: 0.23529411764705882
			g: 0.7019607843137254
			b: 0.44313725490196076);
   at: #lightSeaGreen
		put: (NamedColor
			r: 0.12549019607843137
			g: 0.6980392156862745
			b: 0.6666666666666666);
   at: #paleGreen
		put: (NamedColor
			r: 0.596078431372549
			g: 0.984313725490196
			b: 0.596078431372549);
   at: #springGreen
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0.4980392156862745);
   at: #lawnGreen
		put: (NamedColor
			r: 0.48627450980392156
			g: 0.9882352941176471
			b: 0);
   at: #green
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0);
   at: #chartreuse
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0);
   at: #mediumSpringGreen
		put: (NamedColor
			r: 0
			g: 0.9803921568627451
			b: 0.6039215686274509);
   at: #greenYellow
		put: (NamedColor
			r: 0.6784313725490196
			g: 1.0
			b: 0.1843137254901961);
   at: #limeGreen
		put: (NamedColor
			r: 0.19607843137254902
			g: 0.803921568627451
			b: 0.19607843137254902);
   at: #yellowGreen
		put: (NamedColor
			r: 0.6039215686274509
			g: 0.803921568627451
			b: 0.19607843137254902);
   at: #forestGreen
		put: (NamedColor
			r: 0.13333333333333333
			g: 0.5450980392156862
			b: 0.13333333333333333);
   at: #oliveDrab
		put: (NamedColor
			r: 0.4196078431372549
			g: 0.5568627450980392
			b: 0.13725490196078433);
   at: #darkKhaki
		put: (NamedColor
			r: 0.7411764705882353
			g: 0.7176470588235294
			b: 0.4196078431372549);
   at: #khaki
		put: (NamedColor
			r: 0.9411764705882353
			g: 0.9019607843137255
			b: 0.5490196078431373);
   at: #paleGoldenrod
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9098039215686274
			b: 0.6666666666666666);
   at: #lightGoldenrodYellow
		put: (NamedColor
			r: 0.9803921568627451
			g: 0.9803921568627451
			b: 0.8235294117647058);
    at: #lightYellow
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0.8784313725490196);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors2
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
   at: #cornflowerBlue
		put: (NamedColor
			r: 0.39215686274509803
			g: 0.5843137254901961
			b: 0.9294117647058824);
   at: #darkSlateBlue
		put: (NamedColor
			r: 0.2823529411764706
			g: 0.23921568627450981
			b: 0.5450980392156862);
   at: #slateBlue
		put: (NamedColor
			r: 0.41568627450980394
			g: 0.35294117647058826
			b: 0.803921568627451);
   at: #mediumSlateBlue
		put: (NamedColor
			r: 0.4823529411764706
			g: 0.40784313725490196
			b: 0.9333333333333333);
   at: #lightSlateBlue
		put: (NamedColor
			r: 0.5176470588235295
			g: 0.4392156862745098
			b: 1.0);
   at: #mediumBlue
		put: (NamedColor
			r: 0
			g: 0
			b: 0.803921568627451);
   at: #royalBlue
		put: (NamedColor
			r: 0.2549019607843137
			g: 0.4117647058823529
			b: 0.8823529411764706);
"
   at: #blue
		put: (NamedColor
			r: 0
			g: 0
			b: 1.0);
"
   at: #dodgerBlue
		put: (NamedColor
			r: 0.11764705882352941
			g: 0.5647058823529412
			b: 1.0);
   at: #deepSkyBlue
		put: (NamedColor
			r: 0
			g: 0.7490196078431373
			b: 1.0);
   at: #skyBlue
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.807843137254902
			b: 0.9215686274509803);
   at: #lightSkyBlue
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.807843137254902
			b: 0.9803921568627451);
   at: #steelBlue
		put: (NamedColor
			r: 0.27450980392156865
			g: 0.5098039215686274
			b: 0.7058823529411765);
   at: #lightSteelBlue
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.7686274509803922
			b: 0.8705882352941177);

   at: #lightBlue
		put: (NamedColor
			r: 0.6784313725490196
			g: 0.8470588235294118
			b: 0.9019607843137255);

   at: #powderBlue
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.8784313725490196
			b: 0.9019607843137255);
   at: #paleTurquoise
		put: (NamedColor
			r: 0.6862745098039216
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #darkTurquoise
		put: (NamedColor
			r: 0
			g: 0.807843137254902
			b: 0.8196078431372549);
   at: #mediumTurquoise
		put: (NamedColor
			r: 0.2823529411764706
			g: 0.8196078431372549
			b: 0.8);
   at: #turquoise
		put: (NamedColor
			r: 0.25098039215686274
			g: 0.8784313725490196
			b: 0.8156862745098039);

   at: #cyan
		put: (NamedColor
			r: 0
			g: 1.0
			b: 1.0);
   at: #lightCyan
		put: (NamedColor
			r: 0.8784313725490196
			g: 1.0
			b: 1.0);

   at: #cadetBlue
		put: (NamedColor
			r: 0.37254901960784315
			g: 0.6196078431372549
			b: 0.6274509803921569);
   at: #mediumAquamarine
		put: (NamedColor
			r: 0.4
			g: 0.803921568627451
			b: 0.6666666666666666);
   at: #aquamarine
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0.8313725490196079);
   at: #darkGreen
		put: (NamedColor
			r: 0
			g: 0.39215686274509803
			b: 0);
   at: #darkOliveGreen
		put: (NamedColor
			r: 0.3333333333333333
			g: 0.4196078431372549
			b: 0.1843137254901961);
   at: #darkSeaGreen
		put: (NamedColor
			r: 0.5607843137254902
			g: 0.7372549019607844
			b: 0.5607843137254902);
   at: #seaGreen
		put: (NamedColor
			r: 0.1803921568627451
			g: 0.5450980392156862
			b: 0.3411764705882353);
   at: #mediumSeaGreen
		put: (NamedColor
			r: 0.23529411764705882
			g: 0.7019607843137254
			b: 0.44313725490196076);
   at: #lightSeaGreen
		put: (NamedColor
			r: 0.12549019607843137
			g: 0.6980392156862745
			b: 0.6666666666666666);
   at: #paleGreen
		put: (NamedColor
			r: 0.596078431372549
			g: 0.984313725490196
			b: 0.596078431372549);
   at: #springGreen
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0.4980392156862745);
   at: #lawnGreen
		put: (NamedColor
			r: 0.48627450980392156
			g: 0.9882352941176471
			b: 0);
   at: #green
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0);
   at: #chartreuse
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0);
   at: #mediumSpringGreen
		put: (NamedColor
			r: 0
			g: 0.9803921568627451
			b: 0.6039215686274509);
   at: #greenYellow
		put: (NamedColor
			r: 0.6784313725490196
			g: 1.0
			b: 0.1843137254901961);
   at: #limeGreen
		put: (NamedColor
			r: 0.19607843137254902
			g: 0.803921568627451
			b: 0.19607843137254902);
   at: #yellowGreen
		put: (NamedColor
			r: 0.6039215686274509
			g: 0.803921568627451
			b: 0.19607843137254902);
   at: #forestGreen
		put: (NamedColor
			r: 0.13333333333333333
			g: 0.5450980392156862
			b: 0.13333333333333333);
   at: #oliveDrab
		put: (NamedColor
			r: 0.4196078431372549
			g: 0.5568627450980392
			b: 0.13725490196078433);
   at: #darkKhaki
		put: (NamedColor
			r: 0.7411764705882353
			g: 0.7176470588235294
			b: 0.4196078431372549);
   at: #khaki
		put: (NamedColor
			r: 0.9411764705882353
			g: 0.9019607843137255
			b: 0.5490196078431373);
   at: #paleGoldenrod
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9098039215686274
			b: 0.6666666666666666);
   at: #lightGoldenrodYellow
		put: (NamedColor
			r: 0.9803921568627451
			g: 0.9803921568627451
			b: 0.8235294117647058);
    at: #lightYellow
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0.8784313725490196);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors3
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
  at: #yellow
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0);
   at: #gold
		put: (NamedColor
			r: 1.0
			g: 0.8431372549019608
			b: 0);
   at: #lightGoldenrod
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8666666666666667
			b: 0.5098039215686274);
   at: #goldenrod
		put: (NamedColor
			r: 0.8549019607843137
			g: 0.6470588235294118
			b: 0.12549019607843137);
   at: #darkGoldenrod
		put: (NamedColor
			r: 0.7215686274509804
			g: 0.5254901960784314
			b: 0.043137254901960784);
   at: #rosyBrown
		put: (NamedColor
			r: 0.7372549019607844
			g: 0.5607843137254902
			b: 0.5607843137254902);
   at: #indianRed
		put: (NamedColor
			r: 0.803921568627451
			g: 0.3607843137254902
			b: 0.3607843137254902);
   at: #saddleBrown
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.27058823529411763
			b: 0.07450980392156863);
   at: #sienna
		put: (NamedColor
			r: 0.6274509803921569
			g: 0.3215686274509804
			b: 0.17647058823529413);
   at: #peru
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5215686274509804
			b: 0.24705882352941178);
   at: #burlywood
		put: (NamedColor
			r: 0.8705882352941177
			g: 0.7215686274509804
			b: 0.5294117647058824);
   at: #beige
		put: (NamedColor
			r: 0.9607843137254902
			g: 0.9607843137254902
			b: 0.8627450980392157);
   at: #wheat
		put: (NamedColor
			r: 0.9607843137254902
			g: 0.8705882352941177
			b: 0.7019607843137254);
   at: #sandyBrown
		put: (NamedColor
			r: 0.9568627450980393
			g: 0.6431372549019608
			b: 0.3764705882352941);
   at: #tan
		put: (NamedColor
			r: 0.8235294117647058
			g: 0.7058823529411765
			b: 0.5490196078431373);
   at: #chocolate
		put: (NamedColor
			r: 0.8235294117647058
			g: 0.4117647058823529
			b: 0.11764705882352941);
   at: #firebrick
		put: (NamedColor
			r: 0.6980392156862745
			g: 0.13333333333333333
			b: 0.13333333333333333);
   at: #brown
		put: (NamedColor
			r: 0.6470588235294118
			g: 0.16470588235294117
			b: 0.16470588235294117);
   at: #darkSalmon
		put: (NamedColor
			r: 0.9137254901960784
			g: 0.5882352941176471
			b: 0.47843137254901963);
   at: #salmon
		put: (NamedColor
			r: 0.9803921568627451
			g: 0.5019607843137255
			b: 0.4470588235294118);
   at: #lightSalmon
		put: (NamedColor
			r: 1.0
			g: 0.6274509803921569
			b: 0.47843137254901963);
   at: #orange
		put: (NamedColor
			r: 1.0
			g: 0.6470588235294118
			b: 0);
   at: #darkOrange
		put: (NamedColor
			r: 1.0
			g: 0.5490196078431373
			b: 0);
   at: #coral
		put: (NamedColor
			r: 1.0
			g: 0.4980392156862745
			b: 0.3137254901960784);
   at: #lightCoral
		put: (NamedColor
			r: 0.9411764705882353
			g: 0.5019607843137255
			b: 0.5019607843137255);
   at: #tomato
		put: (NamedColor
			r: 1.0
			g: 0.38823529411764707
			b: 0.2784313725490196);
   at: #orangeRed
		put: (NamedColor
			r: 1.0
			g: 0.27058823529411763
			b: 0);
   at: #red
		put: (NamedColor
			r: 1.0
			g: 0
			b: 0);
   at: #hotPink
		put: (NamedColor
			r: 1.0
			g: 0.4117647058823529
			b: 0.7058823529411765);
   at: #deepPink
		put: (NamedColor
			r: 1.0
			g: 0.0784313725490196
			b: 0.5764705882352941);
   at: #pink
		put: (NamedColor
			r: 1.0
			g: 0.7529411764705882
			b: 0.796078431372549);
   at: #lightPink
		put: (NamedColor
			r: 1.0
			g: 0.7137254901960784
			b: 0.7568627450980392);
   at: #paleVioletRed
		put: (NamedColor
			r: 0.8588235294117647
			g: 0.4392156862745098
			b: 0.5764705882352941);
   at: #maroon
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.18823529411764706
			b: 0.3764705882352941);
   at: #mediumVioletRed
		put: (NamedColor
			r: 0.7803921568627451
			g: 0.08235294117647059
			b: 0.5215686274509804);
   at: #violetRed
		put: (NamedColor
			r: 0.8156862745098039
			g: 0.12549019607843137
			b: 0.5647058823529412);
   at: #magenta
		put: (NamedColor
			r: 1.0
			g: 0
			b: 1.0);
   at: #violet
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.5098039215686274
			b: 0.9333333333333333);
   at: #plum
		put: (NamedColor
			r: 0.8666666666666667
			g: 0.6274509803921569
			b: 0.8666666666666667);
   at: #orchid
		put: (NamedColor
			r: 0.8549019607843137
			g: 0.4392156862745098
			b: 0.8392156862745098);
   at: #mediumOrchid
		put: (NamedColor
			r: 0.7294117647058823
			g: 0.3333333333333333
			b: 0.8274509803921568);
   at: #darkOrchid
		put: (NamedColor
			r: 0.6
			g: 0.19607843137254902
			b: 0.8);
   at: #darkViolet
		put: (NamedColor
			r: 0.5803921568627451
			g: 0
			b: 0.8274509803921568);
   at: #blueViolet
		put: (NamedColor
			r: 0.5411764705882353
			g: 0.16862745098039217
			b: 0.8862745098039215);
   at: #purple
		put: (NamedColor
			r: 0.6274509803921569
			g: 0.12549019607843137
			b: 0.9411764705882353);
   at: #mediumPurple
		put: (NamedColor
			r: 0.5764705882352941
			g: 0.4392156862745098
			b: 0.8588235294117647);
   at: #thistle
		put: (NamedColor
			r: 0.8470588235294118
			g: 0.7490196078431373
			b: 0.8470588235294118);
   at: #snow1
		put: (NamedColor
			r: 1.0
			g: 0.9803921568627451
			b: 0.9803921568627451);
   at: #snow2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9137254901960784
			b: 0.9137254901960784);
   at: #snow3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.788235294117647
			b: 0.788235294117647);
   at: #snow4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5372549019607843
			b: 0.5372549019607843);
   at: #seashell1
		put: (NamedColor
			r: 1.0
			g: 0.9607843137254902
			b: 0.9333333333333333);
   at: #seashell2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8980392156862745
			b: 0.8705882352941177);
   at: #seashell3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7725490196078432
			b: 0.7490196078431373);
   at: #seashell4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5254901960784314
			b: 0.5098039215686274);
   at: #antiqueWhite1
		put: (NamedColor
			r: 1.0
			g: 0.9372549019607843
			b: 0.8588235294117647);
   at: #antiqueWhite2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8745098039215686
			b: 0.8);
   at: #antiqueWhite3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7529411764705882
			b: 0.6901960784313725);
   at: #antiqueWhite4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5137254901960784
			b: 0.47058823529411764);
   at: #bisque1
		put: (NamedColor
			r: 1.0
			g: 0.8941176470588236
			b: 0.7686274509803922);
   at: #bisque2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8352941176470589
			b: 0.7176470588235294);
   at: #bisque3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7176470588235294
			b: 0.6196078431372549);
   at: #bisque4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.49019607843137253
			b: 0.4196078431372549);
   at: #peachPuff1
		put: (NamedColor
			r: 1.0
			g: 0.8549019607843137
			b: 0.7254901960784313);
   at: #peachPuff2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.796078431372549
			b: 0.6784313725490196);
   at: #peachPuff3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.6862745098039216
			b: 0.5843137254901961);
   at: #peachPuff4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4666666666666667
			b: 0.396078431372549);
   at: #navajoWhite1
		put: (NamedColor
			r: 1.0
			g: 0.8705882352941177
			b: 0.6784313725490196);
   at: #navajoWhite2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8117647058823529
			b: 0.6313725490196078);
   at: #navajoWhite3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7019607843137254
			b: 0.5450980392156862);
   at: #navajoWhite4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4745098039215686
			b: 0.3686274509803922);
   at: #lemonChiffon1
		put: (NamedColor
			r: 1.0
			g: 0.9803921568627451
			b: 0.803921568627451);
   at: #lemonChiffon2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9137254901960784
			b: 0.7490196078431373);
   at: #lemonChiffon3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.788235294117647
			b: 0.6470588235294118);
   at: #lemonChiffon4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5372549019607843
			b: 0.4392156862745098);
   at: #cornsilk1
		put: (NamedColor
			r: 1.0
			g: 0.9725490196078431
			b: 0.8627450980392157);
   at: #cornsilk2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9098039215686274
			b: 0.803921568627451);
   at: #cornsilk3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7843137254901961
			b: 0.6941176470588235);
   at: #cornsilk4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5333333333333333
			b: 0.47058823529411764);
   at: #ivory1
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0.9411764705882353);
   at: #ivory2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9333333333333333
			b: 0.8784313725490196);
   at: #ivory3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.803921568627451
			b: 0.7568627450980392);
   at: #ivory4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5450980392156862
			b: 0.5137254901960784);
   at: #honeydew1
		put: (NamedColor
			r: 0.9411764705882353
			g: 1.0
			b: 0.9411764705882353);
   at: #honeydew2
		put: (NamedColor
			r: 0.8784313725490196
			g: 0.9333333333333333
			b: 0.8784313725490196);
   at: #honeydew3
		put: (NamedColor
			r: 0.7568627450980392
			g: 0.803921568627451
			b: 0.7568627450980392);
   at: #honeydew4
		put: (NamedColor
			r: 0.5137254901960784
			g: 0.5450980392156862
			b: 0.5137254901960784);
   at: #lavenderBlush1
		put: (NamedColor
			r: 1.0
			g: 0.9411764705882353
			b: 0.9607843137254902);
   at: #lavenderBlush2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8784313725490196
			b: 0.8980392156862745);
   at: #lavenderBlush3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7568627450980392
			b: 0.7725490196078432);
   at: #lavenderBlush4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5137254901960784
			b: 0.5254901960784314);
   at: #mistyRose1
		put: (NamedColor
			r: 1.0
			g: 0.8941176470588236
			b: 0.8823529411764706);
   at: #mistyRose2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8352941176470589
			b: 0.8235294117647058);
   at: #mistyRose3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7176470588235294
			b: 0.7098039215686275);
   at: #mistyRose4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.49019607843137253
			b: 0.4823529411764706);
   at: #azure1
		put: (NamedColor
			r: 0.9411764705882353
			g: 1.0
			b: 1.0);
   at: #azure2
		put: (NamedColor
			r: 0.8784313725490196
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #azure3
		put: (NamedColor
			r: 0.7568627450980392
			g: 0.803921568627451
			b: 0.803921568627451);
   at: #azure4
		put: (NamedColor
			r: 0.5137254901960784
			g: 0.5450980392156862
			b: 0.5450980392156862);
   at: #slateBlue1
		put: (NamedColor
			r: 0.5137254901960784
			g: 0.43529411764705883
			b: 1.0);
   at: #slateBlue2
		put: (NamedColor
			r: 0.47843137254901963
			g: 0.403921568627451
			b: 0.9333333333333333);
   at: #slateBlue3
		put: (NamedColor
			r: 0.4117647058823529
			g: 0.34901960784313724
			b: 0.803921568627451);
   at: #slateBlue4
		put: (NamedColor
			r: 0.2784313725490196
			g: 0.23529411764705882
			b: 0.5450980392156862);
   at: #royalBlue1
		put: (NamedColor
			r: 0.2823529411764706
			g: 0.4627450980392157
			b: 1.0);
   at: #royalBlue2
		put: (NamedColor
			r: 0.2627450980392157
			g: 0.43137254901960786
			b: 0.9333333333333333);
   at: #royalBlue3
		put: (NamedColor
			r: 0.22745098039215686
			g: 0.37254901960784315
			b: 0.803921568627451);
   at: #royalBlue4
		put: (NamedColor
			r: 0.15294117647058825
			g: 0.25098039215686274
			b: 0.5450980392156862);
   at: #blue1
		put: (NamedColor
			r: 0
			g: 0
			b: 1.0);
   at: #blue2
		put: (NamedColor
			r: 0
			g: 0
			b: 0.9333333333333333);
   at: #blue3
		put: (NamedColor
			r: 0
			g: 0
			b: 0.803921568627451);
   at: #blue4
		put: (NamedColor
			r: 0
			g: 0
			b: 0.5450980392156862);
   at: #dodgerBlue1
		put: (NamedColor
			r: 0.11764705882352941
			g: 0.5647058823529412
			b: 1.0);
   at: #dodgerBlue2
		put: (NamedColor
			r: 0.10980392156862745
			g: 0.5254901960784314
			b: 0.9333333333333333);
   at: #dodgerBlue3
		put: (NamedColor
			r: 0.09411764705882353
			g: 0.4549019607843137
			b: 0.803921568627451);
   at: #dodgerBlue4
		put: (NamedColor
			r: 0.06274509803921569
			g: 0.3058823529411765
			b: 0.5450980392156862);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors4
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
	 at: #steelBlue1
		put: (NamedColor
			r: 0.38823529411764707
			g: 0.7215686274509804
			b: 1.0);
   at: #steelBlue2
		put: (NamedColor
			r: 0.3607843137254902
			g: 0.6745098039215687
			b: 0.9333333333333333);
   at: #steelBlue3
		put: (NamedColor
			r: 0.30980392156862746
			g: 0.5803921568627451
			b: 0.803921568627451);
   at: #steelBlue4
		put: (NamedColor
			r: 0.21176470588235294
			g: 0.39215686274509803
			b: 0.5450980392156862);
   at: #deepSkyBlue1
		put: (NamedColor
			r: 0
			g: 0.7490196078431373
			b: 1.0);
   at: #deepSkyBlue2
		put: (NamedColor
			r: 0
			g: 0.6980392156862745
			b: 0.9333333333333333);
   at: #deepSkyBlue3
		put: (NamedColor
			r: 0
			g: 0.6039215686274509
			b: 0.803921568627451);
   at: #deepSkyBlue4
		put: (NamedColor
			r: 0
			g: 0.40784313725490196
			b: 0.5450980392156862);
   at: #skyBlue1
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.807843137254902
			b: 1.0);
   at: #skyBlue2
		put: (NamedColor
			r: 0.49411764705882355
			g: 0.7529411764705882
			b: 0.9333333333333333);
   at: #skyBlue3
		put: (NamedColor
			r: 0.4235294117647059
			g: 0.6509803921568628
			b: 0.803921568627451);
   at: #skyBlue4
		put: (NamedColor
			r: 0.2901960784313726
			g: 0.4392156862745098
			b: 0.5450980392156862);
   at: #lightSkyBlue1
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.8862745098039215
			b: 1.0);
   at: #lightSkyBlue2
		put: (NamedColor
			r: 0.6431372549019608
			g: 0.8274509803921568
			b: 0.9333333333333333);
   at: #lightSkyBlue3
		put: (NamedColor
			r: 0.5529411764705883
			g: 0.7137254901960784
			b: 0.803921568627451);
   at: #lightSkyBlue4
		put: (NamedColor
			r: 0.3764705882352941
			g: 0.4823529411764706
			b: 0.5450980392156862);
   at: #slateGray1
		put: (NamedColor
			r: 0.7764705882352941
			g: 0.8862745098039215
			b: 1.0);
   at: #slateGray2
		put: (NamedColor
			r: 0.7254901960784313
			g: 0.8274509803921568
			b: 0.9333333333333333);
   at: #slateGray3
		put: (NamedColor
			r: 0.6235294117647059
			g: 0.7137254901960784
			b: 0.803921568627451);
   at: #slateGray4
		put: (NamedColor
			r: 0.4235294117647059
			g: 0.4823529411764706
			b: 0.5450980392156862);
   at: #lightSteelBlue1
		put: (NamedColor
			r: 0.792156862745098
			g: 0.8823529411764706
			b: 1.0);
   at: #lightSteelBlue2
		put: (NamedColor
			r: 0.7372549019607844
			g: 0.8235294117647058
			b: 0.9333333333333333);
   at: #lightSteelBlue3
		put: (NamedColor
			r: 0.6352941176470588
			g: 0.7098039215686275
			b: 0.803921568627451);
   at: #lightSteelBlue4
		put: (NamedColor
			r: 0.43137254901960786
			g: 0.4823529411764706
			b: 0.5450980392156862);
   at: #lightBlue1
		put: (NamedColor
			r: 0.7490196078431373
			g: 0.9372549019607843
			b: 1.0);
   at: #lightBlue2
		put: (NamedColor
			r: 0.6980392156862745
			g: 0.8745098039215686
			b: 0.9333333333333333);
   at: #lightBlue3
		put: (NamedColor
			r: 0.6039215686274509
			g: 0.7529411764705882
			b: 0.803921568627451);
   at: #lightBlue4
		put: (NamedColor
			r: 0.40784313725490196
			g: 0.5137254901960784
			b: 0.5450980392156862);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors5
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
	  at: #lightCyan1
		put: (NamedColor
			r: 0.8784313725490196
			g: 1.0
			b: 1.0);
   at: #lightCyan2
		put: (NamedColor
			r: 0.8196078431372549
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #lightCyan3
		put: (NamedColor
			r: 0.7058823529411765
			g: 0.803921568627451
			b: 0.803921568627451);
   at: #lightCyan4
		put: (NamedColor
			r: 0.47843137254901963
			g: 0.5450980392156862
			b: 0.5450980392156862);
   at: #paleTurquoise1
		put: (NamedColor
			r: 0.7333333333333333
			g: 1.0
			b: 1.0);
   at: #paleTurquoise2
		put: (NamedColor
			r: 0.6823529411764706
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #paleTurquoise3
		put: (NamedColor
			r: 0.5882352941176471
			g: 0.803921568627451
			b: 0.803921568627451);
   at: #paleTurquoise4
		put: (NamedColor
			r: 0.4
			g: 0.5450980392156862
			b: 0.5450980392156862);
   at: #cadetBlue1
		put: (NamedColor
			r: 0.596078431372549
			g: 0.9607843137254902
			b: 1.0);
   at: #cadetBlue2
		put: (NamedColor
			r: 0.5568627450980392
			g: 0.8980392156862745
			b: 0.9333333333333333);
   at: #cadetBlue3
		put: (NamedColor
			r: 0.47843137254901963
			g: 0.7725490196078432
			b: 0.803921568627451);
   at: #cadetBlue4
		put: (NamedColor
			r: 0.3254901960784314
			g: 0.5254901960784314
			b: 0.5450980392156862);
   at: #turquoise1
		put: (NamedColor
			r: 0
			g: 0.9607843137254902
			b: 1.0);
   at: #turquoise2
		put: (NamedColor
			r: 0
			g: 0.8980392156862745
			b: 0.9333333333333333);
   at: #turquoise3
		put: (NamedColor
			r: 0
			g: 0.7725490196078432
			b: 0.803921568627451);
   at: #turquoise4
		put: (NamedColor
			r: 0
			g: 0.5254901960784314
			b: 0.5450980392156862);
   at: #cyan1
		put: (NamedColor
			r: 0
			g: 1.0
			b: 1.0);
   at: #cyan2
		put: (NamedColor
			r: 0
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #cyan3
		put: (NamedColor
			r: 0
			g: 0.803921568627451
			b: 0.803921568627451);
   at: #cyan4
		put: (NamedColor
			r: 0
			g: 0.5450980392156862
			b: 0.5450980392156862);
 at: #darkSlateGray1
		put: (NamedColor
			r: 0.592156862745098
			g: 1.0
			b: 1.0);
   at: #darkSlateGray2
		put: (NamedColor
			r: 0.5529411764705883
			g: 0.9333333333333333
			b: 0.9333333333333333);
   at: #darkSlateGray3
		put: (NamedColor
			r: 0.4745098039215686
			g: 0.803921568627451
			b: 0.803921568627451);
   at: #darkSlateGray4
		put: (NamedColor
			r: 0.3215686274509804
			g: 0.5450980392156862
			b: 0.5450980392156862);
   at: #aquamarine1
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0.8313725490196079);
   at: #aquamarine2
		put: (NamedColor
			r: 0.4627450980392157
			g: 0.9333333333333333
			b: 0.7764705882352941);
   at: #aquamarine3
		put: (NamedColor
			r: 0.4
			g: 0.803921568627451
			b: 0.6666666666666666);
   at: #aquamarine4
		put: (NamedColor
			r: 0.27058823529411763
			g: 0.5450980392156862
			b: 0.4549019607843137);
   at: #darkSeaGreen1
		put: (NamedColor
			r: 0.7568627450980392
			g: 1.0
			b: 0.7568627450980392);
   at: #darkSeaGreen2
		put: (NamedColor
			r: 0.7058823529411765
			g: 0.9333333333333333
			b: 0.7058823529411765);
   at: #darkSeaGreen3
		put: (NamedColor
			r: 0.6078431372549019
			g: 0.803921568627451
			b: 0.6078431372549019);
   at: #darkSeaGreen4
		put: (NamedColor
			r: 0.4117647058823529
			g: 0.5450980392156862
			b: 0.4117647058823529);
   at: #seaGreen1
		put: (NamedColor
			r: 0.32941176470588235
			g: 1.0
			b: 0.6235294117647059);
   at: #seaGreen2
		put: (NamedColor
			r: 0.3058823529411765
			g: 0.9333333333333333
			b: 0.5803921568627451);
   at: #seaGreen3
		put: (NamedColor
			r: 0.2627450980392157
			g: 0.803921568627451
			b: 0.5019607843137255);
   at: #seaGreen4
		put: (NamedColor
			r: 0.1803921568627451
			g: 0.5450980392156862
			b: 0.3411764705882353);
   at: #paleGreen1
		put: (NamedColor
			r: 0.6039215686274509
			g: 1.0
			b: 0.6039215686274509);
   at: #paleGreen2
		put: (NamedColor
			r: 0.5647058823529412
			g: 0.9333333333333333
			b: 0.5647058823529412);
   at: #paleGreen3
		put: (NamedColor
			r: 0.48627450980392156
			g: 0.803921568627451
			b: 0.48627450980392156);
   at: #paleGreen4
		put: (NamedColor
			r: 0.32941176470588235
			g: 0.5450980392156862
			b: 0.32941176470588235);
   at: #springGreen1
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0.4980392156862745);
   at: #springGreen2
		put: (NamedColor
			r: 0
			g: 0.9333333333333333
			b: 0.4627450980392157);
   at: #springGreen3
		put: (NamedColor
			r: 0
			g: 0.803921568627451
			b: 0.4);
   at: #springGreen4
		put: (NamedColor
			r: 0
			g: 0.5450980392156862
			b: 0.27058823529411763);
   at: #green1
		put: (NamedColor
			r: 0
			g: 1.0
			b: 0);
   at: #green2
		put: (NamedColor
			r: 0
			g: 0.9333333333333333
			b: 0);
   at: #green3
		put: (NamedColor
			r: 0
			g: 0.803921568627451
			b: 0);
   at: #green4
		put: (NamedColor
			r: 0
			g: 0.5450980392156862
			b: 0);
			  at: #chartreuse1
		put: (NamedColor
			r: 0.4980392156862745
			g: 1.0
			b: 0);
   at: #chartreuse2
		put: (NamedColor
			r: 0.4627450980392157
			g: 0.9333333333333333
			b: 0);
   at: #chartreuse3
		put: (NamedColor
			r: 0.4
			g: 0.803921568627451
			b: 0);
   at: #chartreuse4
		put: (NamedColor
			r: 0.27058823529411763
			g: 0.5450980392156862
			b: 0);
   at: #oliveDrab1
		put: (NamedColor
			r: 0.7529411764705882
			g: 1.0
			b: 0.24313725490196078);
   at: #oliveDrab2
		put: (NamedColor
			r: 0.7019607843137254
			g: 0.9333333333333333
			b: 0.22745098039215686);
   at: #oliveDrab3
		put: (NamedColor
			r: 0.6039215686274509
			g: 0.803921568627451
			b: 0.19607843137254902);
   at: #oliveDrab4
		put: (NamedColor
			r: 0.4117647058823529
			g: 0.5450980392156862
			b: 0.13333333333333333);
   at: #darkOliveGreen1
		put: (NamedColor
			r: 0.792156862745098
			g: 1.0
			b: 0.4392156862745098);
   at: #darkOliveGreen2
		put: (NamedColor
			r: 0.7372549019607844
			g: 0.9333333333333333
			b: 0.40784313725490196);
   at: #darkOliveGreen3
		put: (NamedColor
			r: 0.6352941176470588
			g: 0.803921568627451
			b: 0.35294117647058826);
   at: #darkOliveGreen4
		put: (NamedColor
			r: 0.43137254901960786
			g: 0.5450980392156862
			b: 0.23921568627450981);
  at: #khaki1
		put: (NamedColor
			r: 1.0
			g: 0.9647058823529412
			b: 0.5607843137254902);
   at: #khaki2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9019607843137255
			b: 0.5215686274509804);
   at: #khaki3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7764705882352941
			b: 0.45098039215686275);
   at: #khaki4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5254901960784314
			b: 0.3058823529411765);
   at: #lightGoldenrod1
		put: (NamedColor
			r: 1.0
			g: 0.9254901960784314
			b: 0.5450980392156862);
   at: #lightGoldenrod2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8627450980392157
			b: 0.5098039215686274);
   at: #lightGoldenrod3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7450980392156863
			b: 0.4392156862745098);
   at: #lightGoldenrod4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5058823529411764
			b: 0.2980392156862745);
   at: #lightYellow1
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0.8784313725490196);
   at: #lightYellow2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9333333333333333
			b: 0.8196078431372549);
   at: #lightYellow3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.803921568627451
			b: 0.7058823529411765);
   at: #lightYellow4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5450980392156862
			b: 0.47843137254901963);
   at: #yellow1
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 0);
   at: #yellow2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.9333333333333333
			b: 0);
   at: #yellow3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.803921568627451
			b: 0);
   at: #yellow4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.5450980392156862
			b: 0);
   at: #gold1
		put: (NamedColor
			r: 1.0
			g: 0.8431372549019608
			b: 0);
   at: #gold2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.788235294117647
			b: 0);
   at: #gold3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.6784313725490196
			b: 0);
   at: #gold4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4588235294117647
			b: 0);
   at: #goldenrod1
		put: (NamedColor
			r: 1.0
			g: 0.7568627450980392
			b: 0.1450980392156863);
   at: #goldenrod2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.7058823529411765
			b: 0.13333333333333333);
   at: #goldenrod3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.6078431372549019
			b: 0.11372549019607843);
   at: #goldenrod4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4117647058823529
			b: 0.0784313725490196);
   at: #darkGoldenrod1
		put: (NamedColor
			r: 1.0
			g: 0.7254901960784313
			b: 0.058823529411764705);
   at: #darkGoldenrod2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6784313725490196
			b: 0.054901960784313725);
   at: #darkGoldenrod3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5843137254901961
			b: 0.047058823529411764);
   at: #darkGoldenrod4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.396078431372549
			b: 0.03137254901960784);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors6
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
  at: #rosyBrown1
		put: (NamedColor
			r: 1.0
			g: 0.7568627450980392
			b: 0.7568627450980392);
   at: #rosyBrown2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.7058823529411765
			b: 0.7058823529411765);
   at: #rosyBrown3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.6078431372549019
			b: 0.6078431372549019);
   at: #rosyBrown4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4117647058823529
			b: 0.4117647058823529);
   at: #indianRed1
		put: (NamedColor
			r: 1.0
			g: 0.41568627450980394
			b: 0.41568627450980394);
   at: #indianRed2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.38823529411764707
			b: 0.38823529411764707);
   at: #indianRed3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.3333333333333333
			b: 0.3333333333333333);
   at: #indianRed4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.22745098039215686
			b: 0.22745098039215686);
   at: #sienna1
		put: (NamedColor
			r: 1.0
			g: 0.5098039215686274
			b: 0.2784313725490196);
   at: #sienna2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.4745098039215686
			b: 0.25882352941176473);
   at: #sienna3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.40784313725490196
			b: 0.2235294117647059);
   at: #sienna4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.2784313725490196
			b: 0.14901960784313725);
   at: #burlywood1
		put: (NamedColor
			r: 1.0
			g: 0.8274509803921568
			b: 0.6078431372549019);
   at: #burlywood2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.7725490196078432
			b: 0.5686274509803921);
   at: #burlywood3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.6666666666666666
			b: 0.49019607843137253);
   at: #burlywood4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.45098039215686275
			b: 0.3333333333333333);
   at: #wheat1
		put: (NamedColor
			r: 1.0
			g: 0.9058823529411765
			b: 0.7294117647058823);
   at: #wheat2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8470588235294118
			b: 0.6823529411764706);
   at: #wheat3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7294117647058823
			b: 0.5882352941176471);
   at: #wheat4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.49411764705882355
			b: 0.4);
   at: #tan1
		put: (NamedColor
			r: 1.0
			g: 0.6470588235294118
			b: 0.30980392156862746);
   at: #tan2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6039215686274509
			b: 0.28627450980392155);
   at: #tan3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5215686274509804
			b: 0.24705882352941178);
   at: #tan4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.35294117647058826
			b: 0.16862745098039217);
   at: #chocolate1
		put: (NamedColor
			r: 1.0
			g: 0.4980392156862745
			b: 0.1411764705882353);
   at: #chocolate2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.4627450980392157
			b: 0.12941176470588237);
   at: #chocolate3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.4
			b: 0.11372549019607843);
   at: #chocolate4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.27058823529411763
			b: 0.07450980392156863);
   at: #firebrick1
		put: (NamedColor
			r: 1.0
			g: 0.18823529411764706
			b: 0.18823529411764706);
   at: #firebrick2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.17254901960784313
			b: 0.17254901960784313);
   at: #firebrick3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.14901960784313725
			b: 0.14901960784313725);
   at: #firebrick4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.10196078431372549
			b: 0.10196078431372549);
   at: #brown1
		put: (NamedColor
			r: 1.0
			g: 0.25098039215686274
			b: 0.25098039215686274);
   at: #brown2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.23137254901960785
			b: 0.23137254901960785);
   at: #brown3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.2
			b: 0.2);
   at: #brown4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.13725490196078433
			b: 0.13725490196078433);
   at: #salmon1
		put: (NamedColor
			r: 1.0
			g: 0.5490196078431373
			b: 0.4117647058823529);
   at: #salmon2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.5098039215686274
			b: 0.3843137254901961);
   at: #salmon3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.4392156862745098
			b: 0.32941176470588235);
   at: #salmon4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.2980392156862745
			b: 0.2235294117647059);
   at: #lightSalmon1
		put: (NamedColor
			r: 1.0
			g: 0.6274509803921569
			b: 0.47843137254901963);
   at: #lightSalmon2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.5843137254901961
			b: 0.4470588235294118);
   at: #lightSalmon3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5058823529411764
			b: 0.3843137254901961);
   at: #lightSalmon4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.3411764705882353
			b: 0.25882352941176473);
   at: #orange1
		put: (NamedColor
			r: 1.0
			g: 0.6470588235294118
			b: 0);
   at: #orange2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6039215686274509
			b: 0);
   at: #orange3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5215686274509804
			b: 0);
   at: #orange4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.35294117647058826
			b: 0);
   at: #darkOrange1
		put: (NamedColor
			r: 1.0
			g: 0.4980392156862745
			b: 0);
   at: #darkOrange2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.4627450980392157
			b: 0);
   at: #darkOrange3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.4
			b: 0);
   at: #darkOrange4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.27058823529411763
			b: 0);
   at: #coral1
		put: (NamedColor
			r: 1.0
			g: 0.4470588235294118
			b: 0.33725490196078434);
   at: #coral2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.41568627450980394
			b: 0.3137254901960784);
   at: #coral3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.3568627450980392
			b: 0.27058823529411763);
   at: #coral4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.24313725490196078
			b: 0.1843137254901961);
   at: #tomato1
		put: (NamedColor
			r: 1.0
			g: 0.38823529411764707
			b: 0.2784313725490196);
   at: #tomato2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.3607843137254902
			b: 0.25882352941176473);
   at: #tomato3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.30980392156862746
			b: 0.2235294117647059);
   at: #tomato4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.21176470588235294
			b: 0.14901960784313725);
   at: #orangeRed1
		put: (NamedColor
			r: 1.0
			g: 0.27058823529411763
			b: 0);
   at: #orangeRed2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.25098039215686274
			b: 0);
   at: #orangeRed3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.21568627450980393
			b: 0);
   at: #orangeRed4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.1450980392156863
			b: 0);
   at: #red1
		put: (NamedColor
			r: 1.0
			g: 0
			b: 0);
   at: #red2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0
			b: 0);
   at: #red3
		put: (NamedColor
			r: 0.803921568627451
			g: 0
			b: 0);
   at: #red4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0
			b: 0);
   at: #deepPink1
		put: (NamedColor
			r: 1.0
			g: 0.0784313725490196
			b: 0.5764705882352941);
   at: #deepPink2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.07058823529411765
			b: 0.5372549019607843);
   at: #deepPink3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.06274509803921569
			b: 0.4627450980392157);
   at: #deepPink4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.0392156862745098
			b: 0.3137254901960784);
   at: #hotPink1
		put: (NamedColor
			r: 1.0
			g: 0.43137254901960786
			b: 0.7058823529411765);
   at: #hotPink2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.41568627450980394
			b: 0.6549019607843137);
   at: #hotPink3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.3764705882352941
			b: 0.5647058823529412);
   at: #hotPink4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.22745098039215686
			b: 0.3843137254901961);
   at: #pink1
		put: (NamedColor
			r: 1.0
			g: 0.7098039215686275
			b: 0.7725490196078432);
   at: #pink2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6627450980392157
			b: 0.7215686274509804);
   at: #pink3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5686274509803921
			b: 0.6196078431372549);
   at: #pink4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.38823529411764707
			b: 0.4235294117647059);
   at: #lightPink1
		put: (NamedColor
			r: 1.0
			g: 0.6823529411764706
			b: 0.7254901960784313);
   at: #lightPink2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6352941176470588
			b: 0.6784313725490196);
   at: #lightPink3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5490196078431373
			b: 0.5843137254901961);
   at: #lightPink4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.37254901960784315
			b: 0.396078431372549);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors7
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
    at: #paleVioletRed1
		put: (NamedColor
			r: 1.0
			g: 0.5098039215686274
			b: 0.6705882352941176);
   at: #paleVioletRed2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.4745098039215686
			b: 0.6235294117647059);
   at: #paleVioletRed3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.40784313725490196
			b: 0.5372549019607843);
   at: #paleVioletRed4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.2784313725490196
			b: 0.36470588235294116);
   at: #maroon1
		put: (NamedColor
			r: 1.0
			g: 0.20392156862745098
			b: 0.7019607843137254);
   at: #maroon2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.18823529411764706
			b: 0.6549019607843137);
   at: #maroon3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.1607843137254902
			b: 0.5647058823529412);
   at: #maroon4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.10980392156862745
			b: 0.3843137254901961);
   at: #violetRed1
		put: (NamedColor
			r: 1.0
			g: 0.24313725490196078
			b: 0.5882352941176471);
   at: #violetRed2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.22745098039215686
			b: 0.5490196078431373);
   at: #violetRed3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.19607843137254902
			b: 0.47058823529411764);
   at: #violetRed4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.13333333333333333
			b: 0.3215686274509804);
   at: #magenta1
		put: (NamedColor
			r: 1.0
			g: 0
			b: 1.0);
   at: #magenta2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0
			b: 0.9333333333333333);
   at: #magenta3
		put: (NamedColor
			r: 0.803921568627451
			g: 0
			b: 0.803921568627451);
   at: #magenta4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0
			b: 0.5450980392156862);
   at: #orchid1
		put: (NamedColor
			r: 1.0
			g: 0.5137254901960784
			b: 0.9803921568627451);
   at: #orchid2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.47843137254901963
			b: 0.9137254901960784);
   at: #orchid3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.4117647058823529
			b: 0.788235294117647);
   at: #orchid4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.2784313725490196
			b: 0.5372549019607843);
   at: #plum1
		put: (NamedColor
			r: 1.0
			g: 0.7333333333333333
			b: 1.0);
   at: #plum2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.6823529411764706
			b: 0.9333333333333333);
   at: #plum3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.5882352941176471
			b: 0.803921568627451);
   at: #plum4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4
			b: 0.5450980392156862);
   at: #mediumOrchid1
		put: (NamedColor
			r: 0.8784313725490196
			g: 0.4
			b: 1.0);
   at: #mediumOrchid2
		put: (NamedColor
			r: 0.8196078431372549
			g: 0.37254901960784315
			b: 0.9333333333333333);
   at: #mediumOrchid3
		put: (NamedColor
			r: 0.7058823529411765
			g: 0.3215686274509804
			b: 0.803921568627451);
   at: #mediumOrchid4
		put: (NamedColor
			r: 0.47843137254901963
			g: 0.21568627450980393
			b: 0.5450980392156862);
   at: #darkOrchid1
		put: (NamedColor
			r: 0.7490196078431373
			g: 0.24313725490196078
			b: 1.0);
   at: #darkOrchid2
		put: (NamedColor
			r: 0.6980392156862745
			g: 0.22745098039215686
			b: 0.9333333333333333);
   at: #darkOrchid3
		put: (NamedColor
			r: 0.6039215686274509
			g: 0.19607843137254902
			b: 0.803921568627451);
   at: #markOrchid4
		put: (NamedColor
			r: 0.40784313725490196
			g: 0.13333333333333333
			b: 0.5450980392156862);
   at: #purple1
		put: (NamedColor
			r: 0.6078431372549019
			g: 0.18823529411764706
			b: 1.0);
   at: #purple2
		put: (NamedColor
			r: 0.5686274509803921
			g: 0.17254901960784313
			b: 0.9333333333333333);
   at: #purple3
		put: (NamedColor
			r: 0.49019607843137253
			g: 0.14901960784313725
			b: 0.803921568627451);
   at: #purple4
		put: (NamedColor
			r: 0.3333333333333333
			g: 0.10196078431372549
			b: 0.5450980392156862);
   at: #mediumPurple1
		put: (NamedColor
			r: 0.6705882352941176
			g: 0.5098039215686274
			b: 1.0);
   at: #mediumPurple2
		put: (NamedColor
			r: 0.6235294117647059
			g: 0.4745098039215686
			b: 0.9333333333333333);
   at: #mediumPurple3
		put: (NamedColor
			r: 0.5372549019607843
			g: 0.40784313725490196
			b: 0.803921568627451);
   at: #mediumPurple4
		put: (NamedColor
			r: 0.36470588235294116
			g: 0.2784313725490196
			b: 0.5450980392156862);
   at: #thistle1
		put: (NamedColor
			r: 1.0
			g: 0.8823529411764706
			b: 1.0);
   at: #thistle2
		put: (NamedColor
			r: 0.9333333333333333
			g: 0.8235294117647058
			b: 0.9333333333333333);
   at: #thistle3
		put: (NamedColor
			r: 0.803921568627451
			g: 0.7098039215686275
			b: 0.803921568627451);
   at: #thistle4
		put: (NamedColor
			r: 0.5450980392156862
			g: 0.4823529411764706
			b: 0.5450980392156862);
 
   at: #darkBlue
		put: (NamedColor
			r: 0
			g: 0
			b: 0.5450980392156862);
   at: #darkCyan
		put: (NamedColor
			r: 0
			g: 0.5450980392156862
			b: 0.5450980392156862);
   at: #darkMagenta
		put: (NamedColor
			r: 0.5450980392156862
			g: 0
			b: 0.5450980392156862);
   at: #darkRed
		put: (NamedColor
			r: 0.5450980392156862
			g: 0
			b: 0);

   at: #lightGreen
		put: (NamedColor
			r: 0.5647058823529412
			g: 0.9333333333333333
			b: 0.5647058823529412);
			yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:06'!
css3NamedColors8
	"Answer a dictionary of CCS3 color name to Color objects."

	^Dictionary new
   at: #gray0
		put: (NamedColor
			r: 0
			g: 0
			b: 0);
   at: #gray1
		put: (NamedColor
			r: 0.011764705882352941
			g: 0.011764705882352941
			b: 0.011764705882352941);
   at: #grey2
		put: (NamedColor
			r: 0.0196078431372549
			g: 0.0196078431372549
			b: 0.0196078431372549);
   at: #gray3
		put: (NamedColor
			r: 0.03137254901960784
			g: 0.03137254901960784
			b: 0.03137254901960784);
   at: #grey4
		put: (NamedColor
			r: 0.0392156862745098
			g: 0.0392156862745098
			b: 0.0392156862745098);
   at: #gray5
		put: (NamedColor
			r: 0.050980392156862744
			g: 0.050980392156862744
			b: 0.050980392156862744);
   at: #grey6
		put: (NamedColor
			r: 0.058823529411764705
			g: 0.058823529411764705
			b: 0.058823529411764705);
   at: #gray7
		put: (NamedColor
			r: 0.07058823529411765
			g: 0.07058823529411765
			b: 0.07058823529411765);
   at: #grey8
		put: (NamedColor
			r: 0.0784313725490196
			g: 0.0784313725490196
			b: 0.0784313725490196);
   at: #gray9
		put: (NamedColor
			r: 0.09019607843137255
			g: 0.09019607843137255
			b: 0.09019607843137255);
   at: #grey10
		put: (NamedColor
			r: 0.10196078431372549
			g: 0.10196078431372549
			b: 0.10196078431372549);
   at: #gray11
		put: (NamedColor
			r: 0.10980392156862745
			g: 0.10980392156862745
			b: 0.10980392156862745);
   at: #grey12
		put: (NamedColor
			r: 0.12156862745098039
			g: 0.12156862745098039
			b: 0.12156862745098039);
   at: #gray13
		put: (NamedColor
			r: 0.12941176470588237
			g: 0.12941176470588237
			b: 0.12941176470588237);
   at: #grey13
		put: (NamedColor
			r: 0.12941176470588237
			g: 0.12941176470588237
			b: 0.12941176470588237);
   at: #gray14
		put: (NamedColor
			r: 0.1411764705882353
			g: 0.1411764705882353
			b: 0.1411764705882353);
   at: #grey15
		put: (NamedColor
			r: 0.14901960784313725
			g: 0.14901960784313725
			b: 0.14901960784313725);
   at: #gray16
		put: (NamedColor
			r: 0.1607843137254902
			g: 0.1607843137254902
			b: 0.1607843137254902);
   at: #grey17
		put: (NamedColor
			r: 0.16862745098039217
			g: 0.16862745098039217
			b: 0.16862745098039217);
   at: #gray18
		put: (NamedColor
			r: 0.1803921568627451
			g: 0.1803921568627451
			b: 0.1803921568627451);
   at: #grey19
		put: (NamedColor
			r: 0.18823529411764706
			g: 0.18823529411764706
			b: 0.18823529411764706);
   at: #gray20
		put: (NamedColor
			r: 0.2
			g: 0.2
			b: 0.2);
   at: #grey21
		put: (NamedColor
			r: 0.21176470588235294
			g: 0.21176470588235294
			b: 0.21176470588235294);
   at: #gray22
		put: (NamedColor
			r: 0.2196078431372549
			g: 0.2196078431372549
			b: 0.2196078431372549);
   at: #grey23
		put: (NamedColor
			r: 0.23137254901960785
			g: 0.23137254901960785
			b: 0.23137254901960785);
   at: #gray24
		put: (NamedColor
			r: 0.23921568627450981
			g: 0.23921568627450981
			b: 0.23921568627450981);
   at: #grey25
		put: (NamedColor
			r: 0.25098039215686274
			g: 0.25098039215686274
			b: 0.25098039215686274);
   at: #gray26
		put: (NamedColor
			r: 0.25882352941176473
			g: 0.25882352941176473
			b: 0.25882352941176473);
   at: #grey27
		put: (NamedColor
			r: 0.27058823529411763
			g: 0.27058823529411763
			b: 0.27058823529411763);
   at: #gray28
		put: (NamedColor
			r: 0.2784313725490196
			g: 0.2784313725490196
			b: 0.2784313725490196);
   at: #grey29
		put: (NamedColor
			r: 0.2901960784313726
			g: 0.2901960784313726
			b: 0.2901960784313726);
   at: #gray30
		put: (NamedColor
			r: 0.30196078431372547
			g: 0.30196078431372547
			b: 0.30196078431372547);
   at: #grey31
		put: (NamedColor
			r: 0.30980392156862746
			g: 0.30980392156862746
			b: 0.30980392156862746);
   at: #gray32
		put: (NamedColor
			r: 0.3215686274509804
			g: 0.3215686274509804
			b: 0.3215686274509804);
   at: #grey33
		put: (NamedColor
			r: 0.32941176470588235
			g: 0.32941176470588235
			b: 0.32941176470588235);
   at: #gray34
		put: (NamedColor
			r: 0.3411764705882353
			g: 0.3411764705882353
			b: 0.3411764705882353);
   at: #grey35
		put: (NamedColor
			r: 0.34901960784313724
			g: 0.34901960784313724
			b: 0.34901960784313724);
   at: #gray36
		put: (NamedColor
			r: 0.3607843137254902
			g: 0.3607843137254902
			b: 0.3607843137254902);
   at: #grey37
		put: (NamedColor
			r: 0.3686274509803922
			g: 0.3686274509803922
			b: 0.3686274509803922);
   at: #gray38
		put: (NamedColor
			r: 0.3803921568627451
			g: 0.3803921568627451
			b: 0.3803921568627451);
   at: #grey39
		put: (NamedColor
			r: 0.38823529411764707
			g: 0.38823529411764707
			b: 0.38823529411764707);
   at: #gray40
		put: (NamedColor
			r: 0.4
			g: 0.4
			b: 0.4);
   at: #grey41
		put: (NamedColor
			r: 0.4117647058823529
			g: 0.4117647058823529
			b: 0.4117647058823529);
   at: #grey42
		put: (NamedColor
			r: 0.4196078431372549
			g: 0.4196078431372549
			b: 0.4196078431372549);
   at: #gray43
		put: (NamedColor
			r: 0.43137254901960786
			g: 0.43137254901960786
			b: 0.43137254901960786);
   at: #grey44
		put: (NamedColor
			r: 0.4392156862745098
			g: 0.4392156862745098
			b: 0.4392156862745098);
   at: #gray45
		put: (NamedColor
			r: 0.45098039215686275
			g: 0.45098039215686275
			b: 0.45098039215686275);
   at: #grey46
		put: (NamedColor
			r: 0.4588235294117647
			g: 0.4588235294117647
			b: 0.4588235294117647);
   at: #gray47
		put: (NamedColor
			r: 0.47058823529411764
			g: 0.47058823529411764
			b: 0.47058823529411764);
   at: #grey48
		put: (NamedColor
			r: 0.47843137254901963
			g: 0.47843137254901963
			b: 0.47843137254901963);
   at: #gray49
		put: (NamedColor
			r: 0.49019607843137253
			g: 0.49019607843137253
			b: 0.49019607843137253);
   at: #grey50
		put: (NamedColor
			r: 0.4980392156862745
			g: 0.4980392156862745
			b: 0.4980392156862745);
   at: #gray51
		put: (NamedColor
			r: 0.5098039215686274
			g: 0.5098039215686274
			b: 0.5098039215686274);
   at: #grey52
		put: (NamedColor
			r: 0.5215686274509804
			g: 0.5215686274509804
			b: 0.5215686274509804);
   at: #gray53
		put: (NamedColor
			r: 0.5294117647058824
			g: 0.5294117647058824
			b: 0.5294117647058824);
   at: #grey54
		put: (NamedColor
			r: 0.5411764705882353
			g: 0.5411764705882353
			b: 0.5411764705882353);
   at: #gray55
		put: (NamedColor
			r: 0.5490196078431373
			g: 0.5490196078431373
			b: 0.5490196078431373);
   at: #grey56
		put: (NamedColor
			r: 0.5607843137254902
			g: 0.5607843137254902
			b: 0.5607843137254902);
   at: #gray57
		put: (NamedColor
			r: 0.5686274509803921
			g: 0.5686274509803921
			b: 0.5686274509803921);
   at: #grey58
		put: (NamedColor
			r: 0.5803921568627451
			g: 0.5803921568627451
			b: 0.5803921568627451);
   at: #gray59
		put: (NamedColor
			r: 0.5882352941176471
			g: 0.5882352941176471
			b: 0.5882352941176471);
   at: #grey60
		put: (NamedColor
			r: 0.6
			g: 0.6
			b: 0.6);
   at: #gray61
		put: (NamedColor
			r: 0.611764705882353
			g: 0.611764705882353
			b: 0.611764705882353);
   at: #grey62
		put: (NamedColor
			r: 0.6196078431372549
			g: 0.6196078431372549
			b: 0.6196078431372549);
   at: #gray63
		put: (NamedColor
			r: 0.6313725490196078
			g: 0.6313725490196078
			b: 0.6313725490196078);
   at: #grey64
		put: (NamedColor
			r: 0.6392156862745098
			g: 0.6392156862745098
			b: 0.6392156862745098);
   at: #gray65
		put: (NamedColor
			r: 0.6509803921568628
			g: 0.6509803921568628
			b: 0.6509803921568628);
   at: #grey66
		put: (NamedColor
			r: 0.6588235294117647
			g: 0.6588235294117647
			b: 0.6588235294117647);
   at: #gray67
		put: (NamedColor
			r: 0.6705882352941176
			g: 0.6705882352941176
			b: 0.6705882352941176);
   at: #grey68
		put: (NamedColor
			r: 0.6784313725490196
			g: 0.6784313725490196
			b: 0.6784313725490196);
   at: #gray69
		put: (NamedColor
			r: 0.6901960784313725
			g: 0.6901960784313725
			b: 0.6901960784313725);
   at: #grey70
		put: (NamedColor
			r: 0.7019607843137254
			g: 0.7019607843137254
			b: 0.7019607843137254);
   at: #gray71
		put: (NamedColor
			r: 0.7098039215686275
			g: 0.7098039215686275
			b: 0.7098039215686275);
   at: #grey72
		put: (NamedColor
			r: 0.7215686274509804
			g: 0.7215686274509804
			b: 0.7215686274509804);
   at: #gray73
		put: (NamedColor
			r: 0.7294117647058823
			g: 0.7294117647058823
			b: 0.7294117647058823);
   at: #grey74
		put: (NamedColor
			r: 0.7411764705882353
			g: 0.7411764705882353
			b: 0.7411764705882353);
   at: #gray75
		put: (NamedColor
			r: 0.7490196078431373
			g: 0.7490196078431373
			b: 0.7490196078431373);
   at: #grey76
		put: (NamedColor
			r: 0.7607843137254902
			g: 0.7607843137254902
			b: 0.7607843137254902);
   at: #gray77
		put: (NamedColor
			r: 0.7686274509803922
			g: 0.7686274509803922
			b: 0.7686274509803922);
   at: #grey78
		put: (NamedColor
			r: 0.7803921568627451
			g: 0.7803921568627451
			b: 0.7803921568627451);
   at: #gray79
		put: (NamedColor
			r: 0.788235294117647
			g: 0.788235294117647
			b: 0.788235294117647);
   at: #grey80
		put: (NamedColor
			r: 0.8
			g: 0.8
			b: 0.8);
   at: #gray81
		put: (NamedColor
			r: 0.8117647058823529
			g: 0.8117647058823529
			b: 0.8117647058823529);
   at: #grey82
		put: (NamedColor
			r: 0.8196078431372549
			g: 0.8196078431372549
			b: 0.8196078431372549);
   at: #gray83
		put: (NamedColor
			r: 0.8313725490196079
			g: 0.8313725490196079
			b: 0.8313725490196079);
   at: #grey84
		put: (NamedColor
			r: 0.8392156862745098
			g: 0.8392156862745098
			b: 0.8392156862745098);
   at: #gray85
		put: (NamedColor
			r: 0.8509803921568627
			g: 0.8509803921568627
			b: 0.8509803921568627);
   at: #grey86
		put: (NamedColor
			r: 0.8588235294117647
			g: 0.8588235294117647
			b: 0.8588235294117647);
   at: #gray87
		put: (NamedColor
			r: 0.8705882352941177
			g: 0.8705882352941177
			b: 0.8705882352941177);
   at: #grey88
		put: (NamedColor
			r: 0.8784313725490196
			g: 0.8784313725490196
			b: 0.8784313725490196);
   at: #gray89
		put: (NamedColor
			r: 0.8901960784313725
			g: 0.8901960784313725
			b: 0.8901960784313725);
   at: #grey90
		put: (NamedColor
			r: 0.8980392156862745
			g: 0.8980392156862745
			b: 0.8980392156862745);
   at: #gray91
		put: (NamedColor
			r: 0.9098039215686274
			g: 0.9098039215686274
			b: 0.9098039215686274);
   at: #grey92
		put: (NamedColor
			r: 0.9215686274509803
			g: 0.9215686274509803
			b: 0.9215686274509803);
   at: #gray93
		put: (NamedColor
			r: 0.9294117647058824
			g: 0.9294117647058824
			b: 0.9294117647058824);
   at: #grey93
		put: (NamedColor
			r: 0.9294117647058824
			g: 0.9294117647058824
			b: 0.9294117647058824);
at: #grey94
		put: (NamedColor
			r: 0.9411764705882353
			g: 0.9411764705882353
			b: 0.9411764705882353);
   at: #grey95
		put: (NamedColor
			r: 0.9490196078431372
			g: 0.9490196078431372
			b: 0.9490196078431372);
   at: #grey96
		put: (NamedColor
			r: 0.9607843137254902
			g: 0.9607843137254902
			b: 0.9607843137254902);
   at: #grey97
		put: (NamedColor
			r: 0.9686274509803922
			g: 0.9686274509803922
			b: 0.9686274509803922);
   at: #grey98
		put: (NamedColor
			r: 0.9803921568627451
			g: 0.9803921568627451
			b: 0.9803921568627451);
   at: #grey99
		put: (NamedColor
			r: 0.9882352941176471
			g: 0.9882352941176471
			b: 0.9882352941176471);
   at: #grey100
		put: (NamedColor
			r: 1.0
			g: 1.0
			b: 1.0);
   at: #darkGray
		put: (NamedColor
			r: 0.6627450980392157
			g: 0.6627450980392157
			b: 0.6627450980392157);
			yourself! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 13:51'!
dictionary

	"Answer my ColorName->Color Dictionary"
	^ ColorNameDict ! !

!NamedColor class methodsFor: 'class initialization' stamp: 'KenD 1/24/2013 13:49'!
initialize

	"Start with a small but useful dictionary of color names"
	
	ColorNameDict := self xkcdFirst48 
! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 15:32'!
nbsisccNamedColors
	"Answer a dictionary of NBS-ISCC compliant color names to Color objects.
	http://tx4.us/nbs-iscc.htm"

"
	self css3NamedColors explore.
"
	| nbsisccDict |
	nbsisccDict _ self nbsisccNamedColors1 addAll: 
		self nbsisccNamedColors2; addAll: 
		self nbsisccNamedColors3; yourself.
		
	^nbsisccDict! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:12'!
nbsisccNamedColors1
	"Answer a dictionary of NBS-ISCC compliant color names to Color objects.
	First half!!"

	^Dictionary new
    at: #vividPink  put: (NamedColor fromString: '#fFB5BA');
    at: #strongPink  put: (NamedColor fromString: '#eA9399');
    at: #deepPink  put: (NamedColor fromString: '#e4717A');
    at: #lightPink  put: (NamedColor fromString: '#f9CCCA');
    at: #moderatePink  put: (NamedColor fromString: '#dEA5A4');
    at: #darkPink  put: (NamedColor fromString: '#c08081');
    at: #palePink  put: (NamedColor fromString: '#eAD8D7');
    at: #grayishPink  put: (NamedColor fromString: '#c4AEAD');
    at: #pinkishWhite  put: (NamedColor fromString: '#eAE3E1');
    at: #pinkishGray  put: (NamedColor fromString: '#c1B6B3');
    at: #vividRed  put: (NamedColor fromString: '#bE0032');
    at: #strongRed  put: (NamedColor fromString: '#bC3F4A');
    at: #deepRed  put: (NamedColor fromString: '#841B2D');
    at: #veryDeepRed  put: (NamedColor fromString: '#5C0923');
    at: #moderateRed  put: (NamedColor fromString: '#aB4E52');
    at: #darkRed  put: (NamedColor fromString: '#722F37');
    at: #veryDarkRed  put: (NamedColor fromString: '#3F1728');
    at: #lightGrayishRed put: (NamedColor fromString: '#aD8884');
    at: #grayishRed  put: (NamedColor fromString: '#905D5D');
    at: #darkGrayishRed put: (NamedColor fromString: '#543D3F');
    at: #blackishRed  put: (NamedColor fromString: '#2E1D21');
    at: #reddishGray  put: (NamedColor fromString: '#8F817F');
    at: #darkReddishGray put: (NamedColor fromString: '#5C504F');
    at: #reddishBlack  put: (NamedColor fromString: '#282022');
    at: #vividYellowishPink put: (NamedColor fromString: '#fFB7A5');
    at: #strongYellowishPink put: (NamedColor fromString: '#f99379');
    at: #deepYellowishPink put: (NamedColor fromString: '#e66721');
    at: #lightYellowishPink put: (NamedColor fromString: '#f4C2C2');
    at: #moderateYellowishPink put: (NamedColor fromString: '#d9A6A9');
    at: #darkYellowishPink put: (NamedColor fromString: '#c48379');
    at: #paleYellowishPink put: (NamedColor fromString: '#eCD5C5');
    at: #grayishYellowishPink put: (NamedColor fromString: '#c7ADA3');
    at: #brownishPink  put: (NamedColor fromString: '#c2AC99');
    at: #vividReddishOrange put: (NamedColor fromString: '#e25822');
    at: #strongReddishOrange put: (NamedColor fromString: '#d9603B');
    at: #deepReddishOrange put: (NamedColor fromString: '#aA381E');
    at: #moderateReddishOrange put: (NamedColor fromString: '#cB6D51');
    at: #darkReddishOrange put: (NamedColor fromString: '#9E4732');
    at: #grayishReddishOrange put: (NamedColor fromString: '#b4745E');
    at: #strongReddishBrown put: (NamedColor fromString: '#882D17');
    at: #deepReddishBrown put: (NamedColor fromString: '#56070C');
    at: #lightReddishBrown put: (NamedColor fromString: '#a87C6D');
    at: #moderateReddishBrown put: (NamedColor fromString: '#79443B');
    at: #darkReddishBrown put: (NamedColor fromString: '#3E1D1E');
    at: #lightGrayishReddishBrown  put: (NamedColor fromString: '#977F73');
    at: #grayishReddishBrown put: (NamedColor fromString: '#674C47');
    at: #darkGrayishReddishBrown  put: (NamedColor fromString: '#43302E');
    at: #vividOrange  put: (NamedColor fromString: '#f38400');
    at: #brilliantOrange put: (NamedColor fromString: '#fD943F');
    at: #strongOrange  put: (NamedColor fromString: '#eD872D');
    at: #deepOrange  put: (NamedColor fromString: '#bE6516');
    at: #lightOrange  put: (NamedColor fromString: '#fAB57F');
    at: #moderateOrange  put: (NamedColor fromString: '#d99058');
    at: #brownishOrange  put: (NamedColor fromString: '#aE6938');
    at: #strongBrown  put: (NamedColor fromString: '#80461B');
    at: #deepBrown  put: (NamedColor fromString: '#593319');
    at: #lightBrown  put: (NamedColor fromString: '#a67B5B');
    at: #moderateBrown  put: (NamedColor fromString: '#6F4E37');
    at: #darkBrown  put: (NamedColor fromString: '#422518');
    at: #lightGrayishBrown put: (NamedColor fromString: '#958070');
    at: #grayishBrown  put: (NamedColor fromString: '#635147');
    at: #darkGrayishBrown put: (NamedColor fromString: '#3E322C');
    at: #lightBrownishGray put: (NamedColor fromString: '#8E8279');
    at: #brownishGray  put: (NamedColor fromString: '#5B504F');
    at: #brownishBlack  put: (NamedColor fromString: '#28201C');
    at: #vividOrangeYellow put: (NamedColor fromString: '#f6A600');
    at: #brilliantOrangeYellow put: (NamedColor fromString: '#fFC14F');
    at: #strongOrangeYellow put: (NamedColor fromString: '#eAA221');
    at: #deepOrangeYellow put: (NamedColor fromString: '#c98500');
    at: #lightOrangeYellow put: (NamedColor fromString: '#fBC97F');
    at: #moderateOrangeYellow put: (NamedColor fromString: '#e3A857');
    at: #darkOrangeYellow put: (NamedColor fromString: '#bE8A3D');
    at: #paleOrangeYellow put: (NamedColor fromString: '#fAD6A5');
    at: #strongYellowishBrown put: (NamedColor fromString: '#996515');
    at: #deepYellowishBrown put: (NamedColor fromString: '#654522');
    at: #lightYellowishBrown put: (NamedColor fromString: '#c19A6B');
    at: #moderateYellowishBrown  put: (NamedColor fromString: '#826644');
    at: #darkYellowishBrown put: (NamedColor fromString: '#4B3621');
    at: #lightGrayishYellowishBrown  put: (NamedColor fromString: '#aE9B82');
    at: #grayishYellowishBrown put: (NamedColor fromString: '#7E6D5A');
    at: #darkGrayishYellowishBrown  put: (NamedColor fromString: '#483C32');
    at: #vividYellow  put: (NamedColor fromString: '#f3C300');
    at: #brilliantYellow put: (NamedColor fromString: '#fADA5E');
    at: #strongYellow  put: (NamedColor fromString: '#d4AF37');
    at: #deepYellow  put: (NamedColor fromString: '#aF8D13');
    at: #lightYellow  put: (NamedColor fromString: '#f8DE7E');
    at: #moderateYellow  put: (NamedColor fromString: '#c9AE5D');
    at: #darkYellow  put: (NamedColor fromString: '#aB9144');
    at: #paleYellow  put: (NamedColor fromString: '#f3E5AB');
    at: #grayishYellow  put: (NamedColor fromString: '#c2B280');
    at: #darkGrayishYellow put: (NamedColor fromString: '#a18F60');
    at: #yellowishWhite  put: (NamedColor fromString: '#f0EAD6');
    at: #yellowishGray  put: (NamedColor fromString: '#bFB8A5');
    at: #lightOliveBrown put: (NamedColor fromString: '#967117');
    at: #moderateOliveBrown put: (NamedColor fromString: '#6C541E');
    at: #darkOliveBrown put: (NamedColor fromString: '#3B3121');
    at: #vividGreenishYellow put: (NamedColor fromString: '#dCD300');
    at: #brilliantGreenishYellow  put: (NamedColor fromString: '#e9E450');
    at: #strongGreenishYellow put: (NamedColor fromString: '#bEB72E');
    at: #deepGreenishYellow put: (NamedColor fromString: '#9B9400');
    at: #lightGreenishYellow put: (NamedColor fromString: '#eAE679');
    at: #moderateGreenishYellow  put: (NamedColor fromString: '#b9B459');
    at: #darkGreenishYellow put: (NamedColor fromString: '#98943E');
    at: #paleGreenishYellow put: (NamedColor fromString: '#eBE8A4');
    at: #grayishGreenishYellow put: (NamedColor fromString: '#b9B57D');
    at: #lightOlive  put: (NamedColor fromString: '#867E36');
    at: #moderateOlive  put: (NamedColor fromString: '#665D1E');
    at: #darkOlive  put: (NamedColor fromString: '#403D21');
    at: #lightGrayishOlive put: (NamedColor fromString: '#8C8767');
    at: #grayishOlive  put: (NamedColor fromString: '#5B5842');
    at: #darkGrayishOlive put: (NamedColor fromString: '#363527');
    at: #lightOliveGray put: (NamedColor fromString: '#8A8776');
    at: #oliveGray  put: (NamedColor fromString: '#57554C');
    at: #oliveBlack  put: (NamedColor fromString: '#25241D');
		yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:12'!
nbsisccNamedColors2
	"Answer a dictionary of NBS-ISCC compliant color names to Color objects.
	First half!!"

	^Dictionary new
    at: #vividYellowGreen put: (NamedColor fromString: '#8DB600');
    at: #brilliantYellowGreen put: (NamedColor fromString: '#bDDA57');
    at: #strongYellowGreen put: (NamedColor fromString: '#7E9F2E');
    at: #deepYellowGreen put: (NamedColor fromString: '#467129');
    at: #lightYellowGreen put: (NamedColor fromString: '#c9DC89');
    at: #moderateYellowGreen put: (NamedColor fromString: '#8A9A5B');
    at: #paleYellowGreen put: (NamedColor fromString: '#dADFB7');
    at: #grayishYellowGreen put: (NamedColor fromString: '#8F9779');
    at: #strongOliveGreen put: (NamedColor fromString: '#404F00');
    at: #deepOliveGreen put: (NamedColor fromString: '#232F00');
    at: #moderateOliveGreen put: (NamedColor fromString: '#4A5D23');
    at: #darkOliveGreen put: (NamedColor fromString: '#2B3D26');
    at: #grayishOliveGreen put: (NamedColor fromString: '#515744');
    at: #darkGrayishOliveGreen  put: (NamedColor fromString: '#31362B');
    at: #vividYellowishGreen put: (NamedColor fromString: '#27A64C');
    at: #brilliantYellowishGreen  put: (NamedColor fromString: '#83D37D');
    at: #strongYellowishGreen put: (NamedColor fromString: '#44944A');
    at: #deepYellowishGreen put: (NamedColor fromString: '#00622D');
    at: #veryDeepYellowishGreen  put: (NamedColor fromString: '#003118');
    at: #veryLightYellowishGreen  put: (NamedColor fromString: '#b6E5AF');
    at: #lightYellowishGreen put: (NamedColor fromString: '#93C592');
    at: #moderateYellowishGreen  put: (NamedColor fromString: '#679267');
    at: #darkYellowishGreen put: (NamedColor fromString: '#355E3B');
    at: #veryDarkYellowishGreen  put: (NamedColor fromString: '#173620');
    at: #vividGreen  put: (NamedColor fromString: '#008856');
    at: #brilliantGreen  put: (NamedColor fromString: '#3EB489');
    at: #strongGreen  put: (NamedColor fromString: '#007959');
    at: #deepGreen  put: (NamedColor fromString: '#00543D');
    at: #veryLightGreen put: (NamedColor fromString: '#8ED1B2');
    at: #lightGreen  put: (NamedColor fromString: '#6AAB8E');
    at: #moderateGreen  put: (NamedColor fromString: '#3B7861');
    at: #darkGreen  put: (NamedColor fromString: '#1B4D3E');
    at: #veryDarkGreen  put: (NamedColor fromString: '#1C352D');
    at: #veryPaleGreen  put: (NamedColor fromString: '#c7E6D7');
    at: #paleGreen  put: (NamedColor fromString: '#8DA399');
    at: #grayishGreen  put: (NamedColor fromString: '#5E716A');
    at: #darkGrayishGreen put: (NamedColor fromString: '#3A4B47');
    at: #blackishGreen  put: (NamedColor fromString: '#1A2421');
    at: #greenishWhite  put: (NamedColor fromString: '#dFEDE8');
    at: #lightGreenishGray put: (NamedColor fromString: '#b2BEB5');
    at: #greenishGray  put: (NamedColor fromString: '#7D8984');
    at: #darkGreenishGray put: (NamedColor fromString: '#4E5755');
    at: #greenishBlack  put: (NamedColor fromString: '#1E2321');
    at: #vividBluishGreen put: (NamedColor fromString: '#008882');
    at: #brilliantBluishGreen put: (NamedColor fromString: '#00A693');
    at: #strongBluishGreen put: (NamedColor fromString: '#007A74');
    at: #deepBluishGreen put: (NamedColor fromString: '#00443F');
    at: #veryLightBluishGreen put: (NamedColor fromString: '#96DED1');
    at: #lightBluishGreen put: (NamedColor fromString: '#66ADA4');
    at: #moderateBluishGreen put: (NamedColor fromString: '#317873');
    at: #darkBluishGreen put: (NamedColor fromString: '#004B49');
    at: #veryDarkBluishGreen put: (NamedColor fromString: '#002A29');
    at: #vividGreenishBlue put: (NamedColor fromString: '#0085A1');
    at: #brilliantGreenishBlue put: (NamedColor fromString: '#239EBA');
    at: #strongGreenishBlue put: (NamedColor fromString: '#007791');
    at: #deepGreenishBlue put: (NamedColor fromString: '#2E8495');
    at: #veryLightGreenishBlue  put: (NamedColor fromString: '#9CD1DC');
    at: #lightGreenishBlue put: (NamedColor fromString: '#66AABC');
    at: #moderateGreenishBlue put: (NamedColor fromString: '#367588');
    at: #darkGreenishBlue put: (NamedColor fromString: '#004958');
    at: #veryDarkGreenishBlue put: (NamedColor fromString: '#002E3B');
    at: #vividBlue  put: (NamedColor fromString: '#00A1C2');
    at: #brilliantBlue  put: (NamedColor fromString: '#4997D0');
    at: #strongBlue  put: (NamedColor fromString: '#0067A5');
    at: #deepBlue  put: (NamedColor fromString: '#00416A');
    at: #veryLightBlue  put: (NamedColor fromString: '#a1CAF1');
    at: #lightBlue  put: (NamedColor fromString: '#70A3CC');
    at: #moderateBlue  put: (NamedColor fromString: '#436B95');
    at: #darkBlue  put: (NamedColor fromString: '#00304E');
    at: #veryPaleBlue  put: (NamedColor fromString: '#bCD4E6');
    at: #paleBlue  put: (NamedColor fromString: '#91A3B0');
    at: #grayishBlue  put: (NamedColor fromString: '#536878');
    at: #darkGrayishBlue put: (NamedColor fromString: '#36454F');
    at: #blackishBlue  put: (NamedColor fromString: '#202830');
    at: #bluishWhite  put: (NamedColor fromString: '#e9E9ED');
    at: #lightBluishGray put: (NamedColor fromString: '#b4BCC0');
    at: #bluishGray  put: (NamedColor fromString: '#81878B');
    at: #darkBluishGray put: (NamedColor fromString: '#51585E');
    at: #bluishBlack  put: (NamedColor fromString: '#202428');
    at: #vividPurplishBlue put: (NamedColor fromString: '#30267A');
    at: #brilliantPurplishBlue put: (NamedColor fromString: '#6C79B8');
    at: #strongPurplishBlue put: (NamedColor fromString: '#545AA7');
    at: #deepPurplishBlue put: (NamedColor fromString: '#272458');
    at: #veryLightPurplishBlue  put: (NamedColor fromString: '#b3BCE2');
    at: #lightPurplishBlue put: (NamedColor fromString: '#8791BF');
    at: #moderatePurplishBlue put: (NamedColor fromString: '#4E5180');
    at: #darkPurplishBlue put: (NamedColor fromString: '#252440');
    at: #veryPalePurplishBlue put: (NamedColor fromString: '#c0C8E1');
    at: #palePurplishBlue put: (NamedColor fromString: '#8C92AC');
    at: #grayishPurplishBlue put: (NamedColor fromString: '#4C516D');
    at: #vividViolet  put: (NamedColor fromString: '#9065CA');
    at: #brilliantViolet put: (NamedColor fromString: '#7E73B8');
    at: #strongViolet  put: (NamedColor fromString: '#604E97');
    at: #deepViolet  put: (NamedColor fromString: '#32174D');
    at: #veryLightViolet put: (NamedColor fromString: '#dCD0FF');
    at: #lightViolet  put: (NamedColor fromString: '#8C82B6');
    at: #moderateViolet  put: (NamedColor fromString: '#604E81');
    at: #darkViolet  put: (NamedColor fromString: '#2F2140');
    at: #veryPaleViolet put: (NamedColor fromString: '#c4C3DD');
    at: #paleViolet  put: (NamedColor fromString: '#9690AB');
    at: #grayishViolet  put: (NamedColor fromString: '#554C69');
    at: #vividPurple  put: (NamedColor fromString: '#9A4EAE');
    at: #brilliantPurple put: (NamedColor fromString: '#d399E6');
    at: #strongPurple  put: (NamedColor fromString: '#875692');
 
		yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:12'!
nbsisccNamedColors3
	"Answer a dictionary of NBS-ISCC compliant color names to Color objects.
	First half!!"

	^Dictionary new
   at: #deepPurple  put: (NamedColor fromString: '#602F6B');
    at: #veryDeepPurple put: (NamedColor fromString: '#401A4C');
    at: #veryLightPurple put: (NamedColor fromString: '#d5BADB');
    at: #lightPurple  put: (NamedColor fromString: '#b695C0');
    at: #moderatePurple  put: (NamedColor fromString: '#86608E');
    at: #darkPurple  put: (NamedColor fromString: '#563C5C');
    at: #veryDarkPurple put: (NamedColor fromString: '#301934');
    at: #veryPalePurple put: (NamedColor fromString: '#d6CADD');
    at: #palePurple  put: (NamedColor fromString: '#aA98A9');
    at: #grayishPurple  put: (NamedColor fromString: '#796878');
    at: #darkGrayishPurple put: (NamedColor fromString: '#50404D');
    at: #blackishPurple  put: (NamedColor fromString: '#291E29');
    at: #purplishWhite  put: (NamedColor fromString: '#e8E3E5');
    at: #lightPurplishGray put: (NamedColor fromString: '#bFB9BD');
    at: #purplishGray  put: (NamedColor fromString: '#8B8589');
    at: #darkPurplishGray put: (NamedColor fromString: '#5D555B');
    at: #purplishBlack  put: (NamedColor fromString: '#242124');
    at: #vividReddishPurple put: (NamedColor fromString: '#870074');
    at: #strongReddishPurple put: (NamedColor fromString: '#9E4F88');
    at: #deepReddishPurple put: (NamedColor fromString: '#702963');
    at: #veryDeepReddishPurple   put: (NamedColor fromString: '#54194E');
    at: #lightReddishPurple put: (NamedColor fromString: '#b784A7');
    at: #moderateReddishPurple  put: (NamedColor fromString: '#915C83');
    at: #darkReddishPurple put: (NamedColor fromString: '#5D3954');
    at: #veryDarkReddishPurple  put: (NamedColor fromString: '#341731');
    at: #paleReddishPurple put: (NamedColor fromString: '#aA8A9E');
    at: #grayishReddishPurple put: (NamedColor fromString: '#836479');
    at: #brilliantPurplishPink put: (NamedColor fromString: '#fFC8D6');
    at: #strongPurplishPink put: (NamedColor fromString: '#e68FAC');
    at: #deepPurplishPink put: (NamedColor fromString: '#dE6FA1');
    at: #lightPurplishPink put: (NamedColor fromString: '#eFBBCC');
    at: #moderatePurplishPink put: (NamedColor fromString: '#d597AE');
    at: #darkPurplishPink put: (NamedColor fromString: '#c17E91');
    at: #palePurplishPink put: (NamedColor fromString: '#e8CCD7');
    at: #grayishPurplishPink put: (NamedColor fromString: '#c3A6B1');
    at: #vividPurplishRed put: (NamedColor fromString: '#cE4676');
    at: #strongPurplishRed put: (NamedColor fromString: '#b3446C');
    at: #deepPurplishRed put: (NamedColor fromString: '#78184A');
    at: #veryDeepPurplishRed put: (NamedColor fromString: '#54133B');
    at: #moderatePurplishRed put: (NamedColor fromString: '#a8516E');
    at: #darkPurplishRed put: (NamedColor fromString: '#673147');
    at: #veryDarkPurplishRed put: (NamedColor fromString: '#38152C');
    at: #lightGrayishPurplishRed  put: (NamedColor fromString: '#aF868E');
    at: #grayishPurplishRed put: (NamedColor fromString: '#915F6D');
    at: #white   put: (NamedColor fromString: '#f2F3F4');
    at: #lightGray  put: (NamedColor fromString: '#b9B8B5');
    at: #mediumGray  put: (NamedColor fromString: '#848482');
    at: #darkGray  put: (NamedColor fromString: '#555555');
    at: #black  put: (NamedColor fromString: '#222222');
		yourself! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 14:12'!
traditionalColorNames
	"answer a dictiopnary of name->color"

	| aDict |
	aDict := Dictionary new.
	(self colorNames) do: [ :cn | aDict at: cn put: (self perform: cn)].
	^aDict! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:23'!
useCCS2

	ColorNameDict := self css2NamedColors "Inherited from Color"! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:22'!
useCCS3

	ColorNameDict := self css3NamedColors! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:21'!
useNBSISC

	ColorNameDict := self nbsisccNamedColors! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:23'!
useTraditional

	"Pretty useless, as Color already has this"
	ColorNameDict := self traditionalColorNames! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:21'!
useXKCD

	ColorNameDict := self xkcdNamedColors! !

!NamedColor class methodsFor: 'dictionary management' stamp: 'KenD 1/24/2013 14:21'!
useXKCDFirst48

	ColorNameDict := self xkcdFirst48! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 13:47'!
xkcdFirst48
"First 48 xkcd colors which most people agree upon"
	|smallDict|
smallDict := Dictionary new
  at: #lightPink put: (NamedColor fromString: '#ffd1df') ;
  at: #mustard put: (NamedColor fromString: '#ceb301') ;
  at: #indigo put: (NamedColor fromString: '#380282') ;
  at: #lime put: (NamedColor fromString: '#aaff32') ;
  at: #seaGreen put: (NamedColor fromString: '#53fca1') ;
  at: #periwinkle put: (NamedColor fromString: '#8e82fe') ;
  at: #darkPink put: (NamedColor fromString: '#cb416b') ;
  at: #oliveGreen put: (NamedColor fromString: '#677a04') ;
  at: #peach put: (NamedColor fromString: '#ffb07c') ;
  at: #paleGreen put: (NamedColor fromString: '#c7fdb5') ;
  at: #lightBrown put: (NamedColor fromString: '#ad8150') ;
  at: #hotPink put: (NamedColor fromString: '#ff028d') ;
  at: #black put: (NamedColor fromString: '#000000') ;
  at: #lilac put: (NamedColor fromString: '#cea2fd') ;
  at: #navyBlue put: (NamedColor fromString: '#001146') ;
  at: #royalBlue put: (NamedColor fromString: '#0504aa') ;
  at: #beige put: (NamedColor fromString: '#e6daa6') ;
  at: #salmon put: (NamedColor fromString: '#ff796c') ;
  at: #olive put: (NamedColor fromString: '#6e750e') ;
  at: #maroon put: (NamedColor fromString: '#650021') ;
  at: #brightGreen put: (NamedColor fromString: '#01ff07') ;
  at: #darkPurple put: (NamedColor fromString: '#35063e') ;
  at: #mauve put: (NamedColor fromString: '#ae7181') ;
  at: #forestGreen put: (NamedColor fromString: '#06470c') ;
  at: #aqua put: (NamedColor fromString: '#13eac9') ;
  at: #cyan put: (NamedColor fromString: '#00ffff') ;
  at: #tan put: (NamedColor fromString: '#d1b26f') ;
  at: #darkBlue put: (NamedColor fromString: '#00035b') ;
  at: #lavender put: (NamedColor fromString: '#c79fef') ;
  at: #turquoise put: (NamedColor fromString: '#06c2ac') ;
  at: #darkGreen put: (NamedColor fromString: '#033500') ;
  at: #violet put: (NamedColor fromString: '#9a0eea') ;
  at: #lightPurple put: (NamedColor fromString: '#bf77f6') ;
  at: #limeGreen put: (NamedColor fromString: '#89fe05') ;
  at: #grey put: (NamedColor fromString: '#929591') ;
  at: #skyBlue put: (NamedColor fromString: '#75bbfd') ;
  at: #yellow put: (NamedColor fromString: '#ffff14') ;
  at: #magenta put: (NamedColor fromString: '#c20078') ;
  at: #lightGreen put: (NamedColor fromString: '#96f97b') ;
  at: #orange put: (NamedColor fromString: '#f97306') ;
  at: #teal put: (NamedColor fromString: '#029386') ;
  at: #lightBlue put: (NamedColor fromString: '#95d0fc') ;
  at: #red put: (NamedColor fromString: '#e50000') ;
  at: #brown put: (NamedColor fromString: '#653700') ;
  at: #pink put: (NamedColor fromString: '#ff81c0') ;
  at: #blue put: (NamedColor fromString: '#0343df') ;
  at: #green put: (NamedColor fromString: '#15b01a') ;
  at: #purple put: (NamedColor fromString: '#7e1e9c') ;
yourself.

	^smallDict

! !

!NamedColor class methodsFor: 'accessing' stamp: 'KenD 1/24/2013 15:30'!
xkcdNamedColors
	"Answer a dictionary of XKCD color name survey to Color objects.
	 http://blog.xkcd.com/2010/05/03/color-survey-results/"
	
	" self xkcdNamedColors  explore."
	
	| xkcdDict |

	xkcdDict := self xkcdNamedColors1 addAll: self xkcdNamedColors2; 
		addAll: self xkcdNamedColors3;  addAll: self xkcdNamedColors4;  
		addAll: self xkcdNamedColors5;  addAll: self xkcdNamedColors6; 
		addAll: self xkcdNamedColors7;  addAll: self xkcdNamedColors8; 
		addAll: self xkcdNamedColors9; yourself.
		
	^xkcdDict
! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:58'!
xkcdNamedColors1
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
	  at: #cloudyBlue put: (NamedColor fromString: '#acc2d9') ;
  at: #darkPastelGreen put: (NamedColor fromString: '#56ae57') ;
  at: #dust put: (NamedColor fromString: '#b2996e') ;
  at: #electricLime put: (NamedColor fromString: '#a8ff04') ;
  at: #freshGreen put: (NamedColor fromString: '#69d84f') ;
  at: #lightEggplant put: (NamedColor fromString: '#894585') ;
  at: #nastyGreen put: (NamedColor fromString: '#70b23f') ;
  at: #reallyLightBlue put: (NamedColor fromString: '#d4ffff') ;
  at: #tea put: (NamedColor fromString: '#65ab7c') ;
  at: #warmPurple put: (NamedColor fromString: '#952e8f') ;
  at: #yellowishTan put: (NamedColor fromString: '#fcfc81') ;
  at: #cement put: (NamedColor fromString: '#a5a391') ;
  at: #darkGrassGreen put: (NamedColor fromString: '#388004') ;
  at: #dustyTeal put: (NamedColor fromString: '#4c9085') ;
  at: #greyTeal put: (NamedColor fromString: '#5e9b8a') ;
  at: #macaroniAndCheese put: (NamedColor fromString: '#efb435') ;
  at: #pinkishTan put: (NamedColor fromString: '#d99b82') ;
  at: #spruce put: (NamedColor fromString: '#0a5f38') ;
  at: #strongBlue put: (NamedColor fromString: '#0c06f7') ;
  at: #toxicGreen put: (NamedColor fromString: '#61de2a') ;
  at: #windowsBlue put: (NamedColor fromString: '#3778bf') ;
  at: #blueBlue put: (NamedColor fromString: '#2242c7') ;
  at: #blueWithAHintOfPurple put: (NamedColor fromString: '#533cc6') ;
  at: #booger put: (NamedColor fromString: '#9bb53c') ;
  at: #brightSeaGreen put: (NamedColor fromString: '#05ffa6') ;
  at: #darkGreenBlue put: (NamedColor fromString: '#1f6357') ;
  at: #deepTurquoise put: (NamedColor fromString: '#017374') ;
  at: #greenTeal put: (NamedColor fromString: '#0cb577') ;
  at: #strongPink put: (NamedColor fromString: '#ff0789') ;
  at: #bland put: (NamedColor fromString: '#afa88b') ;
  at: #deepAqua put: (NamedColor fromString: '#08787f') ;
  at: #lavenderPink put: (NamedColor fromString: '#dd85d7') ;
  at: #lightMossGreen put: (NamedColor fromString: '#a6c875') ;
  at: #lightSeafoamGreen put: (NamedColor fromString: '#a7ffb5') ;
  at: #oliveYellow put: (NamedColor fromString: '#c2b709') ;
  at: #pigPink put: (NamedColor fromString: '#e78ea5') ;
  at: #deepLilac put: (NamedColor fromString: '#966ebd') ;
  at: #desert put: (NamedColor fromString: '#ccad60') ;
  at: #dustyLavender put: (NamedColor fromString: '#ac86a8') ;
  at: #purpleyGrey put: (NamedColor fromString: '#947e94') ;
  at: #purply put: (NamedColor fromString: '#983fb2') ;
  at: #candyPink put: (NamedColor fromString: '#ff63e9') ;
  at: #lightPastelGreen put: (NamedColor fromString: '#b2fba5') ;
  at: #boringGreen put: (NamedColor fromString: '#63b365') ;
  at: #kiwiGreen put: (NamedColor fromString: '#8ee53f') ;
  at: #lightGreyGreen put: (NamedColor fromString: '#b7e1a1') ;
  at: #orangePink put: (NamedColor fromString: '#ff6f52') ;
  at: #teaGreen put: (NamedColor fromString: '#bdf8a3') ;
  at: #veryLightBrown put: (NamedColor fromString: '#d3b683') ;
  at: #eggShell put: (NamedColor fromString: '#fffcc4') ;
  at: #eggplantPurple put: (NamedColor fromString: '#430541') ;
  at: #powderPink put: (NamedColor fromString: '#ffb2d0') ;
  at: #reddishGrey put: (NamedColor fromString: '#997570') ;
  at: #babyShitBrown put: (NamedColor fromString: '#ad900d') ;
  at: #liliac put: (NamedColor fromString: '#c48efd') ;
  at: #stormyBlue put: (NamedColor fromString: '#507b9c') ;
  at: #uglyBrown put: (NamedColor fromString: '#7d7103') ;
  at: #custard put: (NamedColor fromString: '#fffd78') ;
  at: #darkishPink put: (NamedColor fromString: '#da467d') ;
  at: #deepBrown put: (NamedColor fromString: '#410200') ;
  at: #greenishBeige put: (NamedColor fromString: '#c9d179') ;
  at: #manilla put: (NamedColor fromString: '#fffa86') ;
  at: #offBlue put: (NamedColor fromString: '#5684ae') ;
  at: #battleshipGrey put: (NamedColor fromString: '#6b7c85') ;
  at: #brownyGreen put: (NamedColor fromString: '#6f6c0a') ;
  at: #bruise put: (NamedColor fromString: '#7e4071') ;
  at: #kelleyGreen put: (NamedColor fromString: '#009337') ;
  at: #sicklyYellow put: (NamedColor fromString: '#d0e429') ;
  at: #sunnyYellow put: (NamedColor fromString: '#fff917') ;
  at: #azul put: (NamedColor fromString: '#1d5dec') ;
  at: #darkgreen put: (NamedColor fromString: '#054907') ;
  at: #greenAndYellow put: (NamedColor fromString: '#b5ce08') ;
  at: #lichen put: (NamedColor fromString: '#8fb67b') ;
  at: #lightLightGreen put: (NamedColor fromString: '#c8ffb0') ;
  at: #paleGold put: (NamedColor fromString: '#fdde6c') ;
  at: #sunYellow put: (NamedColor fromString: '#ffdf22') ;
  at: #tanGreen put: (NamedColor fromString: '#a9be70') ;
  at: #burple put: (NamedColor fromString: '#6832e3') ;
  at: #butterscotch put: (NamedColor fromString: '#fdb147') ;
  at: #toupe put: (NamedColor fromString: '#c7ac7d') ;
  at: #darkCream put: (NamedColor fromString: '#fff39a') ;
  at: #indianRed put: (NamedColor fromString: '#850e04') ;
  at: #lightLavendar put: (NamedColor fromString: '#efc0fe') ;
  at: #poisonGreen put: (NamedColor fromString: '#40fd14') ;
  at: #babyPukeGreen put: (NamedColor fromString: '#b6c406') ;
  at: #brightYellowGreen put: (NamedColor fromString: '#9dff00') ;
  at: #charcoalGrey put: (NamedColor fromString: '#3c4142') ;
  at: #squash put: (NamedColor fromString: '#f2ab15') ;
  at: #cinnamon put: (NamedColor fromString: '#ac4f06') ;
  at: #lightPeaGreen put: (NamedColor fromString: '#c4fe82') ;
  at: #radioactiveGreen put: (NamedColor fromString: '#2cfa1f') ;
  at: #rawSienna put: (NamedColor fromString: '#9a6200') ;
  at: #babyPurple put: (NamedColor fromString: '#ca9bf7') ;
  at: #cocoa put: (NamedColor fromString: '#875f42') ;
  at: #lightRoyalBlue put: (NamedColor fromString: '#3a2efe') ;
  at: #orangeish put: (NamedColor fromString: '#fd8d49') ;
  at: #rustBrown put: (NamedColor fromString: '#8b3103') ;
  at: #sandBrown put: (NamedColor fromString: '#cba560') ;
  at: #swamp put: (NamedColor fromString: '#698339') ;
  at: #tealishGreen put: (NamedColor fromString: '#0cdc73') ;
  at: #burntSiena put: (NamedColor fromString: '#b75203') ;
  at: #camo put: (NamedColor fromString: '#7f8f4e') ;
  at: #duskBlue put: (NamedColor fromString: '#26538d') ;
  at: #fern put: (NamedColor fromString: '#63a950') ;
  at: #oldRose put: (NamedColor fromString: '#c87f89') ;
  at: #paleLightGreen put: (NamedColor fromString: '#b1fc99') ;
  at: #peachyPink put: (NamedColor fromString: '#ff9a8a') ;
  at: #rosyPink put: (NamedColor fromString: '#f6688e') ;
  at: #lightBluishGreen put: (NamedColor fromString: '#76fda8') ;
  at: #lightBrightGreen put: (NamedColor fromString: '#53fe5c') ;
  at: #lightNeonGreen put: (NamedColor fromString: '#4efd54') ;
  at: #lightSeafoam put: (NamedColor fromString: '#a0febf') ;
  at: #tiffanyBlue put: (NamedColor fromString: '#7bf2da') ;
  at: #washedOutGreen put: (NamedColor fromString: '#bcf5a6') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:58'!
xkcdNamedColors2
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #brownyOrange put: (NamedColor fromString: '#ca6b02') ;
  at: #niceBlue put: (NamedColor fromString: '#107ab0') ;
  at: #sapphire put: (NamedColor fromString: '#2138ab') ;
  at: #greyishTeal put: (NamedColor fromString: '#719f91') ;
  at: #orangeyYellow put: (NamedColor fromString: '#fdb915') ;
  at: #parchment put: (NamedColor fromString: '#fefcaf') ;
  at: #straw put: (NamedColor fromString: '#fcf679') ;
  at: #veryDarkBrown put: (NamedColor fromString: '#1d0200') ;
  at: #terracota put: (NamedColor fromString: '#cb6843') ;
  at: #uglyBlue put: (NamedColor fromString: '#31668a') ;
  at: #clearBlue put: (NamedColor fromString: '#247afd') ;
  at: #creme put: (NamedColor fromString: '#ffffb6') ;
  at: #foamGreen put: (NamedColor fromString: '#90fda9') ;
  at: #greyAndGreen put: (NamedColor fromString: '#86a17d') ;
  at: #lightGold put: (NamedColor fromString: '#fddc5c') ;
  at: #seafoamBlue put: (NamedColor fromString: '#78d1b6') ;
  at: #topaz put: (NamedColor fromString: '#13bbaf') ;
  at: #violetPink put: (NamedColor fromString: '#fb5ffc') ;
  at: #wintergreen put: (NamedColor fromString: '#20f986') ;
  at: #yellowTan put: (NamedColor fromString: '#ffe36e') ;
  at: #darkFuchsia put: (NamedColor fromString: '#9d0759') ;
  at: #indigoBlue put: (NamedColor fromString: '#3a18b1') ;
  at: #lightYellowishGreen put: (NamedColor fromString: '#c2ff89') ;
  at: #paleMagenta put: (NamedColor fromString: '#d767ad') ;
  at: #richPurple put: (NamedColor fromString: '#720058') ;
  at: #sunflowerYellow put: (NamedColor fromString: '#ffda03') ;
  at: #greenAndBlue put: (NamedColor fromString: '#01c08d') ;
  at: #leather put: (NamedColor fromString: '#ac7434') ;
  at: #racingGreen put: (NamedColor fromString: '#014600') ;
  at: #vividPurple put: (NamedColor fromString: '#9900fa') ;
  at: #darkRoyalBlue put: (NamedColor fromString: '#02066f') ;
  at: #hazel put: (NamedColor fromString: '#8e7618') ;
  at: #mutedPink put: (NamedColor fromString: '#d1768f') ;
  at: #boogerGreen put: (NamedColor fromString: '#96b403') ;
  at: #canary put: (NamedColor fromString: '#fdff63') ;
  at: #coolGrey put: (NamedColor fromString: '#95a3a6') ;
  at: #darkTaupe put: (NamedColor fromString: '#7f684e') ;
  at: #darkishPurple put: (NamedColor fromString: '#751973') ;
  at: #trueGreen put: (NamedColor fromString: '#089404') ;
  at: #coralPink put: (NamedColor fromString: '#ff6163') ;
  at: #darkSage put: (NamedColor fromString: '#598556') ;
  at: #darkSlateBlue put: (NamedColor fromString: '#214761') ;
  at: #flatBlue put: (NamedColor fromString: '#3c73a8') ;
  at: #mushroom put: (NamedColor fromString: '#ba9e88') ;
  at: #richBlue put: (NamedColor fromString: '#021bf9') ;
  at: #dirtyPurple put: (NamedColor fromString: '#734a65') ;
  at: #greenblue put: (NamedColor fromString: '#23c48b') ;
  at: #ickyGreen put: (NamedColor fromString: '#8fae22') ;
  at: #lightKhaki put: (NamedColor fromString: '#e6f2a2') ;
  at: #warmBlue put: (NamedColor fromString: '#4b57db') ;
  at: #darkHotPink put: (NamedColor fromString: '#d90166') ;
  at: #deepSeaBlue put: (NamedColor fromString: '#015482') ;
  at: #carmine put: (NamedColor fromString: '#9d0216') ;
  at: #darkYellowGreen put: (NamedColor fromString: '#728f02') ;
  at: #palePeach put: (NamedColor fromString: '#ffe5ad') ;
  at: #plumPurple put: (NamedColor fromString: '#4e0550') ;
  at: #goldenRod put: (NamedColor fromString: '#f9bc08') ;
  at: #neonRed put: (NamedColor fromString: '#ff073a') ;
  at: #oldPink put: (NamedColor fromString: '#c77986') ;
  at: #veryPaleBlue put: (NamedColor fromString: '#d6fffe') ;
  at: #bloodOrange put: (NamedColor fromString: '#fe4b03') ;
  at: #grapefruit put: (NamedColor fromString: '#fd5956') ;
  at: #sandYellow put: (NamedColor fromString: '#fce166') ;
  at: #clayBrown put: (NamedColor fromString: '#b2713d') ;
  at: #darkBlueGrey put: (NamedColor fromString: '#1f3b4d') ;
  at: #flatGreen put: (NamedColor fromString: '#699d4c') ;
  at: #lightGreenBlue put: (NamedColor fromString: '#56fca2') ;
  at: #warmPink put: (NamedColor fromString: '#fb5581') ;
  at: #dodgerBlue put: (NamedColor fromString: '#3e82fc') ;
  at: #grossGreen put: (NamedColor fromString: '#a0bf16') ;
  at: #ice put: (NamedColor fromString: '#d6fffa') ;
  at: #metallicBlue put: (NamedColor fromString: '#4f738e') ;
  at: #paleSalmon put: (NamedColor fromString: '#ffb19a') ;
  at: #sapGreen put: (NamedColor fromString: '#5c8b15') ;
  at: #algae put: (NamedColor fromString: '#54ac68') ;
  at: #blueyGrey put: (NamedColor fromString: '#89a0b0') ;
  at: #greenyGrey put: (NamedColor fromString: '#7ea07a') ;
  at: #highlighterGreen put: (NamedColor fromString: '#1bfc06') ;
  at: #lightLightBlue put: (NamedColor fromString: '#cafffb') ;
  at: #lightMint put: (NamedColor fromString: '#b6ffbb') ;
  at: #rawUmber put: (NamedColor fromString: '#a75e09') ;
  at: #vividBlue put: (NamedColor fromString: '#152eff') ;
  at: #deepLavender put: (NamedColor fromString: '#8d5eb7') ;
  at: #dullTeal put: (NamedColor fromString: '#5f9e8f') ;
  at: #lightGreenishBlue put: (NamedColor fromString: '#63f7b4') ;
  at: #mudGreen put: (NamedColor fromString: '#606602') ;
  at: #pinky put: (NamedColor fromString: '#fc86aa') ;
  at: #redWine put: (NamedColor fromString: '#8c0034') ;
  at: #shitGreen put: (NamedColor fromString: '#758000') ;
  at: #tanBrown put: (NamedColor fromString: '#ab7e4c') ;
  at: #darkblue put: (NamedColor fromString: '#030764') ;
  at: #rosa put: (NamedColor fromString: '#fe86a4') ;
  at: #lipstick put: (NamedColor fromString: '#d5174e') ;
  at: #paleMauve put: (NamedColor fromString: '#fed0fc') ;
  at: #claret put: (NamedColor fromString: '#680018') ;
  at: #dandelion put: (NamedColor fromString: '#fedf08') ;
  at: #orangered put: (NamedColor fromString: '#fe420f') ;
  at: #poopGreen put: (NamedColor fromString: '#6f7c00') ;
  at: #ruby put: (NamedColor fromString: '#ca0147') ;
  at: #dark put: (NamedColor fromString: '#1b2431') ;
  at: #greenishTurquoise put: (NamedColor fromString: '#00fbb0') ;
  at: #pastelRed put: (NamedColor fromString: '#db5856') ;
  at: #pissYellow put: (NamedColor fromString: '#ddd618') ;
  at: #brightCyan put: (NamedColor fromString: '#41fdfe') ;
  at: #darkCoral put: (NamedColor fromString: '#cf524e') ;
  at: #algaeGreen put: (NamedColor fromString: '#21c36f') ;
  at: #darkishRed put: (NamedColor fromString: '#a90308') ;
  at: #reddyBrown put: (NamedColor fromString: '#6e1005') ;
  at: #blushPink put: (NamedColor fromString: '#fe828c') ;
  at: #camouflageGreen put: (NamedColor fromString: '#4b6113') ;
  at: #lawnGreen put: (NamedColor fromString: '#4da409') ;
  at: #putty put: (NamedColor fromString: '#beae8a') ;
  at: #vibrantBlue put: (NamedColor fromString: '#0339f8') ;
  at: #darkSand put: (NamedColor fromString: '#a88f59') ;
  at: #purpleAndBlue put: (NamedColor fromString: '#5d21d0') ;
  at: #saffron put: (NamedColor fromString: '#feb209') ;
  at: #twilight put: (NamedColor fromString: '#4e518b') ;
  at: #warmBrown put: (NamedColor fromString: '#964e02') ;
  at: #bluegrey put: (NamedColor fromString: '#85a3b2') ;
  at: #bubbleGumPink put: (NamedColor fromString: '#ff69af') ;
  at: #duckEggBlue put: (NamedColor fromString: '#c3fbf4') ;
  at: #greenishCyan put: (NamedColor fromString: '#2afeb7') ;
  at: #petrol put: (NamedColor fromString: '#005f6a') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors3
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #royal put: (NamedColor fromString: '#0c1793') ;
  at: #butter put: (NamedColor fromString: '#ffff81') ;
  at: #dustyOrange put: (NamedColor fromString: '#f0833a') ;
  at: #offYellow put: (NamedColor fromString: '#f1f33f') ;
  at: #paleOliveGreen put: (NamedColor fromString: '#b1d27b') ;
  at: #orangish put: (NamedColor fromString: '#fc824a') ;
  at: #leaf put: (NamedColor fromString: '#71aa34') ;
  at: #lightBlueGrey put: (NamedColor fromString: '#b7c9e2') ;
  at: #driedBlood put: (NamedColor fromString: '#4b0101') ;
  at: #lightishPurple put: (NamedColor fromString: '#a552e6') ;
  at: #rustyRed put: (NamedColor fromString: '#af2f0d') ;
  at: #lavenderBlue put: (NamedColor fromString: '#8b88f8') ;
  at: #lightGrassGreen put: (NamedColor fromString: '#9af764') ;
  at: #lightMintGreen put: (NamedColor fromString: '#a6fbb2') ;
  at: #sunflower put: (NamedColor fromString: '#ffc512') ;
  at: #velvet put: (NamedColor fromString: '#750851') ;
  at: #brickOrange put: (NamedColor fromString: '#c14a09') ;
  at: #lightishRed put: (NamedColor fromString: '#fe2f4a') ;
  at: #pureBlue put: (NamedColor fromString: '#0203e2') ;
  at: #twilightBlue put: (NamedColor fromString: '#0a437a') ;
  at: #violetRed put: (NamedColor fromString: '#a50055') ;
  at: #yellowyBrown put: (NamedColor fromString: '#ae8b0c') ;
  at: #carnation put: (NamedColor fromString: '#fd798f') ;
  at: #muddyYellow put: (NamedColor fromString: '#bfac05') ;
  at: #darkSeafoamGreen put: (NamedColor fromString: '#3eaf76') ;
  at: #deepRose put: (NamedColor fromString: '#c74767') ;
  at: #dustyRed put: (NamedColor fromString: '#b9484e') ;
  at: #greyAndBlue put: (NamedColor fromString: '#647d8e') ;
  at: #lemonLime put: (NamedColor fromString: '#bffe28') ;
  at: #purpleAndPink put: (NamedColor fromString: '#d725de') ;
  at: #brownYellow put: (NamedColor fromString: '#b29705') ;
  at: #purpleBrown put: (NamedColor fromString: '#673a3f') ;
  at: #wisteria put: (NamedColor fromString: '#a87dc2') ;
  at: #bananaYellow put: (NamedColor fromString: '#fafe4b') ;
  at: #lipstickRed put: (NamedColor fromString: '#c0022f') ;
  at: #waterBlue put: (NamedColor fromString: '#0e87cc') ;
  at: #brownGrey put: (NamedColor fromString: '#8d8468') ;
  at: #vibrantPurple put: (NamedColor fromString: '#ad03de') ;
  at: #babyGreen put: (NamedColor fromString: '#8cff9e') ;
  at: #barfGreen put: (NamedColor fromString: '#94ac02') ;
  at: #eggshellBlue put: (NamedColor fromString: '#c4fff7') ;
  at: #sandyYellow put: (NamedColor fromString: '#fdee73') ;
  at: #coolGreen put: (NamedColor fromString: '#33b864') ;
  at: #pale put: (NamedColor fromString: '#fff9d0') ;
  at: #blueAndGrey put: (NamedColor fromString: '#758da3') ;
  at: #hotMagenta put: (NamedColor fromString: '#f504c9') ;
  at: #greyblue put: (NamedColor fromString: '#77a1b5') ;
  at: #purpley put: (NamedColor fromString: '#8756e4') ;
  at: #babyShitGreen put: (NamedColor fromString: '#889717') ;
  at: #brownishPink put: (NamedColor fromString: '#c27e79') ;
  at: #darkAquamarine put: (NamedColor fromString: '#017371') ;
  at: #diarrhea put: (NamedColor fromString: '#9f8303') ;
  at: #lightMustard put: (NamedColor fromString: '#f7d560') ;
  at: #paleSkyBlue put: (NamedColor fromString: '#bdf6fe') ;
  at: #turtleGreen put: (NamedColor fromString: '#75b84f') ;
  at: #brightOlive put: (NamedColor fromString: '#9cbb04') ;
  at: #darkGreyBlue put: (NamedColor fromString: '#29465b') ;
  at: #greenyBrown put: (NamedColor fromString: '#696006') ;
  at: #lemonGreen put: (NamedColor fromString: '#adf802') ;
  at: #lightPeriwinkle put: (NamedColor fromString: '#c1c6fc') ;
  at: #seaweedGreen put: (NamedColor fromString: '#35ad6b') ;
  at: #sunshineYellow put: (NamedColor fromString: '#fffd37') ;
  at: #uglyPurple put: (NamedColor fromString: '#a442a0') ;
  at: #mediumPink put: (NamedColor fromString: '#f36196') ;
  at: #pukeBrown put: (NamedColor fromString: '#947706') ;
  at: #veryLightPink put: (NamedColor fromString: '#fff4f2') ;
  at: #viridian put: (NamedColor fromString: '#1e9167') ;
  at: #bile put: (NamedColor fromString: '#b5c306') ;
  at: #fadedYellow put: (NamedColor fromString: '#feff7f') ;
  at: #veryPaleGreen put: (NamedColor fromString: '#cffdbc') ;
  at: #vibrantGreen put: (NamedColor fromString: '#0add08') ;
  at: #brightLime put: (NamedColor fromString: '#87fd05') ;
  at: #spearmint put: (NamedColor fromString: '#1ef876') ;
  at: #lightAquamarine put: (NamedColor fromString: '#7bfdc7') ;
  at: #lightSage put: (NamedColor fromString: '#bcecac') ;
  at: #yellowgreen put: (NamedColor fromString: '#bbf90f') ;
  at: #babyPoo put: (NamedColor fromString: '#ab9004') ;
  at: #darkSeafoam put: (NamedColor fromString: '#1fb57a') ;
  at: #deepTeal put: (NamedColor fromString: '#00555a') ;
  at: #heather put: (NamedColor fromString: '#a484ac') ;
  at: #rustOrange put: (NamedColor fromString: '#c45508') ;
  at: #dirtyBlue put: (NamedColor fromString: '#3f829d') ;
  at: #fernGreen put: (NamedColor fromString: '#548d44') ;
  at: #brightLilac put: (NamedColor fromString: '#c95efb') ;
  at: #weirdGreen put: (NamedColor fromString: '#3ae57f') ;
  at: #peacockBlue put: (NamedColor fromString: '#016795') ;
  at: #avocadoGreen put: (NamedColor fromString: '#87a922') ;
  at: #fadedOrange put: (NamedColor fromString: '#f0944d') ;
  at: #grapePurple put: (NamedColor fromString: '#5d1451') ;
  at: #hotGreen put: (NamedColor fromString: '#25ff29') ;
  at: #limeYellow put: (NamedColor fromString: '#d0fe1d') ;
  at: #mango put: (NamedColor fromString: '#ffa62b') ;
  at: #shamrock put: (NamedColor fromString: '#01b44c') ;
  at: #bubblegum put: (NamedColor fromString: '#ff6cb5') ;
  at: #purplishBrown put: (NamedColor fromString: '#6b4247') ;
  at: #vomitYellow put: (NamedColor fromString: '#c7c10c') ;
  at: #paleCyan put: (NamedColor fromString: '#b7fffa') ;
  at: #keyLime put: (NamedColor fromString: '#aeff6e') ;
  at: #tomatoRed put: (NamedColor fromString: '#ec2d01') ;
  at: #lightgreen put: (NamedColor fromString: '#76ff7b') ;
  at: #merlot put: (NamedColor fromString: '#730039') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors4
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #nightBlue put: (NamedColor fromString: '#040348') ;
  at: #purpleishPink put: (NamedColor fromString: '#df4ec8') ;
  at: #apple put: (NamedColor fromString: '#6ecb3c') ;
  at: #babyPoopGreen put: (NamedColor fromString: '#8f9805') ;
  at: #greenApple put: (NamedColor fromString: '#5edc1f') ;
  at: #heliotrope put: (NamedColor fromString: '#d94ff5') ;
  at: #yellowAndGreen put: (NamedColor fromString: '#c8fd3d') ;
  at: #almostBlack put: (NamedColor fromString: '#070d0d') ;
  at: #coolBlue put: (NamedColor fromString: '#4984b8') ;
  at: #leafyGreen put: (NamedColor fromString: '#51b73b') ;
  at: #mustardBrown put: (NamedColor fromString: '#ac7e04') ;
  at: #dusk put: (NamedColor fromString: '#4e5481') ;
  at: #dullBrown put: (NamedColor fromString: '#876e4b') ;
  at: #frogGreen put: (NamedColor fromString: '#58bc08') ;
  at: #vividGreen put: (NamedColor fromString: '#2fef10') ;
  at: #brightLightGreen put: (NamedColor fromString: '#2dfe54') ;
  at: #fluroGreen put: (NamedColor fromString: '#0aff02') ;
  at: #kiwi put: (NamedColor fromString: '#9cef43') ;
  at: #seaweed put: (NamedColor fromString: '#18d17b') ;
  at: #navyGreen put: (NamedColor fromString: '#35530a') ;
  at: #ultramarineBlue put: (NamedColor fromString: '#1805db') ;
  at: #iris put: (NamedColor fromString: '#6258c4') ;
  at: #pastelOrange put: (NamedColor fromString: '#ff964f') ;
  at: #yellowishOrange put: (NamedColor fromString: '#ffab0f') ;
  at: #perrywinkle put: (NamedColor fromString: '#8f8ce7') ;
  at: #tealish put: (NamedColor fromString: '#24bca8') ;
  at: #darkPlum put: (NamedColor fromString: '#3f012c') ;
  at: #pear put: (NamedColor fromString: '#cbf85f') ;
  at: #pinkishOrange put: (NamedColor fromString: '#ff724c') ;
  at: #midnightPurple put: (NamedColor fromString: '#280137') ;
  at: #lightUrple put: (NamedColor fromString: '#b36ff6') ;
  at: #darkMint put: (NamedColor fromString: '#48c072') ;
  at: #greenishTan put: (NamedColor fromString: '#bccb7a') ;
  at: #lightBurgundy put: (NamedColor fromString: '#a8415b') ;
  at: #turquoiseBlue put: (NamedColor fromString: '#06b1c4') ;
  at: #uglyPink put: (NamedColor fromString: '#cd7584') ;
  at: #sandy put: (NamedColor fromString: '#f1da7a') ;
  at: #electricPink put: (NamedColor fromString: '#ff0490') ;
  at: #mutedPurple put: (NamedColor fromString: '#805b87') ;
  at: #midGreen put: (NamedColor fromString: '#50a747') ;
  at: #greyish put: (NamedColor fromString: '#a8a495') ;
  at: #neonYellow put: (NamedColor fromString: '#cfff04') ;
  at: #banana put: (NamedColor fromString: '#ffff7e') ;
  at: #carnationPink put: (NamedColor fromString: '#ff7fa7') ;
  at: #tomato put: (NamedColor fromString: '#ef4026') ;
  at: #sea put: (NamedColor fromString: '#3c9992') ;
  at: #muddyBrown put: (NamedColor fromString: '#886806') ;
  at: #turquoiseGreen put: (NamedColor fromString: '#04f489') ;
  at: #buff put: (NamedColor fromString: '#fef69e') ;
  at: #fawn put: (NamedColor fromString: '#cfaf7b') ;
  at: #mutedBlue put: (NamedColor fromString: '#3b719f') ;
  at: #paleRose put: (NamedColor fromString: '#fdc1c5') ;
  at: #darkMintGreen put: (NamedColor fromString: '#20c073') ;
  at: #amethyst put: (NamedColor fromString: '#9b5fc0') ;
  at: #blueAndGreen put: (NamedColor fromString: '#0f9b8e') ;
  at: #chestnut put: (NamedColor fromString: '#742802') ;
  at: #sickGreen put: (NamedColor fromString: '#9db92c') ;
  at: #pea put: (NamedColor fromString: '#a4bf20') ;
  at: #rustyOrange put: (NamedColor fromString: '#cd5909') ;
  at: #stone put: (NamedColor fromString: '#ada587') ;
  at: #roseRed put: (NamedColor fromString: '#be013c') ;
  at: #paleAqua put: (NamedColor fromString: '#b8ffeb') ;
  at: #deepOrange put: (NamedColor fromString: '#dc4d01') ;
  at: #earth put: (NamedColor fromString: '#a2653e') ;
  at: #mossyGreen put: (NamedColor fromString: '#638b27') ;
  at: #grassyGreen put: (NamedColor fromString: '#419c03') ;
  at: #paleLimeGreen put: (NamedColor fromString: '#b1ff65') ;
  at: #lightGreyBlue put: (NamedColor fromString: '#9dbcd4') ;
  at: #paleGrey put: (NamedColor fromString: '#fdfdfe') ;
  at: #asparagus put: (NamedColor fromString: '#77ab56') ;
  at: #blueberry put: (NamedColor fromString: '#464196') ;
  at: #purpleRed put: (NamedColor fromString: '#990147') ;
  at: #paleLime put: (NamedColor fromString: '#befd73') ;
  at: #greenishTeal put: (NamedColor fromString: '#32bf84') ;
  at: #caramel put: (NamedColor fromString: '#af6f09') ;
  at: #deepMagenta put: (NamedColor fromString: '#a0025c') ;
  at: #lightPeach put: (NamedColor fromString: '#ffd8b1') ;
  at: #milkChocolate put: (NamedColor fromString: '#7f4e1e') ;
  at: #ocher put: (NamedColor fromString: '#bf9b0c') ;
  at: #offGreen put: (NamedColor fromString: '#6ba353') ;
  at: #purplyPink put: (NamedColor fromString: '#f075e6') ;
  at: #lightblue put: (NamedColor fromString: '#7bc8f6') ;
  at: #duskyBlue put: (NamedColor fromString: '#475f94') ;
  at: #golden put: (NamedColor fromString: '#f5bf03') ;
  at: #lightBeige put: (NamedColor fromString: '#fffeb6') ;
  at: #butterYellow put: (NamedColor fromString: '#fffd74') ;
  at: #duskyPurple put: (NamedColor fromString: '#895b7b') ;
  at: #frenchBlue put: (NamedColor fromString: '#436bad') ;
  at: #uglyYellow put: (NamedColor fromString: '#d0c101') ;
  at: #greenyYellow put: (NamedColor fromString: '#c6f808') ;
  at: #orangishRed put: (NamedColor fromString: '#f43605') ;
  at: #shamrockGreen put: (NamedColor fromString: '#02c14d') ;
  at: #orangishBrown put: (NamedColor fromString: '#b25f03') ;
  at: #treeGreen put: (NamedColor fromString: '#2a7e19') ;
  at: #deepViolet put: (NamedColor fromString: '#490648') ;
  at: #gunmetal put: (NamedColor fromString: '#536267') ;
  at: #blueAndPurple put: (NamedColor fromString: '#5a06ef') ;
  at: #cherry put: (NamedColor fromString: '#cf0234') ;
  at: #sandyBrown put: (NamedColor fromString: '#c4a661') ;
  at: #warmGrey put: (NamedColor fromString: '#978a84') ;
  at: #darkIndigo put: (NamedColor fromString: '#1f0954') ;
  at: #midnight put: (NamedColor fromString: '#03012d') ;
  at: #blueyGreen put: (NamedColor fromString: '#2bb179') ;
  at: #greyPink put: (NamedColor fromString: '#c3909b') ;
  at: #softPurple put: (NamedColor fromString: '#a66fb5') ;
  at: #blood put: (NamedColor fromString: '#770001') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors5
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #brownRed put: (NamedColor fromString: '#922b05') ;
  at: #mediumGrey put: (NamedColor fromString: '#7d7f7c') ;
  at: #berry put: (NamedColor fromString: '#990f4b') ;
  at: #poo put: (NamedColor fromString: '#8f7303') ;
  at: #purpleyPink put: (NamedColor fromString: '#c83cb9') ;
  at: #lightSalmon put: (NamedColor fromString: '#fea993') ;
  at: #snot put: (NamedColor fromString: '#acbb0d') ;
  at: #easterPurple put: (NamedColor fromString: '#c071fe') ;
  at: #lightYellowGreen put: (NamedColor fromString: '#ccfd7f') ;
  at: #darkNavyBlue put: (NamedColor fromString: '#00022e') ;
  at: #drab put: (NamedColor fromString: '#828344') ;
  at: #lightRose put: (NamedColor fromString: '#ffc5cb') ;
  at: #rouge put: (NamedColor fromString: '#ab1239') ;
  at: #purplishRed put: (NamedColor fromString: '#b0054b') ;
  at: #slimeGreen put: (NamedColor fromString: '#99cc04') ;
  at: #babyPoop put: (NamedColor fromString: '#937c00') ;
  at: #irishGreen put: (NamedColor fromString: '#019529') ;
  at: #pinkAndPurple put: (NamedColor fromString: '#ef1de7') ;
  at: #darkNavy put: (NamedColor fromString: '#000435') ;
  at: #greenyBlue put: (NamedColor fromString: '#42b395') ;
  at: #lightPlum put: (NamedColor fromString: '#9d5783') ;
  at: #pinkishGrey put: (NamedColor fromString: '#c8aca9') ;
  at: #dirtyOrange put: (NamedColor fromString: '#c87606') ;
  at: #rustRed put: (NamedColor fromString: '#aa2704') ;
  at: #paleLilac put: (NamedColor fromString: '#e4cbff') ;
  at: #orangeyRed put: (NamedColor fromString: '#fa4224') ;
  at: #primaryBlue put: (NamedColor fromString: '#0804f9') ;
  at: #kermitGreen put: (NamedColor fromString: '#5cb200') ;
  at: #brownishPurple put: (NamedColor fromString: '#76424e') ;
  at: #murkyGreen put: (NamedColor fromString: '#6c7a0e') ;
  at: #wheat put: (NamedColor fromString: '#fbdd7e') ;
  at: #veryDarkPurple put: (NamedColor fromString: '#2a0134') ;
  at: #bottleGreen put: (NamedColor fromString: '#044a05') ;
  at: #watermelon put: (NamedColor fromString: '#fd4659') ;
  at: #deepSkyBlue put: (NamedColor fromString: '#0d75f8') ;
  at: #fireEngineRed put: (NamedColor fromString: '#fe0002') ;
  at: #yellowOchre put: (NamedColor fromString: '#cb9d06') ;
  at: #pumpkinOrange put: (NamedColor fromString: '#fb7d07') ;
  at: #paleOlive put: (NamedColor fromString: '#b9cc81') ;
  at: #lightLilac put: (NamedColor fromString: '#edc8ff') ;
  at: #lightishGreen put: (NamedColor fromString: '#61e160') ;
  at: #carolinaBlue put: (NamedColor fromString: '#8ab8fe') ;
  at: #mulberry put: (NamedColor fromString: '#920a4e') ;
  at: #shockingPink put: (NamedColor fromString: '#fe02a2') ;
  at: #auburn put: (NamedColor fromString: '#9a3001') ;
  at: #brightLimeGreen put: (NamedColor fromString: '#65fe08') ;
  at: #celadon put: (NamedColor fromString: '#befdb7') ;
  at: #pinkishBrown put: (NamedColor fromString: '#b17261') ;
  at: #pooBrown put: (NamedColor fromString: '#885f01') ;
  at: #brightSkyBlue put: (NamedColor fromString: '#02ccfe') ;
  at: #celery put: (NamedColor fromString: '#c1fd95') ;
  at: #dirtBrown put: (NamedColor fromString: '#836539') ;
  at: #strawberry put: (NamedColor fromString: '#fb2943') ;
  at: #darkLime put: (NamedColor fromString: '#84b701') ;
  at: #copper put: (NamedColor fromString: '#b66325') ;
  at: #mediumBrown put: (NamedColor fromString: '#7f5112') ;
  at: #mutedGreen put: (NamedColor fromString: '#5fa052') ;
  at: #robinsEgg put: (NamedColor fromString: '#6dedfd') ;
  at: #brightAqua put: (NamedColor fromString: '#0bf9ea') ;
  at: #brightLavender put: (NamedColor fromString: '#c760ff') ;
  at: #ivory put: (NamedColor fromString: '#ffffcb') ;
  at: #veryLightPurple put: (NamedColor fromString: '#f6cefc') ;
  at: #lightNavy put: (NamedColor fromString: '#155084') ;
  at: #pinkRed put: (NamedColor fromString: '#f5054f') ;
  at: #oliveBrown put: (NamedColor fromString: '#645403') ;
  at: #poopBrown put: (NamedColor fromString: '#7a5901') ;
  at: #mustardGreen put: (NamedColor fromString: '#a8b504') ;
  at: #oceanGreen put: (NamedColor fromString: '#3d9973') ;
  at: #veryDarkBlue put: (NamedColor fromString: '#000133') ;
  at: #dustyGreen put: (NamedColor fromString: '#76a973') ;
  at: #lightNavyBlue put: (NamedColor fromString: '#2e5a88') ;
  at: #mintyGreen put: (NamedColor fromString: '#0bf77d') ;
  at: #adobe put: (NamedColor fromString: '#bd6c48') ;
  at: #barney put: (NamedColor fromString: '#ac1db8') ;
  at: #jadeGreen put: (NamedColor fromString: '#2baf6a') ;
  at: #brightLightBlue put: (NamedColor fromString: '#26f7fd') ;
  at: #lightLime put: (NamedColor fromString: '#aefd6c') ;
  at: #darkKhaki put: (NamedColor fromString: '#9b8f55') ;
  at: #orangeYellow put: (NamedColor fromString: '#ffad01') ;
  at: #ocre put: (NamedColor fromString: '#c69c04') ;
  at: #maize put: (NamedColor fromString: '#f4d054') ;
  at: #fadedPink put: (NamedColor fromString: '#de9dac') ;
  at: #britishRacingGreen put: (NamedColor fromString: '#05480d') ;
  at: #sandstone put: (NamedColor fromString: '#c9ae74') ;
  at: #mudBrown put: (NamedColor fromString: '#60460f') ;
  at: #lightSeaGreen put: (NamedColor fromString: '#98f6b0') ;
  at: #robinEggBlue put: (NamedColor fromString: '#8af1fe') ;
  at: #aquaMarine put: (NamedColor fromString: '#2ee8bb') ;
  at: #darkSeaGreen put: (NamedColor fromString: '#11875d') ;
  at: #softPink put: (NamedColor fromString: '#fdb0c0') ;
  at: #orangeyBrown put: (NamedColor fromString: '#b16002') ;
  at: #cherryRed put: (NamedColor fromString: '#f7022a') ;
  at: #burntYellow put: (NamedColor fromString: '#d5ab09') ;
  at: #brownishGrey put: (NamedColor fromString: '#86775f') ;
  at: #camel put: (NamedColor fromString: '#c69f59') ;
  at: #purplishGrey put: (NamedColor fromString: '#7a687f') ;
  at: #marine put: (NamedColor fromString: '#042e60') ;
  at: #greyishPink put: (NamedColor fromString: '#c88d94') ;
  at: #paleTurquoise put: (NamedColor fromString: '#a5fbd5') ;
  at: #pastelYellow put: (NamedColor fromString: '#fffe71') ;
  at: #blueyPurple put: (NamedColor fromString: '#6241c7') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors6
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
 at: #canaryYellow put: (NamedColor fromString: '#fffe40') ;
  at: #fadedRed put: (NamedColor fromString: '#d3494e') ;
  at: #sepia put: (NamedColor fromString: '#985e2b') ;
  at: #coffee put: (NamedColor fromString: '#a6814c') ;
  at: #brightMagenta put: (NamedColor fromString: '#ff08e8') ;
  at: #mocha put: (NamedColor fromString: '#9d7651') ;
  at: #ecru put: (NamedColor fromString: '#feffca') ;
  at: #purpleish put: (NamedColor fromString: '#98568d') ;
  at: #cranberry put: (NamedColor fromString: '#9e003a') ;
  at: #darkishGreen put: (NamedColor fromString: '#287c37') ;
  at: #brownOrange put: (NamedColor fromString: '#b96902') ;
  at: #duskyRose put: (NamedColor fromString: '#ba6873') ;
  at: #melon put: (NamedColor fromString: '#ff7855') ;
  at: #sicklyGreen put: (NamedColor fromString: '#94b21c') ;
  at: #silver put: (NamedColor fromString: '#c5c9c7') ;
  at: #purplyBlue put: (NamedColor fromString: '#661aee') ;
  at: #purpleishBlue put: (NamedColor fromString: '#6140ef') ;
  at: #hospitalGreen put: (NamedColor fromString: '#9be5aa') ;
  at: #shitBrown put: (NamedColor fromString: '#7b5804') ;
  at: #midBlue put: (NamedColor fromString: '#276ab3') ;
  at: #amber put: (NamedColor fromString: '#feb308') ;
  at: #easterGreen put: (NamedColor fromString: '#8cfd7e') ;
  at: #softBlue put: (NamedColor fromString: '#6488ea') ;
  at: #ceruleanBlue put: (NamedColor fromString: '#056eee') ;
  at: #goldenBrown put: (NamedColor fromString: '#b27a01') ;
  at: #brightTurquoise put: (NamedColor fromString: '#0ffef9') ;
  at: #redPink put: (NamedColor fromString: '#fa2a55') ;
  at: #redPurple put: (NamedColor fromString: '#820747') ;
  at: #greyishBrown put: (NamedColor fromString: '#7a6a4f') ;
  at: #vermillion put: (NamedColor fromString: '#f4320c') ;
  at: #russet put: (NamedColor fromString: '#a13905') ;
  at: #steelGrey put: (NamedColor fromString: '#6f828a') ;
  at: #lighterPurple put: (NamedColor fromString: '#a55af4') ;
  at: #brightViolet put: (NamedColor fromString: '#ad0afd') ;
  at: #prussianBlue put: (NamedColor fromString: '#004577') ;
  at: #slateGreen put: (NamedColor fromString: '#658d6d') ;
  at: #dirtyPink put: (NamedColor fromString: '#ca7b80') ;
  at: #darkBlueGreen put: (NamedColor fromString: '#005249') ;
  at: #pine put: (NamedColor fromString: '#2b5d34') ;
  at: #yellowyGreen put: (NamedColor fromString: '#bff128') ;
  at: #darkGold put: (NamedColor fromString: '#b59410') ;
  at: #bluish put: (NamedColor fromString: '#2976bb') ;
  at: #darkishBlue put: (NamedColor fromString: '#014182') ;
  at: #dullRed put: (NamedColor fromString: '#bb3f3f') ;
  at: #pinkyRed put: (NamedColor fromString: '#fc2647') ;
  at: #bronze put: (NamedColor fromString: '#a87900') ;
  at: #paleTeal put: (NamedColor fromString: '#82cbb2') ;
  at: #militaryGreen put: (NamedColor fromString: '#667c3e') ;
  at: #barbiePink put: (NamedColor fromString: '#fe46a5') ;
  at: #bubblegumPink put: (NamedColor fromString: '#fe83cc') ;
  at: #peaSoupGreen put: (NamedColor fromString: '#94a617') ;
  at: #darkMustard put: (NamedColor fromString: '#a88905') ;
  at: #shit put: (NamedColor fromString: '#7f5f00') ;
  at: #mediumPurple put: (NamedColor fromString: '#9e43a2') ;
  at: #veryDarkGreen put: (NamedColor fromString: '#062e03') ;
  at: #dirt put: (NamedColor fromString: '#8a6e45') ;
  at: #duskyPink put: (NamedColor fromString: '#cc7a8b') ;
  at: #redViolet put: (NamedColor fromString: '#9e0168') ;
  at: #lemonYellow put: (NamedColor fromString: '#fdff38') ;
  at: #pistachio put: (NamedColor fromString: '#c0fa8b') ;
  at: #dullYellow put: (NamedColor fromString: '#eedc5b') ;
  at: #darkLimeGreen put: (NamedColor fromString: '#7ebd01') ;
  at: #denimBlue put: (NamedColor fromString: '#3b5b92') ;
  at: #tealBlue put: (NamedColor fromString: '#01889f') ;
  at: #lightishBlue put: (NamedColor fromString: '#3d7afd') ;
  at: #purpleyBlue put: (NamedColor fromString: '#5f34e7') ;
  at: #lightIndigo put: (NamedColor fromString: '#6d5acf') ;
  at: #swampGreen put: (NamedColor fromString: '#748500') ;
  at: #brownGreen put: (NamedColor fromString: '#706c11') ;
  at: #darkMaroon put: (NamedColor fromString: '#3c0008') ;
  at: #hotPurple put: (NamedColor fromString: '#cb00f5') ;
  at: #darkForestGreen put: (NamedColor fromString: '#002d04') ;
  at: #fadedBlue put: (NamedColor fromString: '#658cbb') ;
  at: #drabGreen put: (NamedColor fromString: '#749551') ;
  at: #lightLimeGreen put: (NamedColor fromString: '#b9ff66') ;
  at: #snotGreen put: (NamedColor fromString: '#9dc100') ;
  at: #yellowish put: (NamedColor fromString: '#faee66') ;
  at: #lightBlueGreen put: (NamedColor fromString: '#7efbb3') ;
  at: #bordeaux put: (NamedColor fromString: '#7b002c') ;
  at: #lightMauve put: (NamedColor fromString: '#c292a1') ;
  at: #ocean put: (NamedColor fromString: '#017b92') ;
  at: #marigold put: (NamedColor fromString: '#fcc006') ;
  at: #muddyGreen put: (NamedColor fromString: '#657432') ;
  at: #dullOrange put: (NamedColor fromString: '#d8863b') ;
  at: #steel put: (NamedColor fromString: '#738595') ;
  at: #electricPurple put: (NamedColor fromString: '#aa23ff') ;
  at: #fluorescentGreen put: (NamedColor fromString: '#08ff08') ;
  at: #yellowishBrown put: (NamedColor fromString: '#9b7a01') ;
  at: #blush put: (NamedColor fromString: '#f29e8e') ;
  at: #softGreen put: (NamedColor fromString: '#6fc276') ;
  at: #brightOrange put: (NamedColor fromString: '#ff5b00') ;
  at: #lemon put: (NamedColor fromString: '#fdff52') ;
  at: #purpleGrey put: (NamedColor fromString: '#866f85') ;
  at: #acidGreen put: (NamedColor fromString: '#8ffe09') ;
  at: #paleLavender put: (NamedColor fromString: '#eecffe') ;
  at: #violetBlue put: (NamedColor fromString: '#510ac9') ;
  at: #lightForestGreen put: (NamedColor fromString: '#4f9153') ;
  at: #burntRed put: (NamedColor fromString: '#9f2305') ;
  at: #khakiGreen put: (NamedColor fromString: '#728639') ;
  at: #cerise put: (NamedColor fromString: '#de0c62') ;
  at: #fadedPurple put: (NamedColor fromString: '#916e99') ;
  at: #apricot put: (NamedColor fromString: '#ffb16d') ;
  at: #darkOliveGreen put: (NamedColor fromString: '#3c4d03') ;
  at: #greyBrown put: (NamedColor fromString: '#7f7053') ;
  at: #greenGrey put: (NamedColor fromString: '#77926f') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors7
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #trueBlue put: (NamedColor fromString: '#010fcc') ;
  at: #paleViolet put: (NamedColor fromString: '#ceaefa') ;
  at: #periwinkleBlue put: (NamedColor fromString: '#8f99fb') ;
  at: #lightSkyBlue put: (NamedColor fromString: '#c6fcff') ;
  at: #blurple put: (NamedColor fromString: '#5539cc') ;
  at: #greenBrown put: (NamedColor fromString: '#544e03') ;
  at: #bluegreen put: (NamedColor fromString: '#017a79') ;
  at: #brightTeal put: (NamedColor fromString: '#01f9c6') ;
  at: #brownishYellow put: (NamedColor fromString: '#c9b003') ;
  at: #peaSoup put: (NamedColor fromString: '#929901') ;
  at: #forest put: (NamedColor fromString: '#0b5509') ;
  at: #barneyPurple put: (NamedColor fromString: '#a00498') ;
  at: #ultramarine put: (NamedColor fromString: '#2000b1') ;
  at: #purplish put: (NamedColor fromString: '#94568c') ;
  at: #pukeYellow put: (NamedColor fromString: '#c2be0e') ;
  at: #bluishGrey put: (NamedColor fromString: '#748b97') ;
  at: #darkPeriwinkle put: (NamedColor fromString: '#665fd1') ;
  at: #darkLilac put: (NamedColor fromString: '#9c6da5') ;
  at: #reddish put: (NamedColor fromString: '#c44240') ;
  at: #lightMaroon put: (NamedColor fromString: '#a24857') ;
  at: #dustyPurple put: (NamedColor fromString: '#825f87') ;
  at: #terraCotta put: (NamedColor fromString: '#c9643b') ;
  at: #avocado put: (NamedColor fromString: '#90b134') ;
  at: #marineBlue put: (NamedColor fromString: '#01386a') ;
  at: #tealGreen put: (NamedColor fromString: '#25a36f') ;
  at: #slateGrey put: (NamedColor fromString: '#59656d') ;
  at: #lighterGreen put: (NamedColor fromString: '#75fd63') ;
  at: #electricGreen put: (NamedColor fromString: '#21fc0d') ;
  at: #dustyBlue put: (NamedColor fromString: '#5a86ad') ;
  at: #goldenYellow put: (NamedColor fromString: '#fec615') ;
  at: #brightYellow put: (NamedColor fromString: '#fffd01') ;
  at: #lightLavender put: (NamedColor fromString: '#dfc5fe') ;
  at: #umber put: (NamedColor fromString: '#b26400') ;
  at: #poop put: (NamedColor fromString: '#7f5e00') ;
  at: #darkPeach put: (NamedColor fromString: '#de7e5d') ;
  at: #jungleGreen put: (NamedColor fromString: '#048243') ;
  at: #eggshell put: (NamedColor fromString: '#ffffd4') ;
  at: #denim put: (NamedColor fromString: '#3b638c') ;
  at: #yellowBrown put: (NamedColor fromString: '#b79400') ;
  at: #dullPurple put: (NamedColor fromString: '#84597e') ;
  at: #chocolateBrown put: (NamedColor fromString: '#411900') ;
  at: #wineRed put: (NamedColor fromString: '#7b0323') ;
  at: #neonBlue put: (NamedColor fromString: '#04d9ff') ;
  at: #dirtyGreen put: (NamedColor fromString: '#667e2c') ;
  at: #lightTan put: (NamedColor fromString: '#fbeeac') ;
  at: #iceBlue put: (NamedColor fromString: '#d7fffe') ;
  at: #cadetBlue put: (NamedColor fromString: '#4e7496') ;
  at: #darkMauve put: (NamedColor fromString: '#874c62') ;
  at: #veryLightBlue put: (NamedColor fromString: '#d5ffff') ;
  at: #greyPurple put: (NamedColor fromString: '#826d8c') ;
  at: #pastelPink put: (NamedColor fromString: '#ffbacd') ;
  at: #veryLightGreen put: (NamedColor fromString: '#d1ffbd') ;
  at: #darkSkyBlue put: (NamedColor fromString: '#448ee4') ;
  at: #evergreen put: (NamedColor fromString: '#05472a') ;
  at: #dullPink put: (NamedColor fromString: '#d5869d') ;
  at: #aubergine put: (NamedColor fromString: '#3d0734') ;
  at: #mahogany put: (NamedColor fromString: '#4a0100') ;
  at: #reddishOrange put: (NamedColor fromString: '#f8481c') ;
  at: #deepGreen put: (NamedColor fromString: '#02590f') ;
  at: #vomitGreen put: (NamedColor fromString: '#89a203') ;
  at: #purplePink put: (NamedColor fromString: '#e03fd8') ;
  at: #dustyPink put: (NamedColor fromString: '#d58a94') ;
  at: #fadedGreen put: (NamedColor fromString: '#7bb274') ;
  at: #camoGreen put: (NamedColor fromString: '#526525') ;
  at: #pinkyPurple put: (NamedColor fromString: '#c94cbe') ;
  at: #pinkPurple put: (NamedColor fromString: '#db4bda') ;
  at: #brownishRed put: (NamedColor fromString: '#9e3623') ;
  at: #darkRose put: (NamedColor fromString: '#b5485d') ;
  at: #mud put: (NamedColor fromString: '#735c12') ;
  at: #brownish put: (NamedColor fromString: '#9c6d57') ;
  at: #emeraldGreen put: (NamedColor fromString: '#028f1e') ;
  at: #paleBrown put: (NamedColor fromString: '#b1916e') ;
  at: #dullBlue put: (NamedColor fromString: '#49759c') ;
  at: #burntUmber put: (NamedColor fromString: '#a0450e') ;
  at: #mediumGreen put: (NamedColor fromString: '#39ad48') ;
  at: #clay put: (NamedColor fromString: '#b66a50') ;
  at: #lightAqua put: (NamedColor fromString: '#8cffdb') ;
  at: #lightOliveGreen put: (NamedColor fromString: '#a4be5c') ;
  at: #brownishOrange put: (NamedColor fromString: '#cb7723') ;
  at: #darkAqua put: (NamedColor fromString: '#05696b') ;
  at: #purplishPink put: (NamedColor fromString: '#ce5dae') ;
  at: #darkSalmon put: (NamedColor fromString: '#c85a53') ;
  at: #greenishGrey put: (NamedColor fromString: '#96ae8d') ;
  at: #jade put: (NamedColor fromString: '#1fa774') ;
  at: #uglyGreen put: (NamedColor fromString: '#7a9703') ;
  at: #darkBeige put: (NamedColor fromString: '#ac9362') ;
  at: #emerald put: (NamedColor fromString: '#01a049') ;
  at: #paleRed put: (NamedColor fromString: '#d9544d') ;
  at: #lightMagenta put: (NamedColor fromString: '#fa5ff7') ;
  at: #sky put: (NamedColor fromString: '#82cafc') ;
  at: #lightCyan put: (NamedColor fromString: '#acfffc') ;
  at: #yellowOrange put: (NamedColor fromString: '#fcb001') ;
  at: #reddishPurple put: (NamedColor fromString: '#910951') ;
  at: #reddishPink put: (NamedColor fromString: '#fe2c54') ;
  at: #orchid put: (NamedColor fromString: '#c875c4') ;
  at: #dirtyYellow put: (NamedColor fromString: '#cdc50a') ;
  at: #orangeRed put: (NamedColor fromString: '#fd411e') ;
  at: #deepRed put: (NamedColor fromString: '#9a0200') ;
  at: #orangeBrown put: (NamedColor fromString: '#be6400') ;
  at: #cobaltBlue put: (NamedColor fromString: '#030aa7') ;
  at: #neonPink put: (NamedColor fromString: '#fe019a') ;
  at: #rosePink put: (NamedColor fromString: '#f7879a') ;
  at: #greyishPurple put: (NamedColor fromString: '#887191') ;
  at: #raspberry put: (NamedColor fromString: '#b00149') ;
  at: #aquaGreen put: (NamedColor fromString: '#12e193') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 13:59'!
xkcdNamedColors8
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #salmonPink put: (NamedColor fromString: '#fe7b7c') ;
  at: #tangerine put: (NamedColor fromString: '#ff9408') ;
  at: #brownishGreen put: (NamedColor fromString: '#6a6e09') ;
  at: #redBrown put: (NamedColor fromString: '#8b2e16') ;
  at: #greenishBrown put: (NamedColor fromString: '#696112') ;
  at: #pumpkin put: (NamedColor fromString: '#e17701') ;
  at: #pineGreen put: (NamedColor fromString: '#0a481e') ;
  at: #charcoal put: (NamedColor fromString: '#343837') ;
  at: #babyPink put: (NamedColor fromString: '#ffb7ce') ;
  at: #cornflower put: (NamedColor fromString: '#6a79f7') ;
  at: #blueViolet put: (NamedColor fromString: '#5d06e9') ;
  at: #chocolate put: (NamedColor fromString: '#3d1c02') ;
  at: #greyishGreen put: (NamedColor fromString: '#82a67d') ;
  at: #scarlet put: (NamedColor fromString: '#be0119') ;
  at: #greenYellow put: (NamedColor fromString: '#c9ff27') ;
  at: #darkOlive put: (NamedColor fromString: '#373e02') ;
  at: #sienna put: (NamedColor fromString: '#a9561e') ;
  at: #pastelPurple put: (NamedColor fromString: '#caa0ff') ;
  at: #terracotta put: (NamedColor fromString: '#ca6641') ;
  at: #aquaBlue put: (NamedColor fromString: '#02d8e9') ;
  at: #sageGreen put: (NamedColor fromString: '#88b378') ;
  at: #bloodRed put: (NamedColor fromString: '#980002') ;
  at: #deepPink put: (NamedColor fromString: '#cb0162') ;
  at: #grass put: (NamedColor fromString: '#5cac2d') ;
  at: #moss put: (NamedColor fromString: '#769958') ;
  at: #pastelBlue put: (NamedColor fromString: '#a2bffe') ;
  at: #bluishGreen put: (NamedColor fromString: '#10a674') ;
  at: #greenBlue put: (NamedColor fromString: '#06b48b') ;
  at: #darkTan put: (NamedColor fromString: '#af884a') ;
  at: #greenishBlue put: (NamedColor fromString: '#0b8b87') ;
  at: #paleOrange put: (NamedColor fromString: '#ffa756') ;
  at: #vomit put: (NamedColor fromString: '#a2a415') ;
  at: #forrestGreen put: (NamedColor fromString: '#154406') ;
  at: #darkLavender put: (NamedColor fromString: '#856798') ;
  at: #darkViolet put: (NamedColor fromString: '#34013f') ;
  at: #purpleBlue put: (NamedColor fromString: '#632de9') ;
  at: #darkCyan put: (NamedColor fromString: '#0a888a') ;
  at: #oliveDrab put: (NamedColor fromString: '#6f7632') ;
  at: #pinkish put: (NamedColor fromString: '#d46a7e') ;
  at: #cobalt put: (NamedColor fromString: '#1e488f') ;
  at: #neonPurple put: (NamedColor fromString: '#bc13fe') ;
  at: #lightTurquoise put: (NamedColor fromString: '#7ef4cc') ;
  at: #appleGreen put: (NamedColor fromString: '#76cd26') ;
  at: #dullGreen put: (NamedColor fromString: '#74a662') ;
  at: #wine put: (NamedColor fromString: '#80013f') ;
  at: #powderBlue put: (NamedColor fromString: '#b1d1fc') ;
  at: #offWhite put: (NamedColor fromString: '#ffffe4') ;
  at: #electricBlue put: (NamedColor fromString: '#0652ff') ;
  at: #darkTurquoise put: (NamedColor fromString: '#045c5a') ;
  at: #bluePurple put: (NamedColor fromString: '#5729ce') ;
  at: #azure put: (NamedColor fromString: '#069af3') ;
  at: #brightRed put: (NamedColor fromString: '#ff000d') ;
  at: #pinkishRed put: (NamedColor fromString: '#f10c45') ;
  at: #cornflowerBlue put: (NamedColor fromString: '#5170d7') ;
  at: #lightOlive put: (NamedColor fromString: '#acbf69') ;
  at: #grape put: (NamedColor fromString: '#6c3461') ;
  at: #greyishBlue put: (NamedColor fromString: '#5e819d') ;
  at: #purplishBlue put: (NamedColor fromString: '#601ef9') ;
  at: #yellowishGreen put: (NamedColor fromString: '#b0dd16') ;
  at: #greenishYellow put: (NamedColor fromString: '#cdfd02') ;
  at: #mediumBlue put: (NamedColor fromString: '#2c6fbb') ;
  at: #dustyRose put: (NamedColor fromString: '#c0737a') ;
  at: #lightViolet put: (NamedColor fromString: '#d6b4fc') ;
  at: #midnightBlue put: (NamedColor fromString: '#020035') ;
  at: #bluishPurple put: (NamedColor fromString: '#703be7') ;
  at: #redOrange put: (NamedColor fromString: '#fd3c06') ;
  at: #darkMagenta put: (NamedColor fromString: '#960056') ;
  at: #greenish put: (NamedColor fromString: '#40a368') ;
  at: #oceanBlue put: (NamedColor fromString: '#03719c') ;
  at: #coral put: (NamedColor fromString: '#fc5a50') ;
  at: #cream put: (NamedColor fromString: '#ffffc2') ;
  at: #reddishBrown put: (NamedColor fromString: '#7f2b0a') ;
  at: #burntSienna put: (NamedColor fromString: '#b04e0f') ;
  at: #brick put: (NamedColor fromString: '#a03623') ;
  at: #sage put: (NamedColor fromString: '#87ae73') ;
  at: #greyGreen put: (NamedColor fromString: '#789b73') ;
  at: #white put: (NamedColor fromString: '#ffffff') ;
  at: #robinsEggBlue put: (NamedColor fromString: '#98eff9') ;
  at: #mossGreen put: (NamedColor fromString: '#658b38') ;
  at: #steelBlue put: (NamedColor fromString: '#5a7d9a') ;
  at: #eggplant put: (NamedColor fromString: '#380835') ;
  at: #lightYellow put: (NamedColor fromString: '#fffe7a') ;
  at: #leafGreen put: (NamedColor fromString: '#5ca904') ;
  at: #lightGrey put: (NamedColor fromString: '#d8dcd6') ;
  at: #puke put: (NamedColor fromString: '#a5a502') ;
  at: #pinkishPurple put: (NamedColor fromString: '#d648d7') ;
  at: #seaBlue put: (NamedColor fromString: '#047495') ;
  at: #palePurple put: (NamedColor fromString: '#b790d4') ;
  at: #slateBlue put: (NamedColor fromString: '#5b7c99') ;
  at: #blueGrey put: (NamedColor fromString: '#607c8e') ;
  at: #hunterGreen put: (NamedColor fromString: '#0b4008') ;
  at: #fuchsia put: (NamedColor fromString: '#ed0dd9') ;
  at: #crimson put: (NamedColor fromString: '#8c000f') ;
  at: #paleYellow put: (NamedColor fromString: '#ffff84') ;
  at: #ochre put: (NamedColor fromString: '#bf9005') ;
  at: #mustardYellow put: (NamedColor fromString: '#d2bd0a') ;
  at: #lightRed put: (NamedColor fromString: '#ff474c') ;
  at: #cerulean put: (NamedColor fromString: '#0485d1') ;
  at: #palePink put: (NamedColor fromString: '#ffcfdc') ;
  at: #deepBlue put: (NamedColor fromString: '#040273') ;
  at: #rust put: (NamedColor fromString: '#a83c09') ;
  at: #lightTeal put: (NamedColor fromString: '#90e4c1') ;
  at: #slate put: (NamedColor fromString: '#516572') ;
  at: #goldenrod put: (NamedColor fromString: '#fac205') ;
  at: #darkYellow put: (NamedColor fromString: '#d5b60a') ;
  at: #darkGrey put: (NamedColor fromString: '#363737') ;
  at: #armyGreen put: (NamedColor fromString: '#4b5d16') ;
  at: #greyBlue put: (NamedColor fromString: '#6b8ba4') ;
  at: #seafoam put: (NamedColor fromString: '#80f9ad') ;
  at: #puce put: (NamedColor fromString: '#a57e52') ;
  at: #springGreen put: (NamedColor fromString: '#a9f971') ;
yourself! !

!NamedColor class methodsFor: 'named colors' stamp: 'KenD 1/24/2013 14:00'!
xkcdNamedColors9
	"Answer a dictionary of XKCD color names survey name to Color objects."

	^Dictionary new
  at: #darkOrange put: (NamedColor fromString: '#c65102') ;
  at: #sand put: (NamedColor fromString: '#e2ca76') ;
  at: #pastelGreen put: (NamedColor fromString: '#b0ff9d') ;
  at: #mint put: (NamedColor fromString: '#9ffeb0') ;
  at: #lightOrange put: (NamedColor fromString: '#fdaa48') ;
  at: #brightPink put: (NamedColor fromString: '#fe01b1') ;
  at: #chartreuse put: (NamedColor fromString: '#c1f80a') ;
  at: #deepPurple put: (NamedColor fromString: '#36013f') ;
  at: #darkBrown put: (NamedColor fromString: '#341c02') ;
  at: #taupe put: (NamedColor fromString: '#b9a281') ;
  at: #peaGreen put: (NamedColor fromString: '#8eab12') ;
  at: #pukeGreen put: (NamedColor fromString: '#9aae07') ;
  at: #kellyGreen put: (NamedColor fromString: '#02ab2e') ;
  at: #seafoamGreen put: (NamedColor fromString: '#7af9ab') ;
  at: #blueGreen put: (NamedColor fromString: '#137e6d') ;
  at: #khaki put: (NamedColor fromString: '#aaa662') ;
  at: #burgundy put: (NamedColor fromString: '#610023') ;
  at: #darkTeal put: (NamedColor fromString: '#014d4e') ;
  at: #brickRed put: (NamedColor fromString: '#8f1402') ;
  at: #royalPurple put: (NamedColor fromString: '#4b006e') ;
  at: #plum put: (NamedColor fromString: '#580f41') ;
  at: #mintGreen put: (NamedColor fromString: '#8fff9f') ;
  at: #gold put: (NamedColor fromString: '#dbb40c') ;
  at: #babyBlue put: (NamedColor fromString: '#a2cffe') ;
  at: #yellowGreen put: (NamedColor fromString: '#c0fb2d') ;
  at: #brightPurple put: (NamedColor fromString: '#be03fd') ;
  at: #darkRed put: (NamedColor fromString: '#840000') ;
  at: #paleBlue put: (NamedColor fromString: '#d0fefe') ;
  at: #grassGreen put: (NamedColor fromString: '#3f9b0b') ;
  at: #navy put: (NamedColor fromString: '#01153e') ;
  at: #aquamarine put: (NamedColor fromString: '#04d8b2') ;
  at: #burntOrange put: (NamedColor fromString: '#c04e01') ;
  at: #neonGreen put: (NamedColor fromString: '#0cff0c') ;
  at: #brightBlue put: (NamedColor fromString: '#0165fc') ;
  at: #rose put: (NamedColor fromString: '#cf6275') ;
  at: #lightPink put: (NamedColor fromString: '#ffd1df') ;
  at: #mustard put: (NamedColor fromString: '#ceb301') ;
  at: #indigo put: (NamedColor fromString: '#380282') ;
  at: #lime put: (NamedColor fromString: '#aaff32') ;
  at: #seaGreen put: (NamedColor fromString: '#53fca1') ;
  at: #periwinkle put: (NamedColor fromString: '#8e82fe') ;
  at: #darkPink put: (NamedColor fromString: '#cb416b') ;
  at: #oliveGreen put: (NamedColor fromString: '#677a04') ;
  at: #peach put: (NamedColor fromString: '#ffb07c') ;
  at: #paleGreen put: (NamedColor fromString: '#c7fdb5') ;
  at: #lightBrown put: (NamedColor fromString: '#ad8150') ;
  at: #hotPink put: (NamedColor fromString: '#ff028d') ;
  at: #black put: (NamedColor fromString: '#000000') ;
  at: #lilac put: (NamedColor fromString: '#cea2fd') ;
  at: #navyBlue put: (NamedColor fromString: '#001146') ;
  at: #royalBlue put: (NamedColor fromString: '#0504aa') ;
  at: #beige put: (NamedColor fromString: '#e6daa6') ;
  at: #salmon put: (NamedColor fromString: '#ff796c') ;
  at: #olive put: (NamedColor fromString: '#6e750e') ;
  at: #maroon put: (NamedColor fromString: '#650021') ;
  at: #brightGreen put: (NamedColor fromString: '#01ff07') ;
  at: #darkPurple put: (NamedColor fromString: '#35063e') ;
  at: #mauve put: (NamedColor fromString: '#ae7181') ;
  at: #forestGreen put: (NamedColor fromString: '#06470c') ;
  at: #aqua put: (NamedColor fromString: '#13eac9') ;
  at: #cyan put: (NamedColor fromString: '#00ffff') ;
  at: #tan put: (NamedColor fromString: '#d1b26f') ;
  at: #darkBlue put: (NamedColor fromString: '#00035b') ;
  at: #lavender put: (NamedColor fromString: '#c79fef') ;
  at: #turquoise put: (NamedColor fromString: '#06c2ac') ;
  at: #darkGreen put: (NamedColor fromString: '#033500') ;
  at: #violet put: (NamedColor fromString: '#9a0eea') ;
  at: #lightPurple put: (NamedColor fromString: '#bf77f6') ;
  at: #limeGreen put: (NamedColor fromString: '#89fe05') ;
  at: #grey put: (NamedColor fromString: '#929591') ;
  at: #skyBlue put: (NamedColor fromString: '#75bbfd') ;
  at: #yellow put: (NamedColor fromString: '#ffff14') ;
  at: #magenta put: (NamedColor fromString: '#c20078') ;
  at: #lightGreen put: (NamedColor fromString: '#96f97b') ;
  at: #orange put: (NamedColor fromString: '#f97306') ;
  at: #teal put: (NamedColor fromString: '#029386') ;
  at: #lightBlue put: (NamedColor fromString: '#95d0fc') ;
  at: #red put: (NamedColor fromString: '#e50000') ;
  at: #brown put: (NamedColor fromString: '#653700') ;
  at: #pink put: (NamedColor fromString: '#ff81c0') ;
  at: #blue put: (NamedColor fromString: '#0343df') ;
  at: #green put: (NamedColor fromString: '#15b01a') ;
  at: #purple put: (NamedColor fromString: '#7e1e9c') ;
yourself! !
NamedColor initialize!
