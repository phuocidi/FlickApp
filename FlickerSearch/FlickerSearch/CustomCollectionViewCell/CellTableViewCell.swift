//
//  CellTableViewCell.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/3/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
  
  static var identifier: String = "Cell"
  
  private var imgView : UIImageView!
  private var textLabel : UILabel!
  
  /*textLabel set up*/
  private func setUpLabel(){
    textLabel = UILabel(frame: CGRect.zero)
    textLabel.textColor = UIColor.white
    textLabel.backgroundColor = UIColor.darkGray
    let font = UIFont(name: "Helvetica", size: 13.0)
    textLabel.numberOfLines = 0
    textLabel.font = font
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(textLabel)

  }
  
  private func setUpImageView(){
    imgView = UIImageView(frame: CGRect.zero)
    imgView.backgroundColor = UIColor.darkGray
    imgView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(imgView)
  }
  
  /*set up constraints*/
  func setUpConstraints(){
    
    NSLayoutConstraint.activate([NSLayoutConstraint.init(item: imgView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: imgView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: imgView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: imgView, attribute: .bottom, relatedBy: .equal, toItem: textLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: textLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: textLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                                 
                                 NSLayoutConstraint.init(item: textLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                                 ])
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.backgroundColor = UIColor.darkGray
    /*imageViewSetUP*/
    setUpImageView()
    /*imageView set up*/

    /*textLabel set up*/
    setUpLabel()
    /*textLabel set up*/

    /*set up constraints*/
    setUpConstraints()
    /*set up constraints*/

    
  }
  
  // MARK: - Configuration
  
  private func getImagePath(for photo: Photo)-> String{
    let imgPath = "https://farm\(photo.farm!).static.flickr.com/" + photo.server! + "/" + photo.id! + "_" + photo.secret! + ".jpg"
return imgPath
  }
  
  func configure(withPhoto photo: Photo) {
    
    let path = getImagePath(for: photo)
    
    guard let url = URL(string: path) else { return }
    
    ImageCache.shared.fetchImage(url: url) { (imageOptional) in
      
      if let image = imageOptional{
        self.imgView.image = image
        self.layoutIfNeeded()
      }
    }
    self.textLabel.text = photo.title
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
}
