# RealmSample
### RealmSWIFT 정리
1. RealmSWIFT 란 ?
+ 오픈소스로 제공되는 모바일 데이터베이스 관리 라이브러리
+ 클래스 단위로 Table이 생성되고, 객체 단위로 row가 구성된다.

2. Install
+ using cocoapod
+ pop 'RealmSwift'

3. 모델 생성 
+ import RealmSwift
+ class DictionaryRealm: Object {
    @objc dynamic var date = ""
    var todoList = List<Todo>() // Realm 은 배열 선언을 할때 List로 해야한다, NSArray is not supported as an RLMObject property
}

+ class Todo: Object {
    @objc dynamic var title = ""
    @objc dynamic var contents = "" 
}

4. 저장 
+ let dataToSave = DictionaryRealm() // 저장 할 모델 선언
+ dataToSave.date = "today" // 데이터 set
+ let todo = Todo() // 추가할 todo set
+ todo.title = "title"
+ todo.contents = "contens"
+ dataToSave.todoList.append(todo) 
+ try! realm.write { // realm.write로 저장
    realm.add(dataToSave) // realm.add()로 데이터 추가 
}
+ 불러온 Realm 데이터를 write외부 에서 수정할 시 에러 발생

5. 로드
+ let realm = try! Realm() // realm 객체 선언 
+ let savedData = realm.objects(DictionaryRealm.self).filter("date='today'") // realm 오브젝트 형태로 filter에 맞게 불러옴
+ saveData.isEmpty // 데이터 비어있는지 확인
+ saveData.first.todoList // todoList 확인

6. 삭제
+ try! realm.write {
    realm.delete(item)
}
7. 업데이트
+ try! realm.write {
    updateItem.titlt = "newTitle"
}
