//
//  CellTableViewCell.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 26.06.2021.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nameLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
