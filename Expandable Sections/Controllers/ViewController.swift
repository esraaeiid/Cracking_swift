//
//  ViewController.swift
//  Expandable Sections
//
//  Created by Esraa Eid on 17/02/2021.
//

import UIKit


class ViewController: UITableViewController {
    
    let cellID = "cellID"
    
    var person: [Persons] = []

    var twoDimensionalArray  = [
        ExpandableNames(isExpanded: false, names: ["Sarah", "Amy", "Kim"]),
        ExpandableNames(isExpanded: false, names: [ "Aalaa", "Sia"]),
        ExpandableNames(isExpanded: false, names: ["Davia"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded{
            return 0
        }
        else{
        return twoDimensionalArray[section].names.count
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        let imageVC = ImageViewController()
        self.navigationController?.pushViewController(imageVC, animated: true)

      
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleExpand), for: .touchUpInside)
        button.tag = section
        return button
    }
    
    @objc func handleExpand(button: UIButton){
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded

        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let name = twoDimensionalArray[indexPath.section].names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }

}
