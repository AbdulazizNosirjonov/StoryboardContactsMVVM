import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.apiContactList()
    }

    // MARK: - Navigation
    
    func initViews(){
        tableView.dataSource = self
        tableView.delegate = self
        initNavigation()
        bindViewModel()
        viewModel.apiContactList()
    }
    
    func bindViewModel() {
        viewModel.controlleer = self
        viewModel.items.bind(to: self){strongSelf, _ in
            strongSelf.tableView.reloadData()
        }
    }
    
    func initNavigation(){
        let refresh = UIImage(named: "ic_refresh")
        let add = UIImage(named: "ic_add")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: refresh, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        
        title = "Storyboard Contacts"
    }
    
    func callCreateViewController(){
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func callEditViewController(contact: Contact){
        let vc = EditViewController(nibName: "EditViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: vc)
        vc.contact = contact
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - Action
    
    @objc func leftTapped(){
        viewModel.apiContactList()
    }
    
    @objc func rightTapped(){
        callCreateViewController()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items.value[indexPath.row]
        let cell = Bundle.main.loadNibNamed("ContactsTableViewCell", owner: self, options: nil)?.first as! ContactsTableViewCell
        
        
        cell.nameLabel.text = item.name
        cell.numberLabel.text = item.number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [makeCompleteContextulaAction(forRowAt: indexPath, contacts: viewModel.items.value[indexPath.row])])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [makeDeleteContextulaAction(forRowAt: indexPath, contact: viewModel.items.value[indexPath.row])])
    }
    
    // MARK: - Contextual Action
    
    private func makeDeleteContextulaAction(forRowAt indexPath: IndexPath, contact: Contact) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView, completion) in
            print("DELETE HERE")
            completion(true)
            self.viewModel.apiContactDelete(contact: contact, handler: {isDeleted in
                if isDeleted {
                    print("Deleted")
                    self.viewModel.apiContactList()
                }
            })
        }
    }
    
    private func makeCompleteContextulaAction(forRowAt indexPath: IndexPath, contacts: Contact) -> UIContextualAction {
        return UIContextualAction(style: .normal, title: "Edit") { (action, swipeButtonView, completion) in
            print("COMPLETE HERE")
            completion(true)
            self.callEditViewController(contact: contacts)
        }
    }
}
