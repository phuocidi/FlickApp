//
//  CollectionViewDelegateHandler.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/5/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class CollectionViewDelegateHandler: NSObject, UICollectionViewDelegate {
  
  var viewModel :ViewModelFlicker!
  
  init(viewModel : ViewModelFlicker) {
    self.viewModel = viewModel
  }

  //implement it in use
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //We do not have requirement to implement didselect, so it is empty
    }
}
