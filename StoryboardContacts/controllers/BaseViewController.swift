//
//  BaseViewController.swift
//  StoryboardContacts
//
//  Created by Abdulaziz Nosirjonov on 16/02/22.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {

    let hud = JGProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    func appDelegate() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func sceneDelegate() -> SceneDelegate{
        return ((UIApplication.shared.connectedScenes.first!.delegate as? SceneDelegate)!)
    }

    func showProgress(){
        if !hud.isVisible {
            hud.textLabel.text = "Loading"
            hud.show(in: self.view)
        }
    }
    
    func hireProgress(){
        if hud.isVisible {
            hud.dismiss()
        }
    }
    
//    func apiPostList(){
//        showProgress()
//        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
//            self.hireProgress()
//            switch response.result {
//            case .success:
//                let contacts = try! JSONDecoder().decode([Contact].self, from: response.data!)
//                self.refreshTableview(contacts: contacts)
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
//
//    func apiPostUpdate(contact: Contact){
//        showProgress()
//        AFHttp.put(url: AFHttp.API_POST_UPDATE + contact.id!, params: AFHttp.paramsEmpty(), handler: { response in
//            self.hireProgress()
//            switch response.result {
//            case.success:
//                print(response.result)
//                self.apiPostList()
//            case let .failure(error):
//                print(error)
//            }
//        })
//    }
}
