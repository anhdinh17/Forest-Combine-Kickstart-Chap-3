import FarFarAway

class Link {
    private let state = State()
    @Published private(set) var contents: String? = "..."
    
    init() {
        contentsSubscription()
    }
}

extension Link {
    func contentsSubscription() {
        // Receive the Notificatioin from State class
        NotificationCenter.default
            // Using Combine to ask for a Publisher
            .publisher(for: valueUpdate,
                       object: state)
            // .publisher above publishes a Notification
            // cast it down to State type
            // Till this point, .compactMap will publish a State object
            .compactMap { notification in
                notification.object as? State
            }
            .map(\.value) // Publish Int
            .assignDescription(asOptionalTo: &$contents) // Subscriber
    }
}

extension Link {
    func next() {
        state.next()
    }
}
