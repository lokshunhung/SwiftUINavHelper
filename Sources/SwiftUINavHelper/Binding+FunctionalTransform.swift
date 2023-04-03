import SwiftUI

extension Binding {
    /// converts `Binding<T?>` to `Binding<Bool>`
    func isActive<T>() -> Binding<Bool> where Value == Optional<T> {
        Binding<Bool>(get: {
            self.wrappedValue != nil
        }, set: { newValue in
            if !newValue { self.wrappedValue = nil }
        })
    }

    /// converts `Binding<Root>` to `Binding<Value>`
    /// by providing `WritableKeyPath<Root, Value>`
    func map<T>(keyPath: WritableKeyPath<Value, T>) -> Binding<T> {
        Binding<T>(get: {
            self.wrappedValue[keyPath: keyPath]
        }, set: { newValue in
            self.wrappedValue[keyPath: keyPath] = newValue
        })
    }

    /// converts `Binding<T?>` to `Binding<T>?`
    func toOptional<T>() -> Binding<T>? where Value == T? {
        self.wrappedValue.map({ wrappedValue in
            Binding<T>(get: {
                wrappedValue
            }, set: { newValue in
                self.wrappedValue = newValue
            })
        })
    }
}