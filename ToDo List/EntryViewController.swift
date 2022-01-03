//
//  EntryViewController.swift
//  ToDo List
//
//  Created by skynet on 3/1/22.
//
import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!

    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
        textField.delegate = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(didTapSaveButton))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton() {
        if let text = textField.text, !text.isEmpty {
            let date = datePicker.date

            try! realm.write {
                let newItem = ToDoListItem()
                newItem.date = date
                newItem.item = text
                realm.add(newItem)
            }

//            realm.beginWrite()
//
//            let newItem = ToDoListItem()
//            newItem.date = date
//            newItem.item = text
//            realm.add(newItem)
//            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print("Add something")
        }
    }

}
