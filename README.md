CocktailDBApp
A simple application to learn flutter with

Time -
for 6 hours work with a Pomodoro timer (25 mins work, 5 mins break and 20 min break every 4 sessions)
final hand-in should be at 8pm (5hours 50min work, 1 hour 55min breaks)

Plan -

	download and setup flutter

	Research -
		How to make a button in flutter
		how to access api
		how to parse JSON
		How to style
		How to animate (improve UX)
		How to test (maybe left till end due to time constraints)

	Quick design mockup on pen and paper

	write out pseudo code for any language

	break apart pseudo code into pieces and start trying to implement in flutter

	Start simple stylings for effective mock-up

	Improve stylings for better design
	
	 Add in appropriate animations for better UX

Pseudo

	Create a title page
	Create a New Cocktail button with text on
	When button is pressed
		Accsses JSON file from "https://www.thecocktaildb.com/api/json/v1/1/random.php"
		Store needed variabels (Name, glass, thumbnail, instructions and ingredients)
		Open a new page(or clear current page)
		Display Name, and thumbnail 
		Display Recipie button
		Display newCocktail button again so a different one can be found

	Create a Recipie button
		Loop through the ingreidents and mesures
		if Stringredient[i] != null then display ingreidnt and corrisponding mesuremnt (if there is one) 
		when an ingerdeint does equal null stop
		 
		
