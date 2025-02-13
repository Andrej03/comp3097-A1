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

    var body: some View {
        VStack(spaceing: 20) {
            Text("Is this number prime?")
                .font(.largeTitle)
                .padding(.top)
            Text("Chose one of the options below")
                .font(.title2)
                .padding(.top)

            // Set the Prime or not prime buttons
            Button(action: {
                print("Prime")
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
                print("Not Prime")
            }) {
                Text("Not Prime")
                    .font(.title2)
                    .padding()
                    .frame(width: 120, height: 50)
                    .background(Color.blue.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }

}