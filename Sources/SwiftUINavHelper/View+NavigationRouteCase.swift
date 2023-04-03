import CasePaths
import SwiftUI

extension View {
    public func navigationRoute<Root, Value>(
        for binding: Binding<Root?>,
        when casePath: CasePath<Root, Value>,
        @ViewBuilder destination: @escaping (Binding<Value>) -> some View
    ) -> some View {
        self.modifier(NavigationRouteCaseModifier(
            binding: binding,
            casePath: casePath,
            destination: destination
        ))
    }
}

private struct NavigationRouteCaseModifier<Root, Value, Destination: View>: ViewModifier {
    let binding: Binding<Root?>
    let casePath: CasePath<Root, Value>
    let destination: (Binding<Value>) -> Destination

    func body(content: Content) -> some View {
        content.background(
            NavigationLink(
                isActive: binding.map(casePath: casePath).isActive(),
                destination: {
                    if let unwrappedBinding: Binding<Value> = binding.map(casePath: casePath).toOptional() {
                        destination(unwrappedBinding)
                    }
                },
                label: { EmptyView() }
            )
        )
    }
}
