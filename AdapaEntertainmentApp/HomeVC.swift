//
//  HomeVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        profileIV.layer.cornerRadius = 20.0
        profileIV.layer.masksToBounds = true
        profileIV.layer.borderWidth = 2.0
        profileIV.layer.borderColor = CGColor(red:0,green:103,blue: 71, alpha: 0.2)
        profileIV.image=UIImage(named: "Shinchan")
        emailLBL.text = "shinchan@cartoon.mv"
        fullNameLBL.text = "Shinchan"
        phoneLBL.text = "+1009090090"
        bioTextView.text = "  In a world where the towns are peopled with cars, and even the bugs are mini motors, a young ambitious racing car called Lightning McQueen is a star. On his way to an important event he has to stop in the little town of Radiator Springs after he accidentally damages the road and is forced to repair it. He finds living in a community oddly endearing, making true friends and beginning to realise there's more in life than winning. A Pixar animation."
    }
    

    
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var fullNameLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var phoneLBL: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
