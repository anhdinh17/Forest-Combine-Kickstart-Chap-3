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
        // Listen to state.subject
        // Initial value of subject is 0
        state
            .subject // Pub<Int,Never>
            .assignDescription(asOptionalTo: &$contents)
    }
}

extension Link {
    func next() {
        state.next()
    }
}
