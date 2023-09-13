//
//  MusicVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit
import ViewAnimator

class MusicVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        Musicc.append(Music(title: "Ram charan",composer: "Natu Natu",videoId: "pBVtSwb5G7M"))
        Musicc.append(Music(title: "Mahesh Babu",composer: "Who are you",videoId: "KU_HNamemkI"))
        Musicc.append(Music(title: "Allu Arjun",composer: "Buta boma",videoId: "2mDCVzruYzQ"))
        Musicc.append(Music(title: "Jr NTR",composer: "anagan angana ",videoId: "0LsxkQ28UkI"))
        Musicc.append(Music(title: "Prabhas",composer: "sanchari",videoId: "e_PhAbB0rkQ"))
        
        musicTV.delegate = self
        musicTV.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animations = AnimationType.from(direction: .top, offset: 100)
        UIView.animate(views: musicTV.visibleCells,
                       animations: [animations])
    }
    
    // MARK: - Navigatio
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "track" {
            
            let vc = segue.destination as! PlayMusicVC
            vc.selectedMusic = selectedMusic
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return Musicc.count
        }else {
            
            return favouriteList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        if indexPath.section == 0 {
            
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = Musicc[indexPath.row].title
            cell.detailTextLabel?.text = Musicc[indexPath.row].composer
            cell.imageView?.image = UIImage(systemName: "music.note.list")
            
            return cell
        }else {
            
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = favouriteList[indexPath.row].title
            cell.detailTextLabel?.text = favouriteList[indexPath.row].composer
            cell.imageView?.image = UIImage(systemName: "music.note.list")
            
            return cell
        }
    }
    
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }*/
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            
            return "Songs"
        }
        
        return "Favorites"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
            selectedMusic = Musicc[indexPath.row]
        }else {
            
            selectedMusic = favouriteList[indexPath.row]
        }
        
        self.performSegue(withIdentifier: "track", sender: self)
    }
    
    func tableView(_ tableView: UITableView,leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("OK, marked as Closed")
            success(true)
            
            let a = self.Musicc[indexPath.row]
            self.favouriteList.append(a)
            
            self.musicTV.reloadData()
            
        })
        closeAction.image = UIImage.init(systemName: "heart")
        closeAction.backgroundColor = .purple
        
        
        return UISwipeActionsConfiguration(actions: [closeAction])
    }
    

    @IBOutlet weak var musicTV: UITableView!
    
    var Musicc: [Music] = []
    var favouriteList: [Music] = []
    
    var selectedMusic: Music? = nil
    
    
}

