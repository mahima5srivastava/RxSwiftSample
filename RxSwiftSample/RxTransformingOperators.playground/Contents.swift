import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5).subscribe(onNext: { print($0)}).disposed(by: disposeBag)

print("\nTo Array Operator\n")
Observable.of(1,2,3,4,5).toArray().subscribe(onNext: { print($0)}).disposed(by: disposeBag)

print("\nMap Operator\n")
Observable.of(1,2,3,4,5).map {$0 * 2}.subscribe(onNext: {print($0)}).disposed(by: disposeBag)

print("\nFlat Map\n")
struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 80))
let mary = Student(score: BehaviorRelay(value: 90))
let student = PublishSubject<Student>()
student.asObservable().flatMap{$0.score}.subscribe(onNext: { print($0) }).disposed(by: disposeBag)
student.onNext(john)
john.score.accept(50)
john.score.accept(70)
student.onNext(mary)
mary.score.accept(100)
john.score.accept(60)
student.onCompleted()
print("\nFlat Map Latest \n")

let john1 = Student(score: BehaviorRelay(value: 41))
let mary1 = Student(score: BehaviorRelay(value: 91))
let studentLatest = PublishSubject<Student>()
studentLatest.asObservable().flatMapLatest{$0.score}.subscribe(onNext: { print($0) }).disposed(by: disposeBag)
studentLatest.onNext(john1)
john1.score.accept(51)
studentLatest.onNext(mary1)
mary1.score.accept(81)
john1.score.accept(61) // this is not observed in flat map

