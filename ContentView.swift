import SwiftUI

struct Element: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    
    let elements = [
        Element(name: "Carbon", imageName: "Carbon"),
        Element(name: "Gold", imageName: "Gold"),
        Element(name: "Chlorine", imageName: "Chlorine"),
        Element(name: "Sodium", imageName: "Sodium")
    ]
    
    @State private var currentElementIndex = 0
    @State private var answerText = "?"
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("ElementQuiz")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(elements[currentElementIndex].imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            Text(answerText)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Show Answer") {
                answerText = elements[currentElementIndex].name
                score += 1
            }
            .buttonStyle(.borderedProminent)
            
            Button("Next") {
                currentElementIndex += 1
                
                if currentElementIndex >= elements.count {
                    currentElementIndex = 0
                }
                
                answerText = "?"
            }
            .buttonStyle(.bordered)
            
            Text("Score: \(score)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
