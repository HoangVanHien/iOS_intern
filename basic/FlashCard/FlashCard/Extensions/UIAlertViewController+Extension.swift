//
//  UIAlertViewController+Extension.swift
//  iseten_ios
//
//  Created by hurricane on 6/2/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

typealias SystemAlertButtonData = (title: String, style: UIAlertAction.Style, handler: (() -> Void)?)

extension UIAlertController {
    
    static func showError(message: String? = nil, tittle: String = "") {
        show(message: message, title: tittle)
    }
    
    static func showErrorWithErrorApi(_ error: Error? = nil, errorApi: ErrorApi?) {
        LoadingHud.hide()
        guard let errorApi = errorApi else {
            showError(message: error?.localizedDescription)
            return
        }
        let fullMessage = (errorApi.message ?? "") + "\n" + "(error_code: \(errorApi.code ?? ""))"
        if errorApi.code == "E102" || errorApi.code == "E115" {
            Helpers.deleteUser(fullMessage)
        } else {
            show(message: fullMessage, title: "")            
        }
    }
    
    static private func show(message: String? = nil, title: String? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(action)
        UIViewController.top()?.present(alertController, animated: true)
    }
    
    static func showSystemAlert(target: UIViewController? = UIViewController.top(),
                                title: String? = nil,
                                message: String? = nil,
                                buttons: [String],
                                buttonStyles: [UIAlertAction.Style?] = [],
                                handler: ((_ index: Int, _ title: String) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.enumerated().forEach { button in
            var buttonStyle: UIAlertAction.Style = .default
            if button.offset < buttonStyles.count, let style = buttonStyles[button.offset] {
                buttonStyle = style
            }
            
            let action = UIAlertAction(title: button.element, style: buttonStyle, handler: { _ in
                handler?(button.offset, button.element)
            })
            alert.addAction(action)
        }
        target?.present(alert, animated: true)
    }
    
    static func showActionSheets(target: UIViewController? = UIViewController.top(),
                                 title: String? = nil,
                                 message: String? = nil,
                                 buttons: [String],
                                 buttonStyles: [UIAlertAction.Style?] = [],
                                 buttonColors: [UIColor?] = [],
                                 handler: ((_ index: Int, _ title: String) -> Void)? = nil) {
        
        let actions = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        buttons.enumerated().forEach { button in
            var buttonStyle: UIAlertAction.Style = .default
            var buttonColor: UIColor = .systemBlue
            if button.offset < buttonStyles.count, let style = buttonStyles[button.offset] {
                buttonStyle = style
            }
            if button.offset < buttonColors.count, let color = buttonColors[button.offset] {
                buttonColor = color
            }
            let action = UIAlertAction(title: button.element, style: buttonStyle, handler: { _ in
                handler?(button.offset, button.element)
            })
            action.setValue(buttonColor, forKey: "titleTextColor")
            actions.addAction(action)
        }
        target?.present(actions, animated: true)
    }
}
