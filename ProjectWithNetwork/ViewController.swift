//
//  ViewController.swift
//  ProjectWithNetwork
//
//  Created by Daryna Polevyk on 16.06.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingleTon.shared.arrayText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let message = SingleTon.shared.arrayText[indexPath.row]
        cell.labelForCell.text = message.text
        
        if message.sender == .Server {
            cell.backgroundColor = .blue
            cell.labelForCell.textColor = .white
            cell.labelForCell.textAlignment = .right
        }
        
        return cell
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        let message = Message(text: textField.text!, sender: .Darina) // v objecte "Hello", .Darina
        SingleTon.shared.arrayText.append(message)
        
        print(SingleTon.shared.arrayText)
        
        tableView.reloadData()
        textField.text = ""
        
        let networkManager = NetworkManager()
        networkManager.get { array in
            let text = array.joined(separator: " ")
            print(text)
            let message = Message(text: text, sender: .Server)
            SingleTon.shared.arrayText.append(message)
            print("Array fromST \(SingleTon.shared.arrayText)")
            DispatchQueue.main.async { //main potok
                 self.tableView.reloadData()
            }
        }
    }
    
}

