//
//  DateRealm.swift
//  RealmSample
//
//  Created by David Yoon on 2021/08/31.
//

import Foundation
import RealmSwift

class TestRealm: Object {
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
}
