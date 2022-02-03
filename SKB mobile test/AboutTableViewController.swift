//
//  AboutTableViewController.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    var name = ""
    var startEducationDate = ""
    var endEducationDate = ""
    var temperament = ""
    var phone = ""
    var biography = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startEducationLabel: UILabel!
    @IBOutlet weak var endEducationLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UIButton!
    @IBOutlet weak var biographyTView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        startEducationLabel.text = startEducationDate
        endEducationLabel.text = endEducationDate
        temperamentLabel.text = temperament
        biographyTView.text = biography

    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
}
