# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

<img src="http://g.recordit.co/6OuECMI3WV.gif" width=250><br>

### Notes
Grid layout sizing was a bit challenging, but I understood from the explanation video.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF

<img src='http://g.recordit.co/oNcudqxpG8.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### Notes
I had some issues with "pod init" and had to look up solutions. The problems was that my cocoapods required a version update, so I "sudo gem update cocoapods" to have it up-to-date. Another issue was with the cell outlets. It took me a while to figure out that the referencing was corrupt, so I removed old references and reconnected the object labels to my table cell file.
