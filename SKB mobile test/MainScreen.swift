//
//  MainScreen.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import UIKit

class MainScreen: UITableViewController {

    @IBOutlet weak var navigationBarOutlet: UINavigationItem!
    

    let searchController = UISearchController(searchResultsController: nil)
    
    private var timer = Timer()
    
    let networkService = NetworkService()
    var searchResponse: [SearchResponse] = []
    
//    let sortedContact = contactMainScreen.sorted(by: {$0.name < $1.name})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarOutlet.title = "Contacts"
        setupSearchBar()
        
        let urlString = "https://raw.githubusercontent.com/ForestLamp/mobile-test-ios/master/json/generated-01.json"
        
        networkService.request(urlString: urlString) {[weak self](result) in
            switch result {
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
                self?.tableView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
        
    }
    
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func configureCell(cell: CustomTableViewCell, for indexPath: IndexPath){
  //      let sortedContact = contacts.sorted(by: {$0.name < $1.name})
        let contact = searchResponse[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.phoneNumberLabel.text = contact.phone
        cell.temperamentLabel.text = contact.temperament.rawValue
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse.count
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "AboutTableViewController") as? AboutTableViewController
//        vc?.name = contacts[indexPath.row].name
//        vc?.startEducationDate = contacts[indexPath.row].educationPeriod.start
//        vc?.endEducationDate = contacts[indexPath.row].educationPeriod.end
//        vc?.temperament = contacts[indexPath.row].temperament.rawValue
//        vc?.phone = contacts[indexPath.row].phone
//        vc?.biography = contacts[indexPath.row].biography
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){
        
    }
}


extension MainScreen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
//            let search = self.searchResponse
            print(searchText)
        })
    }
}
