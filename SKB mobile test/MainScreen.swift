//
//  MainScreen.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import UIKit

class MainScreen: UITableViewController {

    @IBOutlet weak var navigationBarOutlet: UINavigationItem!
  
    
    let tableData = ["1","2","3","4","5","6","7"]
    
    enum themperament: String {
        case Melancholic, Phlegmatic, Sanguine, Choleric
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarOutlet.title = "Contacts"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! CustomTableViewCell
//        cell.textLabel?.text = tableData[indexPath.row]
//        cell.detailTextLabel?.text = tableData[indexPath.row]
        cell.temperamentLabel.text = themperament.Choleric.rawValue
        cell.phoneNumberLabel.text = "+7 922 039 23 68"
        cell.nameLabel.text = "Alex Chusovitin"
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hi"
    }
    
    // MARK: - TableWiew Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
