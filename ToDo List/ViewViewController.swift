//
//  ViewViewController.swift
//  ToDo List
//
//  Created by skynet on 3/1/22.
//
import RealmSwift
import UIKit

class ViewViewController: UIViewController {

    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?

    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!

    static let dateFormater: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from: item! .date)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }

    @objc private func didTapDelete() {
        guard let item = self.item else {
            return
        }




        // Do any additional setup after loading the view.
    }
    
}
