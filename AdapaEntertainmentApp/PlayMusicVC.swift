//
//  PlayMusicVC.swift
//  AdapaEntertainmentApp
//
//  Created by Adapa,Venkata Rayudu on 4/21/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class PlayMusicVC: UIViewController,YTPlayerViewDelegate {
    
    @IBOutlet weak var videoPlayerView: YTPlayerView!
    
    var selectedMusic: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = selectedMusic?.title
        
        
        let id = selectedMusic?.videoId ?? ""
        videoPlayerView.load(withVideoId: id)
        videoPlayerView.playVideo()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
