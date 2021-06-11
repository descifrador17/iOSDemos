import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//MARK: - Publisher Example
public func publisherExample(){
    print("---Publisher Example---")
    let myNotification = Notification.Name("myNotification")
    
    let center = NotificationCenter.default
    
    let _ = center.publisher(for: myNotification,object: nil)

    let observer = center.addObserver(forName: myNotification, object: nil, queue: nil, using: {
        notification in
            print("Notification Received")
    })
    
    center.post(name: myNotification,object: nil)
    
    center.removeObserver(observer)
    print()
}

publisherExample()

//MARK: - Subscriber Example
public func subscriberExample(){
    print("---Subscriber Example---")
    let myNotification = Notification.Name("myNotification")

    let center = NotificationCenter.default

    let publisher = center.publisher(for: myNotification, object: nil)

    let subscription = publisher.sink(receiveValue: { _ in
        print("Notification received from publisher")
    })
    center.post(name: myNotification,object: nil)
    
    subscription.cancel()
    print()
}

subscriberExample()

//MARK: - Just Example
public func justExample(){
    print("---Just Example---")
    let just = Just("Hello World")
    _ = just.sink(receiveCompletion: {
        print("Completion", $0)
    }, receiveValue: {
        print("Value",$0)
    })
    print()
}

justExample()

//MARK: - Assign Example
public func assignExample(){
    print("---Assign Example---")
    
    
    class SomeObject{
        var value: String = ""{
            didSet{
                print(value)
            }
        }
    }
    
    let object = SomeObject()
    
    let publisher = ["Hello","World"].publisher
    
    let _ = publisher.assign(to: \.value, on: object)
    
    print()
    
}

assignExample()



//MARK: - Future Example
print("---Future Example---")
func futureIncrement(integer: Int, delay: TimeInterval) -> Future<Int,Never>{
    Future<Int, Never>{promise in
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: {
            promise(.success(integer+1))
        })
    }
}

let future = futureIncrement(integer: 1, delay: 3)
future.sink(
    receiveCompletion: {print("Future ",$0)},
    receiveValue: {print("Future ",$0)}
)
.store(in: &subscriptions)

print(subscriptions)

//MARK: - PassthroughSubject Example
print("---PassthroughSubject Example---")

enum MyError: Error{
    case test
}

class StringSubscriber: Subscriber{
    typealias Input = String
    
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Received Completeion: ",completion)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value: ",input)
        
        return input == "World" ? .max(1) : .none
    }

}


let subscriber = StringSubscriber()

let subject = PassthroughSubject<String, MyError>()

subject.subscribe(subscriber)

let subscription = subject .sink(
    receiveCompletion: { completion in
      print("Received completion (sink)", completion)
    },
    receiveValue: { value in
      print("Received value (sink)", value)
    }
)

subject.send("Hello")
subject.send("World")

subscription.cancel()
subject.send("THEEEEREEE?????")

subject.send(completion: .failure(MyError.test))

subject.send(completion: .finished)
subject.send("How about another one?")


//MARK: - Dynamically Adjusting Demand Example
print("---Dynamically Adjusting Demand Example Example---")

final class DynamicIntSubscriber: Subscriber {
    
    typealias Input = Int
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
        
    }

    func receive(_ input: Int) -> Subscribers.Demand {
        print("Received value", input)
        switch input {
        case 1:
            return .max(2) //Max subscribers -> 4 = Prev 2 + New 2
        case 3:
            return .max(1) //Max subscribers -> 5 = Prev 4 + New 1
        default:
            return .none //Max subscribers -> 5 = Prev 5 + New 0
        
        }
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion", completion)
        
    }
}
    
let dynamicSubscriber = DynamicIntSubscriber()
    
let dynamicSubject = PassthroughSubject<Int, Never>()
dynamicSubject.subscribe(dynamicSubscriber)
    
dynamicSubject.send(1)
dynamicSubject.send(2)
dynamicSubject.send(3)
dynamicSubject.send(4)
dynamicSubject.send(5)
dynamicSubject.send(6)


