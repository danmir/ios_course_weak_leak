import Foundation

class LyfecycleSimulator {
    var myRunners: [AsyncRunner] = []
    //let myRunners: NSMutableArray = []
    
    init() {}
    
    func createRunners(num: Int) {
        print("Creating \(num) AsyncRunners");
        for _ in 0..<num {
            let randSecond = randomInt(min: 5, max: 15)
            print("\(randSecond)")
            let newRunner = AsyncRunner()
            newRunner.runAsyncBad(wait: randSecond)
            myRunners.append(newRunner)
            //myRunners.append(newRunner)
        }
        print("AsyncRunners created");
    }
    
    func deleteRunners() {
        print("Deleting runners")
        for _ in 0..<myRunners.count {
            let randRunnerIndex = randomInt(min: 0, max: myRunners.count - 1)
            let randRunner = myRunners[randRunnerIndex]
            myRunners.remove(at: randRunnerIndex)
            //print(randRunner)
            //myRunners.removeLastObject()
        }
        print("Runners deleted")
    }
    
    func simulate() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.createRunners(num: 3)
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            self.deleteRunners()
        }
    }
}
