import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()
print("\nStart with \n")
Observable.of(2,3,4).startWith(1).subscribe(onNext: {print($0)}).disposed(by: disposeBag)

print("\nConcat \n")
let numbers1 = Observable.of(1,2,3,4,5)
let numbers2 = Observable.of(6,7,8,9)
numbers1.concat(numbers2).subscribe(onNext: {print($0)}).disposed(by: disposeBag)

print("\nMerge \n")
//Combines in the order of occurence
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()
let source = Observable.of(left.asObservable(), right.asObservable())
let observable = source.merge()
observable.subscribe(onNext: {
    print($0)
    }).disposed(by: disposeBag)
left.onNext(1)
left.onNext(10)
right.onNext(2)
right.onNext(20)
left.onNext(100)

print("\nCombine latest\n")

