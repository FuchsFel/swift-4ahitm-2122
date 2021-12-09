//
//  Model.swift
//  namensverwaltung
//
//  Created by AHITM01 on 03.12.21.
//

import UIKit

class Model {

    var vornamen = [String]()
    var nachnamen = [String]()
    
    func add(vname:String!, nname:String!) {
        vornamen.append(vname)
        nachnamen.append(nname)
    }
    
}
