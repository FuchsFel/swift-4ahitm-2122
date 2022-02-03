//
//  Model.swift
//  TestÜbung
//
//  Created by AHITM05 on 20.01.22.
//

import Foundation
import UIKit

class Model{
    
    var names = [String]()
    var usernames = [String]()
    var phonenumbers = [String]()
    var queue = DispatchQueue(label: "demo")
    var link = "https://jsonplaceholder.typicode.com/users"
    
    init(tableView: UITableView){
        
        queue.async{
            let data = self.downoad()
            DispatchQueue.main.async{
                
                self.names = data.0
                self.usernames = data.1
                self.phonenumbers = data.2
                
                tableView.reloadData()
            }
        }
    }




    func downoad() -> ([String], [String], [String]) {
        var names = [String]()
        var usernames = [String]()
        var phonenumbers = [String]()
        
        if let url = URL(string: self.link) {
            if let data = try? Data(contentsOf: url) {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let array = jsonObject as? [[String: Any]] {
                        for obj in array {
                            let name = obj["names"] as! String
                            let username = obj["usernames"] as! String
                            let phonenumber = obj["phone"] as! String
                            
                            names.append(name)
                            usernames.append(username)
                            phonenumbers.append(phonenumber)
                        }
                    }
                }
            }
        }
        return (names, usernames, phonenumbers)
    }
}
