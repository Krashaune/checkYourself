//
//  TableViewCellSong.swift
//  
//
//  Created by kiera thomasson on 7/17/18.
//

import UIKit

class TableViewCellSong: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
