//
//  MovieGridViewController.swift
//  flix
//
//  Created by Maddie Tong on 2/12/22.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var movieGridCollectionView: UICollectionView!
    
    var movies = [[String:Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        movieGridCollectionView.delegate = self;
        movieGridCollectionView.dataSource = self;
        
        // To stylize the grid spacing and image view size
        // Goal is to have equal spacing and sizable on multiple device
        let layout = movieGridCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4; // upper lower spacing
        layout.minimumInteritemSpacing = 4; // two sides spacing
        
        // screen width / num items on a row
        let width = view.frame.size.width / 2;
        layout.itemSize = CGSize(width: width-2, height: (width * 3 / 2)-2)

        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
                    self.movieGridCollectionView.reloadData();
             }
        }
        task.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieGridCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCollectionViewCell", for: indexPath) as! MovieGridCollectionViewCell;
        
        let movie = movies[indexPath.row];
        let base_url = "https://image.tmdb.org/t/p/w500";
        let posterPath = movie["poster_path"] as! String;
        let posterURL = URL(string: base_url + posterPath);
        
        cell.moviePoster.af.setImage(withURL: posterURL!);
        
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find the selected movie
        // sender is generic so we have to typecast to type UITableViewCell to
        // get index of the cell
        let cell = sender as! UICollectionViewCell;
        let indexPath = movieGridCollectionView.indexPath(for: cell)!;
        let movie = movies[indexPath.row];
        
        // Pass that movie data to the next screen
        // segue.destination knows the destination view but
        // we have to typecast it to MovieDetailViewController to
        // be able to retreive "movie" variable from there
        let detailViewController = segue.destination as! MovieDetailViewController;
        detailViewController.movie = movie;
    }

}
