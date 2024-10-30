import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            OnboardingIntro()  // Show your custom view here
        }
        .navigationBarHidden(true)  // Hide the navigation bar for a cleaner look
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
