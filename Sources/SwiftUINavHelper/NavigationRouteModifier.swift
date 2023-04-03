import SwiftUI

struct NavigationRouteModifier<Value, Destination: View>: ViewModifier {
    let binding: Binding<Value?>
    let destination: (Binding<Value>) -> Destination

    func body(content: Content) -> some View {
        content.background(
            NavigationLink(
                isActive: binding.isActive(),
                destination: {
                    if let unwrappedBinding: Binding<Value> = binding.toOptional() {
                        destination(unwrappedBinding)
                    }
                },
                label: { EmptyView() }
            )
        )
    }
}
