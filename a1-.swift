import SwiftUI

@main
struct PrimeNumberGuessingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    // Setting a base of ranodmness ofr the printing of the numbers
    @State private var number: Int = Int.random(in: 1...500) // test base is anywhere from 1 to 500
    // Setting the correctness of the prime number
    @State private var isPrime: Bool? = nil

    var body: some View {
        // Setting the code for the view
        // such as the Print position of the prime number
        VStack(spacing: 20) {
            Text("Is this number prime? \(number)")
                .font(.largeTitle)
                .padding(.top)
            Text("Chose one of the options below")
                .font(.title2)
                .padding(.top)

            // Set the Prime or not prime buttons
            Button(action: {
                isPrime = checkPrimeNumber(number: number)
                number = Int.random(in: 1...500)
            }) {
                Text("Prime")
                    .font(.title2)
                    .padding()
                    .frame(width: 120, height: 50)
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                isPrime = !checkPrimeNumber(number: number)
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
        .padding()
    }

    func checkPrimeNumber(number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
    }

    if let isUserCorrect = isPrime {
    Text(isUserCorrect ? "Correct!" : "Not Correct!")
        .font(.title)
        .padding()
    }
}