//
//  MovieTableViewCell.swift
//  flix
//
//  Created by Maddie Tong on 2/7/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
