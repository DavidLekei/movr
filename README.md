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

### Choose the services you have

![](https://i.gyazo.com/aa04359f51f92fb033e9dce66f275e86.png)

### Then select the genre's you're interesting in

![](https://i.gyazo.com/eefff1b57244e09ede7659cd53482e0d.png)

### Then start swiping! Right for "Want to watch". Left for "Don't want to watch"

![](https://i.gyazo.com/0174c0a45dd2cef558b3185694321fa2.mp4)

## Author

David Lekei

## License


