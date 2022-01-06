//
//  TableViewController.swift
//  jsonDownload
//
//  Created by AHITM01 on 05.01.22.
//

import UIKit

class TableViewController: UITableViewController {

        let queue = DispatchQueue(label: "demo")
        //let link = "https://jsonplaceholder.typicode.com/todos"
        let link = "https://jsonplaceholder.typicode.com/users"
        //var titles = [String]()
        var names = [String]()
        var emails = [String]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            queue.async {
                let tuple = self.download()
                DispatchQueue.main.async {
                    //print("titles: \(titles)")
                    self.names = tuple.0
                    self.emails = tuple.1
                    self.tableView.reloadData()
                }
            }
     
        }


        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return names.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            let name = names[indexPath.row]
            let email = emails[indexPath.row]
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = email
            return cell
        }

        func download() -> ([String], [String]) {
            var names = [String]()
            var emails = [String]()
            if let url = URL(string: link) {
                if let data = try? Data(contentsOf: url) {
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                        if let array = jsonObject as? [ [String: Any] ] {
                            for obj in array {
                                let id = obj["id"] as! Int
                                let name = obj["name"] as! String
                                let email = obj["email"] as! String
                                print("obj=\(id) title=\(name)")
                                names.append(name)
                                emails.append(email)
                            }
                        }
                    } else {
                        print("ka json")
                    }
                } else {
                    print("failed to download")
                }
            }
            return (names, emails)
        }

}
