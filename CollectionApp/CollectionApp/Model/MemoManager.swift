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
            return realm.objects(Memo.self).sorted(byKeyPath: "order", ascending: true)
        }()
    }
    
    private (set) var memos: Results<Memo>!
    
    var lastOrder: Int? {
        memos.max(ofProperty: "order")
    }
    
    var newOrder: Int {
        guard  let lastOrder = lastOrder else {
            return 0
        }
        return lastOrder + 1
    }
    
    func add(memo: Memo) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(memo)
        }
    }
    
    func remove(id: String) {
        let realm = try! Realm()
        let result = realm.objects(Memo.self).filter(NSPredicate(format: "id = %@", id))
        try! realm.write {
            realm.delete(result)
        }
    }
    
    func move(from: Int, to: Int) {
        let realm = try! Realm()
        
        try! realm.write {
            MemoManager.shared.memos[from].order = to
            MemoManager.shared.memos[to].order = from
            MemoManager.shared.memos = MemoManager.shared.memos.sorted(byKeyPath: "order", ascending: true)
        }
    }
}
