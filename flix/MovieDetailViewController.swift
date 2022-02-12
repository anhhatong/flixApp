//
//  MovieDetailViewController.swift
//  flix
//
//  Created by Maddie Tong on 2/12/22.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var landscapePoster: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var mainPoster: UIImageView!
    
    var movie: [String: Any]!;
    
    // Upon mounted, hide tabbar
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
                        
        movieTitle.text = movie["title"] as? String;
        movieTitle.sizeToFit(); // grow label until all text has been displayed
        movieDate.text = movie["release_date"] as? String;
        movieDescription.text = movie["overview"] as? String;
        movieDescription.sizeToFit(); // grow label until all text has been displayed
        
        let base_url = "https://image.tmdb.org/t/p/w500";
        let base_url_backdrop = "https://image.tmdb.org/t/p/w780";
        
        let mainPosterPath = movie["poster_path"] as! String;
        let mainPosterURL = URL(string: base_url + mainPosterPath);
        let landscapePosterPath = movie["backdrop_path"] as! String;
        let landscapePosterURL = URL(string: base_url_backdrop + landscapePosterPath);
        
        mainPoster.af.setImage(withURL: mainPosterURL!);
        landscapePoster.af.setImage(withURL: landscapePosterURL!);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
