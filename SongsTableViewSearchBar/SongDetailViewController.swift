//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Radharani Ribas-Valongo on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    var song: Song!

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songName: UILabel!
    
    func setUpView() {
        artistName.text = song.artist
        songName.text = song.name
        songImage.image = UIImage(named: "loveSongs")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
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
