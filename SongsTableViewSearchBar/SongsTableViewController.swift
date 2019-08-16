//
//  SongsTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Radharani Ribas-Valongo on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController, UISearchBarDelegate {

    
    //MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    let songs = Song.loveSongs
    
    var searchString: String? = nil {
        didSet {
            print(searchString)
            self.tableView.reloadData()
        }
    }
    
    var songSearchResults:[Song] {
        get {
            
            //when we have no search term, return the value of the initial set of people
            guard let searchString = searchString else {
                return songs
            }
            guard searchString != ""  else {
                return songs
            }
            if let scopeTitles = searchBar.scopeButtonTitles {
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                
                switch scopeTitles[currentScopeIndex] {
                case "Name":
                    return songs.filter{$0.name.lowercased().contains(searchString.lowercased())}
                case "Artist":
                    return songs.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                default:
                    return songs
                }
            }
            return songs
        }
    }
    
    //MARK: Life Cycle Stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let song = songSearchResults[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "songListCell", for: indexPath)

        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist

        return cell
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? SongDetailViewController, let indexpath = tableView.indexPathForSelectedRow else {
            return
        }
        destination.song = songSearchResults[indexpath.row]
    }
    

}
