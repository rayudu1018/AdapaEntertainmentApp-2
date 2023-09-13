//
//  ActorRatingVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit

class ActorRatingVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
  
    

    var pickerViewData: [Any] = ["🔥","😍","💀","👌","💩"]
    var selectedActor: Actor? = nil
    var selectedIndex = 0
    var selectedTF: UITextField? = nil
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedActor = actiorList[selectedIndex]
    
        self.actorIMG.layer.cornerRadius = 20
        self.actorIMG.clipsToBounds = true
        self.actorIMG.layer.borderWidth = 2
        self.actorIMG.layer.borderColor = UIColor.black.cgColor
        self.actorIMG.contentMode = .scaleToFill
        self.pickerView.isHidden = true
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.actorIMG.image = UIImage(named: selectedActor?.actorImageName ?? "")
        self.actingTF.text = selectedActor?.performingSkills ?? ""
        self.danceTF.text = selectedActor?.dancingSkills ?? ""
        self.actionEpisodesTF.text = selectedActor?.actionEpisodes ?? ""
        self.overallPerformanceSlider.value = selectedActor?.overallRating ?? 0.0
    }

    

    @IBOutlet weak var actorIMG: UIImageView!
    @IBOutlet weak var actingTF: UITextField!
    @IBOutlet weak var danceTF: UITextField!
    @IBOutlet weak var actionEpisodesTF: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var overallPerformanceSlider: UISlider!
    
    @IBAction func save(_ sender: UIButton) {
        
        self.pickerView.isHidden = true
        selectedActor?.overallRating = overallPerformanceSlider.value
        selectedActor?.dancingSkills = danceTF.text ?? ""
        selectedActor?.performingSkills = actingTF.text ?? ""
        selectedActor?.actionEpisodes = actionEpisodesTF.text ?? ""
        
        actiorList[selectedIndex] = selectedActor!
        
        let alertController = UIAlertController(title: "Success ✅", message: "Rating are saved", preferredStyle: .alert)


        let image = UIImage(named: "success_icon")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 172, y: 22, width: 16, height: 16)

       
        alertController.view.addSubview(imageView)

        // Add an OK button to the alert view controller
        let okAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alertController.addAction(okAction)

        // Present the alert view controller
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func clearRatings(_ sender: UIButton) {
        
        overallPerformanceSlider.value = 0
        actingTF.text = ""
        danceTF.text = ""
        actionEpisodesTF.text = ""
        
        selectedActor?.overallRating = 0
        selectedActor?.dancingSkills = ""
        selectedActor?.performingSkills = ""
        selectedActor?.actionEpisodes = ""
        
        actiorList[selectedIndex] = selectedActor!
        
        
        self.pickerView.isHidden = true
    }
    
    @IBAction func actingBeginEditing(_ sender: Any) {
        
        self.selectedTF = actingTF
        self.pickerView.isHidden = false
    }
    
    @IBAction func danceBeginEditing(_ sender: Any) {
        
        self.selectedTF = danceTF
        self.pickerView.isHidden = false
    }
    
    
    @IBAction func actionBeginEditing(_ sender: Any) {
        
        self.selectedTF = actionEpisodesTF
        self.pickerView.isHidden = false
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.pickerViewData[row] as? String ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if selectedTF == actingTF {
            
            actingTF.text = self.pickerViewData[row] as? String ?? ""
        }else if selectedTF == danceTF {
            
            danceTF.text = self.pickerViewData[row] as? String ?? ""
        }else if selectedTF == actionEpisodesTF {
            
            actionEpisodesTF.text = self.pickerViewData[row] as? String ?? ""
        }
        
        pickerView.isHidden = true
    }
}

    
    

