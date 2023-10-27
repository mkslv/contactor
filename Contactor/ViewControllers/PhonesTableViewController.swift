//
//  PhonesTableViewController.swift
//  Contactor
//
//  Created by Max Kiselyov on 10/26/23.
//

import UIKit

final class PhonesTableViewController: UITableViewController {

    let data = DataStore.shared.getData()
    
    init() {
        super.init(style: .grouped)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contact data"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        // Create a content to our cell
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = data[indexPath.section].phone
        } else {
            content.image = UIImage(systemName: "envelope")
            content.text = data[indexPath.section].email
        }
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(data[section].name) \(data[section].lastName)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // hise selection on tapped cell
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
