
# Tracks

Tracks is an IOS app which aims to help commuters get rapid info on the next trains. The user will add his routes and the app will update the data on each refresh. It comes with a watch companion app to give a more flexible experience.

### Api Struggles
We used www.viaggiotreno.it api's to get live data of the Trenitalia Trains. The information are updated really fast and are more reliable of the ones showed in the stations but on the other hand the communication with the api it's a mess. The JSON response are full of useless data and it's quite complicated to handle it. In the first version of the app we did everything doing sequential asyncronous calls which made the data refresh opertion quite slow. Now we implemented concurrency and we handle all the calls with taskgroups.

The function responsible of updating the data is TripViewModel.updateTrips() which, for each trip added by the user, creates a task responsible of making the api calls to update the data. Once each task has finished the userTrips published variable is updated and the UI changes. Thoose two operation must be separated since the api calls are handled on background threads while all the UI related changes must happen on main threads. (since xcode 14 this kind of error is showns as a purple triangle and the first version of this project was full of them :) ) 

Another part of the backend that has been sped up using concurrency is the ApiController.getPossibleTrains() which has the task of filtering the train given the user trip. This makes both the refresh and the adding of a new trip way faster.
