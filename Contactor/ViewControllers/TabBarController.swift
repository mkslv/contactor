//
//  TabBarController.swift
//  Contactor
//
//  Created by Max Kiselyov on 10/26/23.
//

import UIKit

final class TabBarController: UITabBarController {
    private var firstVC = UINavigationController(rootViewController: ContactsViewController())
    private let secondVC = UINavigationController(rootViewController: PhonesTableViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemPurple
        
        firstVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.crop.rectangle"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Phones", image: UIImage(systemName: "person.crop.square.filled.and.at.rectangle"), tag: 1)
        
        viewControllers = [firstVC, secondVC]
    }
}
