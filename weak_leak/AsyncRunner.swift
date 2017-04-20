import Foundation


class AsyncRunner {
    
    func doSomething() {
        print("doSomething")
    }
    
    func runAsyncBad(wait: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(wait), execute: {[weak self] in
            if let sself = self {
                sself.doSomething()
            }
        })
    }
    
    func runAsyncGood(wait: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(wait), execute: {
            self.doSomething()
        })
    }
    
    deinit {
        print("AsyncRunner deinit");
    }
}


