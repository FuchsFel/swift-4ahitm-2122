//
//  Model.swift
//  TestVorbereitung
//
//  Created by AHITM05 on 19.01.22.
//

import Foundation
import UIKit

class Model{
    
    var names = [String]()
    var usernames = [String]()
    var phonenumbers = [String]()
    let queue = DispatchQueue(label: "demo")
    
    init(tableView: UITableView){
        queue.async {
            let data = self.download()
            DispatchQueue.main.async {
                self.names = data.0
                self.usernames = data.1
                self.phonenumbers = data.2
                
                tableView.reloadData()
            }
        }
    }
    
    func download() -> ([String], [String], [String]) {
        var names = [String]()
        var usernames = [String]()
        var phonenumbers = [String]()
        
        let link = "https://jsonplaceholder.typicode.com/users"
        
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url){
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let array = jsonObject as? [[String:Any]]{
                        for user in array {
                            let name = user["name"] as! String
                            let username = user["username"] as! String
                            let phone = user["phone"] as! String
                            names.append(name)
                            usernames.append(username)
                            phonenumbers.append(phone)
                        }
                    }
                }
            }
        }
        return (names, usernames, phonenumbers)
    }
}
