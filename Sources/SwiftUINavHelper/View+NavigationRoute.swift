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

private struct NavigationRouteModifier<Value, Destination: View>: ViewModifier {
    let binding: Binding<Value?>
    let destination: (Binding<Value>) -> Destination

    func body(content: Content) -> some View {
        content.background(
            NavigationLink(
                isActive: binding.isActive(),
                destination: {
                    if let unwrappedBinding: Binding<Value> = Binding(binding) {
                        destination(unwrappedBinding)
                    }
                },
                label: { EmptyView() }
            )
        )
    }
}
