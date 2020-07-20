import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5).subscribe(onNext: { print($0)}).disposed(by: disposeBag)

Observable.of(1,2,3,4,5).toArray().subscribe(onNext: { print($0)}).disposed(by: disposeBag)

