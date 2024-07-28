import FarFarAway

class Link: ObservableObject {
    private let state = State()
    @Published private(set) var contents: String = "Starting Value"
    
    init() {
        contentsSubscription()
    }
}

extension Link {
    func contentsSubscription() {
        state.valuePublisher // Subscribe to valuePublisher
            .assignDescription(to: &$contents)
    }
}

extension Link {
    func next() {
        state.next()
    }
}
