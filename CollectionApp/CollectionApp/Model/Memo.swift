//
//  Memo.swift
//  CollectionApp
//
//  Created by 栗須星舞 on 2020/12/23.
//  Copyright © 2020 星舞. All rights reserved.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var id = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
