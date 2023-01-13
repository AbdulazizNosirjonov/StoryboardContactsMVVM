
import Foundation

class EditViewModel {
    
    var controller: BaseViewController!
    
    func apiContactEdit(contact: Contact, handler: @escaping (Bool) -> Void){
        AFHttp.put(url: AFHttp.API_POST_UPDATE + contact.id!, params: AFHttp.paramsContactUpdate(contact: contact)) { response in
            switch response.result {
            case.success:
                print(response.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        }
    }
}
