//
//  CreateViewController.swift
//  StoryboardContacts
//
//  Created by Abdulaziz Nosirjonov on 16/02/22.
//

import UIKit

class CreateViewController: BaseViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var redLbl: UILabel!
    
    var viewModel = CreateViewModel()
    var contact: Contact = Contact(name: "", number: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.controller = self
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if nameTF.text!.isEmpty || numberTF.text!.isEmpty {
            redLbl.isHidden = false
        } else {
            contact.name = nameTF.text
            contact.number = numberTF.text
            viewModel.apiContactCreate(contact: contact, handler: {isCreated in
                if isCreated{
                    print("Created")
                }
            })
            navigationController?.popViewController(animated: true)
        }
    }
    
}
