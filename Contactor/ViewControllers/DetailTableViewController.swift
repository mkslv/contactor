//
//  DetailTableViewController.swift
//  Contactor
//
//  Created by Max Kiselyov on 10/26/23.
//

import UIKit

final class DetailTableViewController: UITableViewController {

    private let data: Person
    
    init(data: Person) {
        self.data = data
        super.init(style: .plain)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellIdentifier = "Cell" // Делаем ячейку переиспользуемой 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(data.name) \(data.lastName)"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier) // Делаем ячейку переиспользуемой
//        view.backgroundColor = UIColor(named: "BackgroundColor")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Делаем ячейку переиспользуемой
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Create a content
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 1 {
            content.text = "Phone: \(data.phone)"
        } else {
            content.text = "Email: \(data.email)"
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table view Delegate
    
}
