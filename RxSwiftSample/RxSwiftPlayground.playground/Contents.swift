import RxSwift

//MARK: - Observales Iniatlizers

let obsJust = Observable.just(2) // type - Int
let obsFrom = Observable.from([1,2,3,4]) // type - Int
let obsOf = Observable.of(5,6,7,8,9) // type - Int
let obsOfArray = Observable.of([1,2,3], [4,5,6], [7], [8,9]) // type - [Int]

//MARK: - Subscriptions

//get events
obsJust.subscribe { event in
    print(event)
}
print("************************")
obsFrom.subscribe { event in
    print(event)
}
print("************************")
obsOf.subscribe { event in
    print(event)
}
print("************************")
obsOfArray.subscribe { event in
    print(event)
}
print("**********************************************")

//get actual values
obsJust.subscribe {event in
    if let element = event.element {
        print(element)
    }
}
print("************************")
obsFrom.subscribe {event in
    if let element = event.element {
        print(element)
    }
}
print("************************")
obsOf.subscribe {event in
    if let element = event.element {
        print(element)
    }
}
print("************************")

obsOfArray.subscribe {event in
    if let element = event.element {
        print(element)
    }
}

print("**********************************************")

//On Next event

obsJust.subscribe(onNext : { element in
    print(element)
})
print("************************")
obsFrom.subscribe(onNext : { element in
    print(element)
})
print("************************")
obsOf.subscribe(onNext : { element in
    print(element)
})
print("************************")
obsOfArray.subscribe(onNext : { element in
    print(element)
})

print("**********************************************")

//MARK: - Dispose Subscription

let subscription = obsOfArray.subscribe(onNext : { element in
    print(element)
})
subscription.dispose()


