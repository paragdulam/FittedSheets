//
//  UIViewControllerExtension.swift
//  FittedSheets
//
//  Created by Gordon Tucker on 8/28/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

extension UIViewController {
    /// The sheet view controller presenting the current view controller heiarchy (if any)
    @objc public var sheetViewController: SheetViewController? {
        var parent = self.parent
        while let currentParent = parent {
            if let sheetViewController = currentParent as? SheetViewController {
                return sheetViewController
            } else {
                parent = currentParent.parent
            }
        }
        return nil
    }
}

extension SheetViewController {
    
    @objc public var sheetChildViewController: UIViewController {
        return childViewController
    }
    
    @objc public var canDismissSheetManually: Bool {
        return dismissOnPull && dismissOnOverlayTap
    }
}

#endif // os(iOS) || os(tvOS) || os(watchOS)
