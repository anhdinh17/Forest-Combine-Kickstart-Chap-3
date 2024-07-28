import Combine

public class State {
    @Published private var model = Model()
    
    //MARK: - Subjects
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
    
    //MARK: - Custom Publisher property
    // Create a Publisher that publishes Int
    // This publisher listens to $model.
    // Then it publishes value to whoever subscribe to it
    lazy public private(set) var valuePublisher: AnyPublisher<Int, Never>
    = $model
        .dropFirst()
        .map(\.value)
        // Fix the mismatch Type
        // .map returns a publisher of Publishers.MapKeyPath<Publishers.Drop<Published<Model>.Publisher>, Int>.
        // But what we want is AnyPublisher
        .eraseToAnyPublisher()
    
    public init() {}
}

extension State {
    
    public func next() {
        model = model.next
    }
}
