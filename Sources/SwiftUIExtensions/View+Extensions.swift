//
//  View+Extensions.swift
//  SwiftExtensions
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func eraseToAnyView() -> some View {
        AnyView(self)
    }
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func `if`<M>(_ condition: @autoclosure () -> Bool, _ modifier: M) -> some View where M: ViewModifier {
        if condition() {
            self.modifier(modifier)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func `if`<M1, M2>(_ condition: @autoclosure () -> Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        if condition() {
            self.modifier(trueModifier)
        } else {
            self.modifier(falseModifier)
        }
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func reverseMask<Content: View>(_ content: () -> Content) -> some View {
        self.overlay { content().mask(self) }
    }
}

// MARK: - RoundedCorner
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func cornerRadius(corners: UIRectCorner, _ radius: CGFloat) -> some View {
        clipShape( RoundedCorner(corners: corners, radius: radius) )
    }
}

// MARK: - RemoveBackgroundColor
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct RemoveBackgroundColor: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        Task { @MainActor in
            uiView.superview?.superview?.backgroundColor = .clear
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    func removeBackground(_ style: AnyShapeStyle) -> some View {
        background(RemoveBackgroundColor())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Rectangle()
                    .fill(style)
                    .ignoresSafeArea(.container, edges: .all)
            }
    }
}
