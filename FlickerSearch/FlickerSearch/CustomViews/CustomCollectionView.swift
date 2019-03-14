//
//  CustomCollectionView.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/3/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class CustomCollectionView: UIView {
  
  private var collectionView: UICollectionView!
  private var viewModel: ViewModelFlicker!
  
  private var collectionViewDataSourceHandler : CollectionViewDataSourceHandler!
  
  private var collectionViewDelegateFlowLayoutHandler : CollectionViewDelegateFlowLayoutHandler!
  
  private var searchBarDelegateHandler : SearchBarDelegateHandler!


  
  private lazy var searchBar : UISearchBar = {
    let s = UISearchBar()
    s.placeholder = "Search"
    searchBarDelegateHandler = SearchBarDelegateHandler(viewModel: viewModel)
    searchBarDelegateHandler.delegate = viewModel
    s.delegate = searchBarDelegateHandler
    return s
  }()
  
  init(frame : CGRect, viewModel : ViewModelFlicker) {
    
    super.init(frame: frame)
    self.viewModel = viewModel
    setupView()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  //common func to init our view
  private func setupView() {
    backgroundColor = .lightGray
    setupsearchBar()
    setupCollectionView()
  }

  private func setupsearchBar(){
    let nav = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController
    nav?.topViewController?.navigationItem.titleView = searchBar
  }
  
  func reloadCollectionView(){
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  private func setupCollectionView(){
    
    let fl = UICollectionViewFlowLayout()
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: fl)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = UIColor.blue
    collectionView.alwaysBounceVertical = true
    
    /*inset and padding/margins stuffs*/
    fl.minimumInteritemSpacing = 5
    fl.minimumLineSpacing = 5
    fl.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    /*inset and padding/margins stuffs*/

    
    /*datasource & delegate*/
    collectionViewDataSourceHandler = CollectionViewDataSourceHandler(viewModel: viewModel)
    collectionViewDelegateFlowLayoutHandler = CollectionViewDelegateFlowLayoutHandler(viewModel: viewModel)
    
    collectionView.dataSource = collectionViewDataSourceHandler
    collectionView.delegate = collectionViewDelegateFlowLayoutHandler
    /*datasource & delegate*/

    collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
    
    addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: collectionView.topAnchor),
      bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
      leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
      trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
      ])
  }

}
