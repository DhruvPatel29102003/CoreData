//
//  MyTableViewCell.swift
//  CoreDataDemo
//
//  Created by Droadmin on 28/08/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var StudentNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
