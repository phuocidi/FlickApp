//
//  ViewController.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
  
  private  var viewModel = ViewModelFlicker()

  private lazy var customCollectionView = CustomCollectionView(frame: UIScreen.main.bounds, viewModel: viewModel)
  
  override func loadView() {
    super.loadView()
    setupCollectionView()
  }
  
  private func handleError(){
    viewModel.didHappenError = { [unowned self] (aErrorString) in
      self.presentAlert(withTitle: "Error", message: aErrorString)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpActivityIndicator()
    
    handleError()
  }
  
  private func setupCollectionView(){
    view = customCollectionView //instead of adding a view heirarchy, just assign it. Light weight
    viewModel.didUpdatePhotos = { [unowned self] (_) in
      self.customCollectionView.reloadCollectionView()
    }
  }
  
  private func setUpActivityIndicator(){
    
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    activityIndicator.center = view.center
    view.addSubview(activityIndicator)
    
    viewModel.didStartSearch = {  () in
      activityIndicator.startAnimating()
    }
    
    viewModel.didEndSearch = {  () in
      activityIndicator.stopAnimating()
    }
  }
    
}
