//
//  CollectionViewDataSourceHandler.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/5/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class CollectionViewDataSourceHandler: NSObject, UICollectionViewDataSource {
  
  private var viewModel :ViewModelFlicker!
  
  init(viewModel : ViewModelFlicker) {
    self.viewModel = viewModel
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfPhotos
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
    
    let aPhotp = viewModel.photo(at: indexPath.item)
    
    guard let aPhotoUnwrapped = aPhotp else { return cell }
    
    cell.configure(withPhoto: aPhotoUnwrapped)
    
    return cell
  }
}
