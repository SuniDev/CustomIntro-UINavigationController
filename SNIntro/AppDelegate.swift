//
//  AppDelegate.swift
//  SNIntro
//
//  Created by suni on 2021/03/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var navigationVC: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Root Navigation 초기화
        self.initNavigationVC()
        
        return true
    }
    
}
// MARK: - Navigation
extension AppDelegate {
    /**
     # initNavigationVC
     - Author: suni
     - Date:
     - Note: Root Navigation 초기화
    */
    func initNavigationVC() {
        self.navigationVC = UINavigationController()
        self.navigationVC?.isNavigationBarHidden = true
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Intro", bundle: nil)
        let introVC = storyBoard.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
        self.navigationVC?.setViewControllers([introVC], animated: false)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationVC
        self.window!.makeKeyAndVisible()
    }
}
