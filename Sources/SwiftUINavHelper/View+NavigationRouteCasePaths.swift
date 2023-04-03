import CasePaths
import SwiftUI

extension View {
    public func navigationRoute<Root, Value>(
        for binding: Binding<Root?>,
        when casePath: CasePath<Root, Value>,
        @ViewBuilder destination: @escaping (Binding<Value>) -> some View
    ) -> some View {
        self.modifier(NavigationRouteModifier(
            binding: binding.map(casePath: casePath),
            destination: destination
        ))
    }
}
