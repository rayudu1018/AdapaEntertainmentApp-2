//
//  Actorview.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit

class ActorView: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setAttributes(for: actorimage)
    }
    
    @IBOutlet weak var actorimage: UIImageView!
    
    @IBOutlet weak var actorfullname: UILabel!
    
    @IBOutlet weak var actoryear: UILabel!
    
    private func setAttributes(for view: UIView) {
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    
}
