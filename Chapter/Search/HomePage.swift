import SwiftUI

struct HomePage: View {
    @State private var dotCount = 0
    @State private var searchText = ""
    @State private var isEditing = false
    @State private var displayedText = ""
    @State private var currentPhraseIndex = 0

    let examplePhrases = [
        "likes fishing and was in a fraternity",
        "wants to learn yoga",
        "is working on growing a personal brand"
    ]

    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.04)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    HStack(spacing: 20) {
                        NavigationLink(destination: Inbox()) {
                            Image(systemName: "envelope")
                                .resizable()
                                .frame(width: 34, height: 28)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        NavigationLink(destination: UserProfile()) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 34, height: 34)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 60)

                Spacer()

                // Title text with animated dots
                Text("FIND ME\nSOMEONE WHO" + String(repeating: ".", count: dotCount))
                    .font(.custom("Inter", size: 32))
                    .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93).opacity(0.8))
                    .multilineTextAlignment(.leading)
                    .frame(width: 285, height: 78, alignment: .leading)
                    .padding(.top, -150)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                            dotCount = (dotCount + 1) % 4
                        }
                        startTypingAnimation() // Start the typing animation on appear
                    }

                // Centered Search bar with animated placeholder text and arrow
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.93).opacity(0.8), lineWidth: 3)
                        .frame(width: isEditing ? 300 : 285, height: isEditing ? 47 : 39)
                        .animation(.easeInOut(duration: 0.2), value: isEditing)
                    
                    // Placeholder text animation within the search bar
                    if searchText.isEmpty && !isEditing {
                        Text(displayedText)
                            .foregroundColor(.white.opacity(0.6))
                            .padding(.leading, 15)
                            .font(.system(size: 18))
                            .lineLimit(1) // Limit to one line
                            .truncationMode(.tail) // Truncate with "..." if too long
                            .frame(width: isEditing ? 280 : 260, alignment: .leading)
                            .transition(.opacity)
                    }

                    // TextField for user input
                    TextField("", text: $searchText, onEditingChanged: { editing in
                        isEditing = editing
                        if isEditing {
                            // Clear displayed text and stop animation when editing starts
                            displayedText = ""
                        } else {
                            // Resume typing animation when editing ends
                            startTypingAnimation()
                        }
                    })
                    .padding(.leading, 15)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .accentColor(.white)
                    .background(Color.clear)

                    // Navigation arrow, only visible when user has entered text
                    if !searchText.isEmpty {
                        NavigationLink(destination: Results()) { // Use `ResultsPage` here
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                                .font(.system(size: 20))
                                .padding(.trailing, 10)
                        }
                    }
                }
                .frame(width: 300, alignment: .center) // Center the search bar
                .padding(.top, 10)

                Spacer()

                // Bottom bar indicator
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 100, height: 5)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity) // Ensure VStack takes full width
            .padding(.horizontal) // Add horizontal padding to center content
        }
        .navigationBarHidden(true)
    }
    
    func startTypingAnimation() {
        // Prevent animation if editing is active
        guard !isEditing else { return }
        
        displayedText = ""
        let phrase = examplePhrases[currentPhraseIndex]
        let typingSpeed = 0.03 // Faster typing speed
        let pauseTime = 0.8 // Shorter pause time
        
        // Typing phase
        for (index, character) in phrase.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + typingSpeed * Double(index)) {
                if !isEditing { // Stop typing if editing starts
                    displayedText.append(character)
                }
                
                // Start backspacing after phrase is fully typed out + pause time
                if index == phrase.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + pauseTime) {
                        if !isEditing { // Only start backspacing if not editing
                            startBackspacingAnimation()
                        }
                    }
                }
            }
        }
    }
    
    func startBackspacingAnimation() {
        let backspacingSpeed = 0.03 // Faster backspacing speed
        let currentLength = displayedText.count
        
        // Backspacing phase
        for i in 0..<currentLength {
            DispatchQueue.main.asyncAfter(deadline: .now() + backspacingSpeed * Double(i)) {
                if !isEditing { // Only backspace if not editing
                    displayedText = String(displayedText.dropLast())
                }
                
                // Move to the next phrase and start typing again after fully backspaced
                if displayedText.isEmpty && !isEditing {
                    currentPhraseIndex = (currentPhraseIndex + 1) % examplePhrases.count
                    startTypingAnimation()
                }
            }
        }
    }
}



// Preview
struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
        }
    }
}
