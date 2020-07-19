import RxSwift
let disposeBag = DisposeBag()
Observable.of("A", "B", "C")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("**********************************************")

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("B") //Never Printed
    return Disposables.create()
    }.subscribe(onNext: {print($0)}, onError: {print($0)}, onCompleted: {print("Completed")}, onDisposed: {print("Disposed")})
.disposed(by: disposeBag)


//Subjects
