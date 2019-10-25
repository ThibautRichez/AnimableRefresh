//
//  ViewController.swift
//  AnimableRefresh
//
//  Created by thibaut.richez@benextcompany.com on 10/22/2019.
//  Copyright (c) 2019 thibaut.richez@benextcompany.com. All rights reserved.
//

import AnimableRefresh
import UIKit

class ViewController: UIViewController {
    // MARK: - Interface Properties
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    
    var numbers = Array(1...100)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
    }
    
    // MARK: - Configuration
    
    private func configure() {
        title = "Test"
        self.configureTableView()
        self.configureNavBar()
        self.configureRefresher()
    }
    
    // MARK: - Refresh handler
    
    private func configureRefresher() {
        tableView.addRefresh {
            self.fetch()
        }
    }
    
    private func fetch() {
        let fetchDuration = Int.random(in: 0...5)
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(fetchDuration)) {
            self.didFetch()
        }
    }
    
    private func didFetch() {
        DispatchQueue.main.async {
            self.tableView.endRefresh()
            self.tableView.reloadData()
        }
    }
    
    @objc private func addTapped() {
        self.tableView.startRefresh()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
}

// MARK: - View configuration

extension ViewController {
    private func configureTableView() {
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 1).isActive = true
        tableView.leftAnchor.constraint(equalToSystemSpacingAfter: self.view.leftAnchor, multiplier: 1).isActive = true
        tableView.rightAnchor.constraint(equalToSystemSpacingAfter: self.view.rightAnchor, multiplier: 1).isActive = true
        tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.bottomAnchor, multiplier: 1).isActive = true
    }
    
    private func configureNavBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .clear
        edgesForExtendedLayout = []
        
        let add = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
}
