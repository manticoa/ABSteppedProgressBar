//
//  ExempleViewController.swift
//  Exemple
//
//  Created by Antonin Biret on 27/07/16.
//  Copyright © 2016 antoninbiret. All rights reserved.
//

import UIKit
import ABSteppedProgressBar

class ExempleViewController: UIViewController {
  
  
  private var _processIsDone = false
  
  let progressBar = ABSteppedProgressBar()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    progressBar.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(progressBar)
    
    // iOS9+ auto layout code
    let horizontalConstraint = progressBar.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
    let verticalConstraint = progressBar.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
    let widthConstraint = progressBar.widthAnchor.constraintEqualToAnchor(nil, constant: 170)
    let heightConstraint = progressBar.heightAnchor.constraintEqualToAnchor(nil, constant: 40)
    NSLayoutConstraint.activateConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    
    
    // Customise the progress bar here
    progressBar.numberOfPoints = 3
    progressBar.lineHeight = 15
    progressBar.radius = 20
    progressBar.progressRadius = 15
    progressBar.progressLineHeight = 10
    
    progressBar.currentIndex = 1
    progressBar.delegate = self
    
    progressBar.stepTextColor = UIColor.whiteColor()
    progressBar.stepTextFont = UIFont.systemFontOfSize(20)
    
    progressBar.backgroundShapeColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
    progressBar.selectedBackgoundColor = UIColor(red: 64/255, green: 173/255, blue: 21/255, alpha: 1)
  }
}

extension ExempleViewController: ABSteppedProgressBarDelegate {
  
  func progressBar(progressBar: ABSteppedProgressBar,
                   willSelectItemAtIndex index: Int) {
    print("progressBar:willSelectItemAtIndex:\(index)")
  }
  
  func progressBar(progressBar: ABSteppedProgressBar,
                   didSelectItemAtIndex index: Int) {
    print("progressBar:didSelectItemAtIndex:\(index)")
    
    if index == 2 {
      self._processIsDone = true
      self.progressBar.setNeedsDisplay()
    }
  }
  
  func progressBar(progressBar: ABSteppedProgressBar,
                   canSelectItemAtIndex index: Int) -> Bool {
    print("progressBar:canSelectItemAtIndex:\(index)")
    //Only next (or previous) step can be selected
    let offset = abs(progressBar.currentIndex - index)
    return (offset <= 1)
  }
  
  func progressBar(progressBar: ABSteppedProgressBar,
                   textAtIndex index: Int) -> String {
    let text: String
    switch index {
    case 0:
      text = "A"
    case 1:
      text = self._processIsDone ? "Done" : "B"
    case 2:
      text = "C"
    default:
      text = ""
    }
    print("progressBar:textAtIndex:\(index)")
    return text
  }
  
}
