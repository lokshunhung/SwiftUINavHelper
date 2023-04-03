import CasePaths
import SwiftUI

extension Binding {
    func map<R, T>(casePath: CasePath<R, T>) -> Binding<T?> where Value == R? {
        Binding<T?>(get: {
            self.wrappedValue.flatMap(casePath.extract(from:))
        }, set: { newValue in
            self.wrappedValue = newValue.map(casePath.embed(_:))
        })
    }
}
