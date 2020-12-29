//
//  CollectionViewController.swift
//  CollectionApp
//
//  Created by くりすせいま on 2020/12/13.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit
import RealmSwift

class CollectionViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myCollectionView.reloadData()
    }
    
    @IBAction func createButtonDidTapped(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "memoCreateVC") as! MemoCreateViewController
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func longTap(sender: UILongPressGestureRecognizer) {
        guard let selectedIndexPath = myCollectionView.indexPathForItem(at: sender.location(in: myCollectionView)) else {
            return
        }

        let alert = UIAlertController(title: "該当のメモを削除しますか？", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "はい", style: .default) { _ in
            MemoManager.shared.remove(id: MemoManager.shared.memos[selectedIndexPath.row].id)
            self.myCollectionView.deleteItems(at: [selectedIndexPath])
        })
        alert.addAction(UIAlertAction(title: "いいえ", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.setUp(index: indexPath.row)
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(sender:)))
        cell.addGestureRecognizer(longTapGesture)
        return cell
    }
    
    //セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MemoManager.shared.memos.count
    }
    
    //セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width / 2 - 15
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    //セルの左右の間隔
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //セクションごとの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
    }
}
