import SwiftUI

@main
struct PrimeGuessingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    // Generate a random number between 1 and 100
    @State private var number: Int = Int.random(in: 1...100)
    // Holds the feedback message to show the user
    @State private var message: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Is this number prime?")
                .font(.title)
                .padding(.top)
            
            // Display the random number
            Text("\(number)")
                .font(.system(size: 72, weight: .bold))
                .padding()
            
            // Two buttons for the user’s guess
            HStack(spacing: 40) {
                Button(action: {
                    self.checkAnswer(isPrimeGuess: true)
                }) {
                    Text("Prime")
                        .font(.title2)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.checkAnswer(isPrimeGuess: false)
                }) {
                    Text("Not Prime")
                        .font(.title2)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            // Show feedback message
            Text(message)
                .font(.title2)
                .foregroundColor(message == "Correct!" ? .green : .red)
            
            Spacer()
        }
        .padding()
    }
    
    /// Checks whether the user's guess is correct
    func checkAnswer(isPrimeGuess: Bool) {
        let isPrimeNumber = isPrime(number)
        
        // Determine if the guess is correct
        if isPrimeNumber == isPrimeGuess {
            message = "Correct!"
        } else {
            message = "Wrong!"
        }
        
        // After a short delay, generate a new number and clear the message.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            number = Int.random(in: 1...100)
            message = ""
        }
    }
    
    /// Returns true if `num` is a prime number, false otherwise.
    func isPrime(_ num: Int) -> Bool {
        // Numbers less than 2 are not prime.
        if num < 2 { return false }
        
        // Only check up to the square root of the number.
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}
