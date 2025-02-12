import SwiftUI

struct ContentView: View {
    
    // MARK: - State Variables
    @State private var number = Int.random(in: 1...100)
    @State private var feedback: Feedback? = nil
    @State private var round = 1
    @State private var score = 0
    let totalRounds = 10
    
    // Used to display the feedback image.
    enum Feedback {
        case correct, incorrect
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            // Display the current round and score
            Text("Round \(round) of \(totalRounds)")
                .font(.headline)
            
            // The number is centered
            Text("\(number)")
                .font(.system(size: 72, weight: .bold))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            // Two buttons for the user’s guess
            HStack(spacing: 40) {
                Button(action: {
                    self.handleAnswer(isPrimeGuess: true)
                }) {
                    Text("PRIME")
                        .font(.title2)
                        .padding()
                        .frame(width: 140)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.handleAnswer(isPrimeGuess: false)
                }) {
                    Text("NOT PRIME")
                        .font(.title2)
                        .padding()
                        .frame(width: 140)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            // Feedback image below the buttons
            if let feedback = feedback {
                Group {
                    if feedback == .correct {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
            
            Spacer()
            
            // Display the score
            Text("Score: \(score)")
                .font(.headline)
                .padding(.bottom)
        }
        .padding()
    }
    
    // MARK: - Helper Methods
    
    /// Called when the user taps one of the buttons.
    func handleAnswer(isPrimeGuess: Bool) {
        let actualIsPrime = isPrime(number)
        
        // Set the feedback based on the guess.
        if actualIsPrime == isPrimeGuess {
            feedback = .correct
            score += 1
        } else {
            feedback = .incorrect
        }
        
        // Wait for 1.5 seconds, then proceed to the next round.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            nextRound()
        }
    }
    
    /// Moves the game to the next round (or resets after the final round).
    func nextRound() {
        if round < totalRounds {
            round += 1
            number = Int.random(in: 1...100)
            feedback = nil
        } else {
            // End of game. For now we simply reset the game.
            round = 1
            score = 0
            number = Int.random(in: 1...100)
            feedback = nil
        }
    }
    
    /// Returns true if `num` is a prime number, false otherwise.
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}

// MARK: - Playground Live View Setup
PlaygroundPage.current.setLiveView(ContentView())
