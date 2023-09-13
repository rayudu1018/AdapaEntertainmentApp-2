//
//  FilmographyVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit


class FilmographyVC: UIViewController,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    var selectedActor: Actor? = nil
    var movies: [String] = []
    var inn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movies = self.selectedActor?.movies ?? []
        
        moviesCV.delegate = self
        moviesCV.dataSource = self
       
    }
    
  

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCVC
        
        cell.posterIV.image = UIImage(named: movies[indexPath.row])
        cell.posterIV.contentMode = .scaleToFill
        cell.posterIV.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: width )
        
        
    }*/
 
    
    
    @IBOutlet weak var moviesCV: UICollectionView!
    
 
    


}
