import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//MARK: - Publisher Example
public func publisherExample(){
    let myNotification = Notification.Name("myNotification")
    
    let center = NotificationCenter.default
    
    let _ = center.publisher(for: myNotification,object: nil)

    let observer = center.addObserver(forName: myNotification, object: nil, queue: nil, using: {
        notification in
            print("Notification Received")
    })
    
    center.post(name: myNotification,object: nil)
    
    center.removeObserver(observer)
}

publisherExample()

//MARK: - Subscriber Example
//public func subscriberExample(){
//    let integers = (0...4)
//    let _ = integers.publisher.sink(receiveValue: { _ in
//        print("Hello")
//    })
//
////    let myNotification = Notification.Name("myNotification")
////
////    let center = NotificationCenter.default
////
////    let publisher = center.publisher(for: myNotification, object: nil)
////
////    let _ = publisher.sink(receiveValue: { _ in
////        print("Notification received from publisher")
////    })
//}

//subscriberExample()

//MARK: - Just Example
public func justExample(){
    let just = Just("Hello World")
    _ = just.sink(receiveCompletion: {
        print("Completion", $0)
    }, receiveValue: {
        print("Value",$0)
    })
}

justExample()
