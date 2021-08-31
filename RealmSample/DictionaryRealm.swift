//
//  DictionaryRealm.swift
//  RealmSample
//
//  Created by David Yoon on 2021/08/31.
//

import Foundation
import RealmSwift

class DictionaryRealm: Object {
    @objc dynamic var stringDate = ""
    var todolists = List<Todo>()
}


class Todo: Object {
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
}
