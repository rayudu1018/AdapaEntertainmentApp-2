//
//  ActorVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit

class ActorVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var acL: [Actor] = []
    var inn = 0
    
    //var movieslist = actors
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        acL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = actorTableView.dequeueReusableCell(withIdentifier: "ActorView", for: indexPath) as? ActorView
        cell?.actorimage.image = UIImage(named: acL[indexPath.row].actorImageName)
        cell?.actorfullname.text = acL[indexPath.row].fullName
        cell?.actoryear.text = acL[indexPath.row].yearsActive
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of actors"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.inn = indexPath.row
        self.performSegue(withIdentifier: "ActorPoster", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.inn = indexPath.item
        self.performSegue(withIdentifier: "Ratings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actorTableView.register(UINib(nibName: "ActorView", bundle: nil), forCellReuseIdentifier: "ActorView")
        self.actorTableView.reloadData()
        
        
        acL.append(Actor(fullName: "Ram charan",yearsActive: "20013–present",movies: ["Orange", "magadheera", "rrr", "bruce lee", "yavadu","racha"],actorImageName: "charan",actionEpisodes: "",dancingSkills: "",performingSkills: "",overallRating: 0.0))
        
        acL.append(Actor(fullName: "Surya",yearsActive: "1985–present",movies: ["24","vikram","JaiBhim", "brothers", "7thsence", "Singam",],
            actorImageName: "Surya",actionEpisodes: "",dancingSkills: "",performingSkills: "",overallRating: 0.0))
        
        acL.append(Actor(fullName: "Vijay",yearsActive: "1986–present",movies: ["Leo","Master","Virshu", "Thupaki", "Theri", "Mersal"],
            actorImageName: "Vijay",actionEpisodes: "",dancingSkills: "",performingSkills: "",overallRating: 0.0))
        
        acL.append(Actor(fullName: "NTR",yearsActive: "1991–present",movies: ["RRR", "jaiLavakusa", "Garage", "Temper", "Brindavanam","Adhurs"],actorImageName: "NTR",actionEpisodes: "",dancingSkills: "",performingSkills: "",overallRating: 0.0))
        
        acL.append(Actor(fullName: "Prabhas",yearsActive: "2000–present",movies: ["adavi ramudu","baahubali2", "baahubali", "projectk","salar","radheShyam"],actorImageName: "Prabhas",actionEpisodes: "",dancingSkills: "",performingSkills: "",
                                overallRating: 0.0))
        
        actiorList = self.acL
        self.actorTableView.delegate = self
        self.actorTableView.dataSource = self
        
        
    }

     /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let transition = segue.identifier
    if transition == "ActorPoster"{
        let destination = segue.destination as! FilmographyVC
        
        
        }
     }*/
        
    
    @IBOutlet weak var actorTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ActorPoster" {
            
            let vc = segue.destination as! FilmographyVC
            vc.selectedActor = acL[inn]
            vc.inn = self.inn
        }else if segue.identifier == "Ratings" {
            
            let vc = segue.destination as! ActorRatingVC
            vc.selectedIndex = inn
        }
    }
    
    
}
