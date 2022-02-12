//
//  ViewController.swift
//  flix
//
//  Created by Maddie Tong on 2/5/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // An array of dictionaries exists throughout the life time of the screen
    var movies = [[String:Any]]();

    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.rowHeight = 169;
        movieTableView.delegate = self;
        movieTableView.dataSource = self;
                
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    self.movies = dataDictionary["results"] as! [[String : Any]];
                    // Reload table view movies.count times!
                    self.movieTableView.reloadData();
             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Recycle cells when they are out of view
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell;
        let movie = movies[indexPath.row]; // get each movie
        let title = movie["title"] as! String; // get movie title from movie object
        let description = movie["overview"] as! String; // get movie title from movie object
        
        cell.movieTitle.text = title;
        cell.movieDescription.text = description;
        
        let base_url = "https://image.tmdb.org/t/p/w185";
        let posterPath = movie["poster_path"] as! String;
        let posterURL = URL(string: base_url + posterPath);
        
        /**
          * Step 1: Go to GitHub of the library and copy the URL
          * Step 2: File ->  Add package -> Paste the URL -> Add package
          * Step 3 (skip if already had Podfile): pod init in terminal
          * Step 4: Open Podfile and add "pod _ "
          * Step 5: Restart Xcode -> Open xworkspace -> Clean Build folder
          * Step 6: Import library
         */
        cell.moviePoster.af.setImage(withURL: posterURL!);
        
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find the selected movie
        // sender is generic so we have to typecast to type UITableViewCell to
        // get index of the cell
        let cell = sender as! UITableViewCell;
        let indexPath = movieTableView.indexPath(for: cell)!;
        let movie = movies[indexPath.row];
        
        // Pass that movie data to the next screen
        // segue.destination knows the destination view but
        // we have to typecast it to MovieDetailViewController to
        // be able to retreive "movie" variable from there
        let detailViewController = segue.destination as! MovieDetailViewController;
        detailViewController.movie = movie;
    }
}

