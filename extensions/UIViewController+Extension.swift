//
//  UIViewController+Extension.swift
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import UIKit

extension NSObject {

    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}


// MARK: Keyboard Notifications

@objc protocol Keyboardable: class {
        
    func keyboardDidShow()
    func keyboardDidHide()
}

extension Keyboardable where Self: UIViewController {
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }

}

// MARK: - Instance View Controllers

extension UIViewController {
    
    static func instantiateFromMainStoryboard() -> UIViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String( describing: self)) 
    }
    
    static func instantiate(fromStoryboardName name: String) -> UIViewController {
        return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: String( describing: self))
    }
    
    static func instantiate(fromStoryboardName name: String, bundle: Bundle) -> UIViewController {
        return UIStoryboard.init(name: name, bundle: bundle).instantiateViewController(withIdentifier: String( describing: self))
    }
    
    static func instantiateFromItsStoryboard() -> UIViewController {
        return UIStoryboard.init(name: "", bundle: nil).instantiateViewController(withIdentifier: String( describing: self))
    }
}


extension UIStoryboard {
    
    func instantiate(viewController vc: UIViewController) -> UIViewController {
        return instantiateViewController(withIdentifier: String(describing: vc.self))
    }
}


// MARK: - Frames

extension UIViewController {
    
    var statusBarFrame: CGRect {
        return view.window?.convert(UIApplication.shared.statusBarFrame, to: view) ?? CGRect.zero
    }
    
    var topBarHeight: CGFloat {
        var navBarHeight: CGFloat {
            guard let bar = navigationController?.navigationBar else { return 0 }
            return view.window?.convert(bar.frame, to: view).height ?? 0
        }
        let statusBarHeight = view.window?.convert(UIApplication.shared.statusBarFrame, to: view).height ?? 0
        return statusBarHeight + navBarHeight
    }
    
    
    /**
     While trying to present a new controller, current controller' bar may disappear temporary.
     But I still need the real height of top bar.
     - Why not set a constant (64.0 or 32.0)? Apple may change the constant in some device in the future.
     */
    func topBarHeightWhenTemporaryDisappear() -> CGFloat {
        let key = "kASTopBarHeightWhenTemporaryDisappear"
        if UserDefaults.standard.value(forKey: key) == nil {
            UserDefaults.standard.setValue(topBarHeight, forKey: key)
        }
        else if topBarHeight != 0 && topBarHeight != UserDefaults.standard.value(forKey: key) as! CGFloat {
            UserDefaults.standard.setValue(topBarHeight, forKey: key)
        }
        return UserDefaults.standard.value(forKey: key) as! CGFloat
    }
    
}

// MARK: - Dismiss view controller

extension UIViewController {
    
    @IBAction func dismissAnimated() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissWithoutAnimation() {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func popViewControllerAnimated() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popViewControllerWithoutAnimation() {
        _ = navigationController?.popViewController(animated: false)
    }
}

// MAEK: - Edge dismiss gesture

extension UIViewController {
    
    func configureScreenEdgeDismissGesture(_ edges: UIRectEdge = .left, animated: Bool = true, alsoForPad: Bool = false) {
        
        if UIDevice.current.userInterfaceIdiom == .pad && !alsoForPad { return }
        
        let selector = animated ? #selector(dismissAnimated) : #selector(dismissWithoutAnimation)
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: selector)
        gesture.edges = edges
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
}


// MARK: - Selector typealias

extension Selector {
    static let dismissAnimated = #selector(UIViewController.dismissAnimated)
    static let dismissWithoutAnimation = #selector(UIViewController.dismissWithoutAnimation)
    static let popViewControllerAnimated = #selector(UIViewController.popViewControllerAnimated)
    static let popViewControllerWithoutAnimation = #selector(UIViewController.popViewControllerWithoutAnimation)
}

import SafariServices
import MessageUI
//import Social

// MARK: Safari 

extension UIViewController: SFSafariViewControllerDelegate {
    
    func openSafariViewController(withURL url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true, completion: nil)
    }
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}
