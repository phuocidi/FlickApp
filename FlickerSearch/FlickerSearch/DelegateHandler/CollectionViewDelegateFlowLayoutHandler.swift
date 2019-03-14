//
//  CollectionViewDelegateFlowLayoutHandler.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/5/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class CollectionViewDelegateFlowLayoutHandler : NSObject, UICollectionViewDelegateFlowLayout{
  
  private var viewModel :ViewModelFlicker!
  
  fileprivate var tmpPhotoCount : Int  = 0                  // tmp count for lazy loading
  
  init(viewModel : ViewModelFlicker) {
    self.viewModel = viewModel
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let aPhotp = viewModel.photo(at: indexPath.item)
    let nbCol = 4
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let totalSpace = flowLayout.sectionInset.left
      + flowLayout.sectionInset.right
      + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
    
    let font = UIFont(name: "Helvetica", size: 13.0)
    
    let height = heightForView(text: aPhotp?.title ?? "", font: font!, width: CGFloat(size)) + 50
    
    return CGSize(width: CGFloat(size), height: CGFloat(height))
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5.0
}
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row + 1 == self.viewModel.numberOfPhotos && tmpPhotoCount < viewModel.numberOfPhotos {
      
      tmpPhotoCount = viewModel.numberOfPhotos
      
      guard let text = viewModel.searchText else { return }
      viewModel.query = text
    }
  }

  func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return CGFloat(label.frame.height)
  }

}
