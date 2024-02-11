import SwiftUI

struct ContentView: View {
    let workouts = ["Cardio", "Strength Training", "Yoga", "Pilates", "Bench Press"]
    @State private var selectedWorkout: String?
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3) // 3 columns
    var body: some View {
        NavigationView {
            VStack {
                List(workouts, id: \.self, selection: $selectedWorkout) { workout in
                    Text(workout)
                        .padding()
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("Workouts")
                .toolbar {
                    // Add glassy background to the heading
                    ToolbarItem(placement: .principal) {
                        Text("Workouts")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.3))
                            )
                            .padding(.horizontal, 20) // Adjust padding as needed
                    }
                }
                Spacer() // Add spacer here
                Button(action: startImmersiveWorkout) {
                    Text("Start Immersive Workout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: .blue, radius: 5, x: 0, y: 0)
                }
            }

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<9) { index in
                    ZStack {
                        // Box background
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green.opacity(0.5))
                        
                        // Image in the middle
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        // Button below the image
                        Button(action: {}) {
                            Text("Button")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 20)
                    }
                    .cornerRadius(10)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.2))

        }
    }
    
    func startImmersiveWorkout() {
        // Implement code to start immersive workout
        print("Starting immersive workout...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
