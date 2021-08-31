//
//  ViewController.swift
//  RealmSample
//
//  Created by David Yoon on 2021/08/31.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    private var todayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Today", for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(todayAction), for: .touchUpInside)
        return button
    }()
    
    private var tomorrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tomorrow", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tomorrowAction), for: .touchUpInside)
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
    
//    private var loadTomorrowButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("LoadTomorrow", for: .normal)
//        button.layer.borderWidth = 2.0
//        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(self, action: #selector(loadAction), for: .touchUpInside)
//        button.layer.borderColor = UIColor.gray.cgColor
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(todayButton)
        view.addSubview(tomorrowButton)
        view.addSubview(loadButton)
        
        todayButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        todayButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        todayButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        tomorrowButton.topAnchor.constraint(equalTo: todayButton.bottomAnchor, constant: 5).isActive = true
        tomorrowButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        tomorrowButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        tomorrowButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        loadButton.topAnchor.constraint(equalTo: tomorrowButton.bottomAnchor, constant: 5).isActive = true
        loadButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        loadButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    
    
    @objc func todayAction() {
        
        let realm = try! Realm()
        let savedData = realm.objects(DictionaryRealm.self).filter("stringDate='today'")
        if savedData.isEmpty {
            let dateSelected = DictionaryRealm()
            dateSelected.stringDate = "today"
            
            let todo = Todo()
            todo.title = "today Title"
            todo.contents = "today Contents"
            dateSelected.todolists.append(todo)
            print("first today data updated!")
            try! realm.write {
                realm.add(dateSelected)
            }
        }else {
            try! realm.write {
                let savedData = realm.objects(DictionaryRealm.self).filter("stringDate='today'")
                if savedData.isEmpty{
                    return
                }
                let todo = Todo()
                todo.title = "today Title"
                todo.contents = "today Contents"
                savedData.first?.todolists.append(todo)
                print("new today data updated!")
            }
        }
    }
    
    @objc func tomorrowAction() {
        let realm = try! Realm()
        let savedData = realm.objects(DictionaryRealm.self).filter("stringDate='tomorrow'")
        if savedData.isEmpty {
            let dateSelected = DictionaryRealm()
            dateSelected.stringDate = "tomorrow"
            
            let todo = Todo()
            todo.title = "tomorrow Title"
            todo.contents = "tomorrow Contents"
            dateSelected.todolists.append(todo)
            print("first tomorrow data updated!")
            try! realm.write {
                realm.add(dateSelected)
            }
        }else {
            try! realm.write {
                let savedData = realm.objects(DictionaryRealm.self).filter("stringDate='tomorrow'")
                if savedData.isEmpty{
                    return
                }
                let todo = Todo()
                todo.title = "tomorrow Title"
                todo.contents = "tomorrow Contents"
                savedData.first?.todolists.append(todo)
                print("new tomorrow data updated!")
            }
        }
    }
    
    
    @objc func loadAction(sender: UIButton) {
        
        if sender.currentTitle == "Load" {
            let realm = try! Realm()
            let savedData = realm.objects(DictionaryRealm.self)
            print(savedData)
        }
        
        
    }

    

}

