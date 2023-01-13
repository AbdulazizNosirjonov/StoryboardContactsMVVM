//
//  EditViewController.swift
//  StoryboardContacts
//
//  Created by Abdulaziz Nosirjonov on 16/02/22.
//

import UIKit

class EditViewController: BaseViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var redLbl: UILabel!
    
    var contact: Contact = Contact(name: "", number: "")
    var viewModel = EditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        nameTF.text = contact.name
        numberTF.text = contact.number
    }
    
    func bindViewModel() {
        viewModel.controller =  self
    }
    
    @IBAction func editTapped(_ sender: Any) {
        if nameTF.text!.isEmpty || numberTF.text!.isEmpty {
            redLbl.isHidden = false
        }else{
            contact.name = nameTF.text
            contact.number = numberTF.text
            viewModel.apiContactEdit(contact: contact, handler: { isEdited in
                if isEdited {
                    print("edited")
                }
            })
            dismiss(animated: true)
        }
    }
}
