//
//  FiveN2TableViewCell.swift
//  RxSwiftPetProject
//
//  Created by Kirill Drozdov on 27.06.2021.
//

import UIKit

class FiveN2TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
