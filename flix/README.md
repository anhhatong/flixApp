# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

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
