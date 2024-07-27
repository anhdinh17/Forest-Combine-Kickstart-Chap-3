import Combine

public class State {
    private var model = Model() {
        didSet {
            // publish changes
            subject.send(model.value)
        }
    }
    
    // Create a publisher with SUBJECT way
    // It has initial value of 0 - it's a MUST to have initial value
    public var subject = CurrentValueSubject<Int, Never>(0)
    
    /** ---NOTE---
     - Using PassthroughSubject
     - It doens't have current value, which is initial value.
     - It only publishes the change, not current value. So when we run the app, it doesn't
     publish any initial value => "contents" in Link will receive nothing from state.subject
     => "contents" is ... initially.
     */
    //public var subject = PassthroughSubject<Int, Never>()
    
    public init() {}
}

extension State {
    public func next() {
        model = model.next
    }
}
