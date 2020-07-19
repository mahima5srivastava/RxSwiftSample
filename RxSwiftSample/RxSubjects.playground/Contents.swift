import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

//MARK: - Publish Subjects
let subject = PublishSubject<String>()
subject.onNext("First")
subject.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
subject.onNext("Second")
subject.onNext("Third")
subject.onCompleted()
subject.onNext("Fourth")


let subject2 = PublishSubject<Int>()
subject2.onNext(1)
subject2.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
subject2.onNext(2)
subject2.onNext(3)
subject2.dispose()
subject2.onCompleted()
subject2.onNext(4)

print("**********************************************")

//Behaviour Subject

let behaviourSubject = BehaviorSubject(value: "Initial Value")
behaviourSubject.onNext("Second Value")
behaviourSubject.onNext("Third Value")
behaviourSubject.onNext("Fourth Value")
behaviourSubject.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
behaviourSubject.onNext("Fifth Value")
print("**********************************************")

//Replay Subject

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("Issue 1")
replaySubject.onNext("Issue 2")
replaySubject.onNext("Issue 3")
print("Subscription 1")
replaySubject.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
replaySubject.onNext("Issue 4")
replaySubject.onNext("Issue 5")
replaySubject.onNext("Issue 6")
print("Subscription 2")
replaySubject.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
print("**********************************************")

//Variables - Deprecated

let variable = Variable("Initial Value")
variable.value = "Updated Value"
variable.asObservable().subscribe { event in
    print(event)
}.disposed(by: disposeBag)
print("**********************************************")

//Behaviour Relay

let behaviorRelay = BehaviorRelay(value: "Initial Value")

behaviorRelay.asObservable().subscribe {
    print($0)
}.disposed(by: disposeBag)
behaviorRelay.accept("Updated Value")
print("**********************************************")


//Behaviour Relay with Array

let relayArray = BehaviorRelay(value: [Int]())

relayArray.asObservable().subscribe {
    print($0)
}.disposed(by: disposeBag)
relayArray.accept([1])
relayArray.accept([2]) // 1st value is lost by using accept
relayArray.accept(relayArray.value + [3])
relayArray.accept(relayArray.value + [4,5] + [6])
var existingValue = relayArray.value
existingValue.append(7)
existingValue.append(8)
relayArray.accept(existingValue)
print("**********************************************")
