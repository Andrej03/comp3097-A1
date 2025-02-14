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
    // Setting fro the counter, for measuring of the players tries
    @State private var counter: Int = 0
    // Storage of the resulting trys
    @State private var results: [Bool] = []

    var body: some View {
        // Setting the code for the view
        // such as the Print position of the prime number
        VStack(spacing: 20) {
            Text("\(number)")
                .font(.largeTitle)
                .padding(.top)
            Text("Chose one of the options below")
                .font(.title2)
                .padding(.top)

            // Set the Prime or not prime buttons
            Button(action: {
                // Determine and count the right answer
                let rightAnswer = checkPrimeNumber(number: number)
                isPrime = rightAnswer
                results.append(rightAnswer)
                counter += 1
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
                // Determine and count the wrong answer
                let wrongAnswer = !checkPrimeNumber(number: number)
                isPrime = wrongAnswer
                results.append(wrongAnswer)
                counter += 1
                number = Int.random(in: 1...500)
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

    // Provideing the feedback icon to the player
    if let isUserCorrect = isPrime {
    if isUserCorrect {
        // Use Google fonts to find a image icon, convert to apple style UI
        // Google image of a checkmark for correct answer
        if let checkImage = UIImage(named: "check_circle_outline") {
            Image(uiImage: checkImage)
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
                .padding()
        } else {
            // If the image is not found, display the text as a fallback
            Text("Correct!")
                .font(.title)
                .padding()
        }
    } else {
        // Google image of an XCross for incorrect answer
        if let cancelImage = UIImage(named: "cancel") {
            Image(uiImage: cancelImage)
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
                .padding()
        } else {
            // If the image is not found, display the text as a fallback
            Text("Not Correct!")
                .font(.title)
                .padding()
        }
    }
}

}