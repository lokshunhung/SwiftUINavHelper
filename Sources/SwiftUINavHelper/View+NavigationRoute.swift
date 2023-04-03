import SwiftUI

extension View {
    public func navigationRoute<T>(
        for binding: Binding<T?>,
        @ViewBuilder destination: @escaping (Binding<T>) -> some View
    ) -> some View {
        self.modifier(NavigationRouteModifier(
            binding: binding,
            destination: destination
        ))
    }
}
