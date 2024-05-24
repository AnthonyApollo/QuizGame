extension Dictionary {
    static func from<S: Sequence, K: Hashable>(_ sequence: S, keyPath: KeyPath<S.Element, K>) -> [K: S.Element] {
        var dictionary = [K: S.Element]()
        for element in sequence {
            let key = element[keyPath: keyPath]
            dictionary[key] = element
        }
        return dictionary
    }
}
