import SwiftUI

struct ContentView: View {
    // Setting a base of randomness for the printing of the numbers
    @State private var number: Int = Int.random(in: 1...500) // test base is anywhere from 1 to 500
    // Setting the correctness of the prime number
    @State private var isPrime: Bool? = nil
    // Setting for the counter, for measuring the player's tries
    @State private var counter: Int = 0
    // Storage of the resulting tries
    @State private var results: [Bool] = []

    var body: some View {
        VStack(spacing: 30) {
            Text("\(number)")
                .font(.largeTitle)
                .padding(.top)
            Text("Chose one of the options below")
                .font(.title2)
                .padding(.top)

            // Set the Prime button
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
            // stop after the 10 tries and follow to the final tally
            .disabled(counter >= 10)

            // Set the Not Prime button
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
            // stop after the 10 tries and follow to the final tally
            .disabled(counter >= 10)

            // Providing the feedback icon to the player
            if let isUserCorrect = isPrime {
                if isUserCorrect {
                    // Google image of a Checkmark for correct answer
                    if let checkImage = UIImage(named: "check_circle_outline") {
                        Image(uiImage: checkImage)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                            .padding()
                    } else {
                        // Fallback answer if the image is not found
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
                        // Fallback answer if the image is not found
                        Text("Not Correct!")
                            .font(.title)
                            .padding()
                    }
                }
            }

            // Displaying the correct number of tries out of 10
            if counter >= 10 {
                Text("Your 10 tries are up!")
                    .font(.title2)
                    .padding(.top)
                
                Text("You got \(results.filter { $0 }.count) out of 10 right!")
                    .font(.title2)
                    .padding(.top)
            }
        }
    }
}

    // Function to check if the number is prime 
    // and ensure the number is bigger than 1
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
