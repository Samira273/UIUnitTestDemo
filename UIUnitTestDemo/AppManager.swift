//
//  AppManager.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 27/06/2021.
//

import Foundation
import UIKit

class AppManager: NSObject {
    
    static let shared: AppManager = AppManager()

    private(set) var window: UIWindow?
    //swiftlint:disable force_try
    
    static func launchApp(_ application: UIApplication) {
        if #available(iOS 13, *) {
            // use UICollectionViewCompositionalLayout
            //Scene Delegate will call  initWindow(windowScene: UIWindowScene)
        } else {
            initWindow()
        }
    }
    
    static private func initWindow() { //for ios less than 13
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = Container.getSplashScene()
        window.makeKeyAndVisible()
        self.shared.window = window
    }
    
    static func initWindow(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = Container.getSplashScene()
        window.makeKeyAndVisible()
        self.shared.window = window
    }
    
    func setWindowRoot(_ viewController: UIViewController) {
        self.window?.rootViewController = viewController
    }

}
