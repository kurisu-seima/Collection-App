//
//  MemoManager.swift
//  CollectionApp
//
//  Created by 栗須星舞 on 2020/12/25.
//  Copyright © 2020 星舞. All rights reserved.
//

import Foundation
import RealmSwift

class MemoManager {
    
    static let shared: MemoManager = MemoManager()
    
    private init() {
        memos = {
            let realm = try! Realm()
           return realm.objects(Memo.self)
        }()
    }
    
    private (set) var memos: Results<Memo>!
    
    func add(memo: Memo) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(memo)
        }
    }
    
    func remove(index: Int) {
        let memo = memos[index]
        let realm = try! Realm()
        try! realm.write {
            realm.delete(memo)
        }
    }
}


