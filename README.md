# movr

Tinder for Movies

(DISCLAIMER: This project is still a work in progress. In it's current state, it servers as a high fidelity prototype.)

## About

movr is an app for Android and iOS that helps groups to choose a movie/tv show to watch. 

Each user swipes through the same list of movies/tv shows. If all users swipe 'yes' to a movie/tv show, it gets added to a list of matches.

The matches are then displayed to the group so they can choose something they all want to watch.

## Technology used

movr was developed in Android Studio using Flutter for cross platform on Android/iOS.

I created an HTTP API using Python/Flask running on Amazon's ElasticBeanstalk to create/retrieve lists of movies based on user-specified parameters.

All movie data was scraped from the web using a scraper I wrote in Python. 

Amazon's RDS was used for a MySQL server to store movie/tv show data.

Amazon's S3 was used to store movie/tv show posters.

## Screenshots


## Author

David Lekei

## License


