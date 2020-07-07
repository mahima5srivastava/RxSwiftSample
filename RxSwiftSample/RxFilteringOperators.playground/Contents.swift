import UIKit
import RxSwift

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

//Ignore elements operator  - Ignores elements, considers on complete
print("Ignore Element Operator")
strikes.ignoreElements().subscribe { _ in
    print("Subscription Called")
}.disposed(by: disposeBag)
strikes.onNext("Event 1")
strikes.onNext("Event 2")
strikes.onNext("Event 3")
strikes.onNext("Event 4")
strikes.onCompleted()

print("**********************************************")

//Element at operator
print("Element at Operator")
let subject = PublishSubject<String>()
subject.elementAt(2).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
subject.onNext("Event 1")
subject.onNext("Event 2")
subject.onNext("Event 3")
subject.onNext("Event 4")

print("**********************************************")

//Filter operator - filtering even numbers
print("Filter Operator")
let filterSubject = PublishSubject<Int>()
filterSubject.filter({$0 % 2 == 0}).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
filterSubject.onNext(1)
filterSubject.onNext(2)
filterSubject.onNext(3)
filterSubject.onNext(4)

print("**********************************************")

//Skip operator
print("Skip Operator")
let skipSubject = PublishSubject<Int>()
skipSubject.skip(2).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
skipSubject.onNext(1)
skipSubject.onNext(2)
skipSubject.onNext(3)
skipSubject.onNext(4)

print("**********************************************")

//Skip While operator
print("Skip while Operator")
let skipWhileSubject = PublishSubject<Int>()
skipWhileSubject.skipWhile({$0 % 2 == 0}).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
skipWhileSubject.onNext(1)
skipWhileSubject.onNext(2)
skipWhileSubject.onNext(3)
skipWhileSubject.onNext(4)

print("**********************************************")

//Skip Until operator
print("Skip Until Operator")
let skipUntilSubject = PublishSubject<Int>()
let trigger = PublishSubject<Int>()
skipUntilSubject.skipUntil(trigger).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
skipUntilSubject.onNext(1)
trigger.onNext(200) // any random value. it only needs trigger needs
skipUntilSubject.onNext(2)
skipUntilSubject.onNext(3)
skipUntilSubject.onNext(4)

print("**********************************************")

//Take operator

print("Take Operator")
let takeSubject = PublishSubject<Int>()
takeSubject.take(2).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
takeSubject.onNext(1)
takeSubject.onNext(2)
takeSubject.onNext(3)
takeSubject.onNext(4)
print("**********************************************")

//Take while operator

print("Take while Operator")
let takeWhileSubject = PublishSubject<Int>()
takeWhileSubject.takeWhile({$0 < 4}).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
takeWhileSubject.onNext(1)
takeWhileSubject.onNext(2)
takeWhileSubject.onNext(3)
takeWhileSubject.onNext(4)
print("**********************************************")

//Take until operator

print("Take until Operator")
let takeUnitilSubject = PublishSubject<Int>()
let trigger2 = PublishSubject<String>()
takeUnitilSubject.takeUntil(trigger2).subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)
takeUnitilSubject.onNext(1)
trigger2.onNext("X")
takeUnitilSubject.onNext(2)
takeUnitilSubject.onNext(3)
takeUnitilSubject.onNext(4)
