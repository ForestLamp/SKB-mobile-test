//
//  MainScreen.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import UIKit

class MainScreen: UITableViewController {

    @IBOutlet weak var navigationBarOutlet: UINavigationItem!
    private var contactMainScreen = [MainScreenContacts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarOutlet.title = "Contacts"
        fetchData()
    }
    
    //MARK: - Fetch Data
    
    func  fetchData() {
        let urlString = "https://raw.githubusercontent.com/ForestLamp/mobile-test-ios/master/json/generated-01.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
                        do {
                            self.contactMainScreen = try JSONDecoder().decode([MainScreenContacts].self, from: data)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func configureCell(cell: CustomTableViewCell, for indexPath: IndexPath){
        let contact = contactMainScreen[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.phoneNumberLabel.text = contact.phone
        cell.temperamentLabel.text = contact.temperament
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactMainScreen.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! CustomTableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
        
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
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){
        
    }
}
