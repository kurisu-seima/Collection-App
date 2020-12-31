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
    
    func move(sourceIndexPath: Int, destinationIndexPath: Int) {
        let realm = try! Realm()
        
        try! realm.write {
            let sourceMemo = MemoManager.shared.memos[sourceIndexPath]
            let destinationMemo = MemoManager.shared.memos[destinationIndexPath]
            
            let destionationOrder = destinationMemo.order
            
            if sourceIndexPath < destinationIndexPath {
                // 上から下に移動した場合、間の項目を上にシフト
                for index in sourceIndexPath...destinationIndexPath {
                    let memo = MemoManager.shared.memos[index]
                    memo.order -= 1
                }
            } else {
                // 下から上に移動した場合、間の項目を下にシフト
                for index in (destinationIndexPath...sourceIndexPath).reversed() {
                    let memo = MemoManager.shared.memos[index]
                    memo.order += 1
                }
            }
            // 移動したセルの並びを移動先に更新
            sourceMemo.order = destionationOrder
        }
    }
}
