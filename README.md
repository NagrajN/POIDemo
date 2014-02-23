![alt tag](http://imgur.com/iXyVLYw.jpg)  <....>  ![alt tag](http://imgur.com/GYhFa3O.jpg)



* Built and tested on IOS 7 / XCode 5 / IPhone Simulator 
* It has two view controllers 1) Map View and 2) History
* You can search an address, text, zip code, etc. (using google map client api)
* If a search is successfull then we show it on the map and insert an annotation. 
* Clicking the push pin brings up a annotation display
* No third party libraries, everything is Apple IOS SDK
* We use GCD to avoid blocking issues  
* We persist the search history
* The search history is displayed in a table view on a separate tab. Read only. Selection will not show the map.
* NO Unit Tests :-(
