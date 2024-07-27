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
            .subject
            // In this case, .subject published nothing (Void)
            // .map to make this a Publisher of Int
            .map{ [weak self] _ in
                self?.state.value ?? 0
            }
            .assignDescription(asOptionalTo: &$contents)
    }
}

extension Link {
    func next() {
        state.next()
    }
}
