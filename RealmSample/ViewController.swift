//
//  ViewController.swift
//  RealmSample
//
//  Created by David Yoon on 2021/08/31.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return button
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.layer.borderWidth = 2.0
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(loadAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addButton)
        //view.addSubview(saveButton)
        view.addSubview(loadButton)
        
        addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        addButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loadButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 5).isActive = true
        loadButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        loadButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    @objc func addAction() {
        let dateSelected = TestRealm()
        dateSelected.title = "title test"
        dateSelected.contents = "contents Test"
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(dateSelected)
        }
    }
    
    @objc func loadAction() {
        let realm = try! Realm()
        let savedData = realm.objects(TestRealm.self)
        print(savedData)
        
        
    }

    

}

