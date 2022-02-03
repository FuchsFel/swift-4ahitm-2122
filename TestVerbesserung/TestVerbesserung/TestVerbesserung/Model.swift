//
//  Model.swift
//  TestVerbesserung
//
//  Created by AHITM05 on 02.02.22.
//

import Foundation
import UIKit

class Model{
    
    var names = [String]()
    var heights = [String]()
    var birth_years = [String]()
    let link = "https://edufs.edu.htl-leonding.ac.at/~c.aberger/download/4ahitm/people.json"
    let queue = DispatchQueue(label: "demo")
    
    
    init(tableView: UITableView){
        queue.async {
            let data = self.download()
            DispatchQueue.main.async {
                self.names = data.0
                self.heights = data.1
                self.birth_years = data.2
                
                tableView.reloadData()
            }
        }
    }
    
    
    func download() -> ([String], [String], [String]) {
        var names = [String]()
        var heights = [String]()
        var birth_years = [String]()
        
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url){
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let json = jsonObject as? [String:Any]{
                        if let array = json["results"] as? [[String:Any]]{
                            for user in array {
                                let name = user["name"] as! String
                                let height = user["height"] as! String
                                let birth_year = user["birth_year"] as! String
                                
                                names.append(name)
                                heights.append(height)
                                birth_years.append(birth_year)
                            }
                        }
                    }
                }
            }
        }
        return (names, heights, birth_years)
    }
}

