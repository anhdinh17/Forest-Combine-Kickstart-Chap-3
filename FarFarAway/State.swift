// Name the Notification
public let valueUpdate = Notification.Name(rawValue: "valueUpdate")

public class State {
    private var model = Model() {
        didSet {
            // Post a Notification when there's a change of "model"
            NotificationCenter.default.post(Notification(name: valueUpdate,
                                                         object: self))
        }
    }
    
    public init() {}
}

extension State {
    // Making value observable
    @objc dynamic public var value: Int {
        model.value
    }
    
    public func next() {
        model = model.next
    }
}
