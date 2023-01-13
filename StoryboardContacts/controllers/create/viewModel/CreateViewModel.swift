import Foundation


class CreateViewModel {
    
    var controller: BaseViewController!
    
    func apiContactCreate(contact: Contact, handler: @escaping (Bool) -> Void){
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsContactCreate(contact: contact)) { response in
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
