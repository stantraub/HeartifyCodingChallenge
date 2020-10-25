# HeartifyCodingChallenge
![Swift version](https://img.shields.io/badge/swift-5.0-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%20-lightgrey.svg)

## Demo

<img src=https://heartify-challenge-screenshots.s3-us-west-1.amazonaws.com/Screen+Shot+2020-10-25+at+3.54.14+PM.png width="250"><img src=https://heartify-challenge-screenshots.s3-us-west-1.amazonaws.com/Screen+Shot+2020-10-25+at+3.54.37+PM.png width="250"><img src=https://heartify-challenge-screenshots.s3-us-west-1.amazonaws.com/Screen+Shot+2020-10-25+at+3.52.51+PM.png width="250"> 


## Getting Started

```bash
$ git clone https://github.com/stantraub/HeartifyCodingChallenge.git
$ cd HeartifyCodingChallenge/
$ pod install
$ open HeartifyCodingChallenge.xcworkspace
```

## Technologies Used

1. UIKit (Programmatic)
2. Alamofire
3. SwiftyJSON
4. SDWebImage
5. iCarousel
6. JGProgressHud

## Features

- [x] Onboarding screen with blue background and "Continue" button on the bottom of the screen
- [x] Dark mode support!
- [x] TabBar with 5 tab items and their respective icons/titles
- [x] Auto-scrolling (left to right) carousel of cards that fetch their information from the provided API
- [x] Progress indicator during the duration of the API call to fetch card information
- [x] Tapping on a card brings up a UIAlertController with the card's title and updates the label on the info tab with that title

## Architecure 

The app was built with an MVC architecture

* Alamofire for network layer.

## Author

Stanley Traub - Contact me at <stanley.traub@gmail.com>  





