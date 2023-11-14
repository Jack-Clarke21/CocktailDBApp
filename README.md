# Random Cocktail Generator

This Flutter application generates random cocktail recipes using the [CocktailDB API](https://www.thecocktaildb.com/api.php).

## Overview

The app allows users to:

- Generate random cocktail recipes
- View details about the cocktail, including ingredients, glassware, and instructions on how to make it

## Installation

### Requirements

- Flutter SDK
- Android Studio / Xcode
- Internet connectivity to fetch cocktail data

### Getting Started

1. Clone the repository or download the project files.
2. Open the project in your preferred IDE (Android Studio / VS Code).
3. Run `flutter pub get` to install dependencies.
4. Connect your device/emulator and run the app using `flutter run`.

## Usage

- Upon launching the app, the main screen displays a button to generate a random cocktail recipe.
- Tapping on "Show me a Cocktail" fetches a random cocktail's details.
- Users can navigate to detailed information about the cocktail by pressing the "Show me how to make" button.
- The application utilizes the CocktailDB API to fetch cocktail data.
- Please note that the CocktailDB API may have restrictions on commercial use or redistribution of fetched data. Ensure compliance with the API's terms of use.


## Project Structure

### Code Structure

The main components of the application include:

- **`main.dart`**: Entry point of the application.
- **`MyApp`**: Contains the main UI structure and navigation.
- **`CocktailPage`**: Displays basic cocktail details.
- **`CocktailPageWithInfo`**: Provides detailed cocktail information.
- **`AnimatedTextSwitcher`**: Handles animation for text changes.
- **`GenerateCocktailButton`**: Button widget to generate random cocktails.
- **`NavigateToCocktailInfoButton`**: Button widget to navigate to detailed cocktail info.
- **`CocktailData`**: Model class to represent cocktail information.
- **`fetchCocktailData`**: Function to fetch random cocktail data from the CocktailDB API.

### Dependencies

- `http`: Used for making HTTP requests to fetch cocktail data.
- `flutter/material.dart`: Flutter's UI toolkit.
- `dart:async`: Provides asynchronous programming features.

## Credits

- This app utilizes the [CocktailDB API](https://www.thecocktaildb.com/api.php) for fetching cocktail information.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

---


## Old information regarding creation for Job Application




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
		 

Conclusions:

Overal I'm happy with the application, didnt have time to refactor code or style buttons (let alone testing or much animation) but given time restraints im happy to ave hit the key objectives.
Passing data between pages was the thing i struggled most with and thinking there may have been a better way to do this.

Thank you for looking 
Jack		
