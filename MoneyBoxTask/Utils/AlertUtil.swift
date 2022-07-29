//
//  AlertUtil.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class AlertUtil {
    public static func showStandardAlert(parentController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: .local(.ok), style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    alertController.dismiss(animated: true, completion: nil)
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
    
    public static func showStandardAlertWithCompletion(parentController: UIViewController, title: String, message: String, completion: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: .local(.ok), style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    completion()
                    alertController.dismiss(animated: true, completion: nil)
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
    
    public static func showStandardAlertWithOptions(parentController: UIViewController, title: String, message: String, firstOptionTitle: String, secondOptionTitle: String, firstOptionAction: @escaping (() -> Void), secondOptionAction: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: firstOptionTitle, style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    firstOptionAction()
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        alertController.addAction(UIAlertAction(title: secondOptionTitle, style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    secondOptionAction()
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
    
    public static func showStandardAlertAndGoBack(parentController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: .local(.ok), style: .default, handler: { (action) in
            switch action.style {
            case .default:
                alertController.dismiss(animated: true, completion: nil)
                parentController.navigationController?.popViewController(animated: true)
            case .cancel:
                break
            case .destructive:
                break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
    
    public static func showStandardAlertWithAction(parentController: UIViewController, title: String, message: String, optionAction: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: .local(.ok), style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    optionAction()
                    alertController.dismiss(animated: true, completion: nil)
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
}
