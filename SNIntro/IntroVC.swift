//
//  IntroVC.swift
//  SNIntro
//
//  Created by suni on 2021/03/16.
//

import UIKit

/**
 # IntroVC.swift
 - Author: suni
 - Date:
 - Note: 인트로화면
*/
class IntroVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let time = DispatchTime.now() + 2.0
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.moveMain()
        }
    }
    
    
    
}

extension IntroVC {
    /**
     # moveMain
     - Author: suni
     - Date:
     - Note: 메인 화면 이동
    */
    func moveMain() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let transition: CATransition = CATransition()
            transition.duration = 0.4
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            transition.type = .fade
            appDelegate.navigationVC?.view.layer.add(transition, forKey: nil)
            
            appDelegate.navigationVC?.setViewControllers([vc], animated: false)
        }
        
    }
}
