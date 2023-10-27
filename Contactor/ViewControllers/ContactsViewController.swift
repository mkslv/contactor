//
//  ContactsTableViewController.swift
//  Contactor
//
//  Created by Max Kiselyov on 10/26/23.
//

import UIKit

final class ContactsViewController: UIViewController {
    // MARK: - Properties
    // Model
    private var data = DataStore.shared.getData()
    
    // Properties
    private let cellIdentifier = "Cell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth] // FIXME: зачем делаю???
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier) // Делаем ячейку переиспользуемой 
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupView()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Methods

}

// MARK: - Setting View
private extension ContactsViewController {
    func setupView() {
        addSubviews()
        setupNavigationItem()
        
    }
}

// MARK: - Settings
private extension ContactsViewController {
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setupNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Persons list"
    }
}

// MARK: - TableView DataSource
extension ContactsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) // Делаем ячейку переиспользуемой
        cell.textLabel?.text = "\(data[indexPath.row].name) \(data[indexPath.row].lastName)"
        return cell
    }
}

// MARK: - TableView Delegate
extension ContactsViewController: UITableViewDelegate {
    // действия при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailTableViewController(data: data[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)

        // Снимаю выделение с ячейки выбранной
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
