

import SwiftUI

let Coordinator = CoordinatorService.instance

struct ContainerView : View {
    var view : AnyView
    
    init<V>(view: V) where V: View {
        self.view = AnyView(view)
    }
    
    var body: some View {
        view
    }
}

class CoordinatorService: ObservableObject {
    
    static let instance = CoordinatorService()

    @Published var container : ContainerView!
    
    private var stack  = [ContainerView]() {
        didSet {
            if let view = stack.last {
                withAnimation {
                    self.container = view
                }
            }
        }
    }
    
    private init() {
        self.push(view: MainView())
    }
    
    func pop() {
        guard self.stack.count > 1 else { return }
        self.stack.remove(at: self.stack.count - 1)
    }
    
    func push<V: View>(view: V) {
        let containered = ContainerView(view: view)
        self.stack += [containered]
    }
    
    func root() {
        self.stack.removeAll()
        self.push(view: MainView())
    }
    
}
