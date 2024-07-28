import Combine

public class State: ObservableObject {
    @Published private var model = Model()
    
    // Create a publisher with SUBJECT way
    // It has initial value of 0 - it's a MUST to have initial value
    //public var subject = CurrentValueSubject<Int, Never>(0)
    
    /** ---NOTE---
     - Using PassthroughSubject
     - It doens't have current value, which is initial value.
     - It only publishes the change, not current value. So when we run the app, it doesn't
     publish any initial value => "contents" in Link will receive nothing from state.subject
     => "contents" is ... initially.
     */
    //public var subject = PassthroughSubject<Void, Never>()
    
    public init() {}
}

extension State {
    public var value: Int {
        model.value
    }
    
    public func next() {
        model = model.next
    }
}
