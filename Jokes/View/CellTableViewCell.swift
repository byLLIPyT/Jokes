//
//  CellTableViewCell.swift
//  Jokes
//
//  Created by Александр Уткин on 06.03.2020.
//  Copyright © 2020 Александр Уткин. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var labelJoke: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
