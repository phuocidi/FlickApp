//
//  UtilityExtensions.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/6/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
  /*extension to reuse alert controller*/
  func presentAlert(withTitle title: String, message : String) {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        print("You've pressed OK Button")
      }
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
    
  }
}
