import SwiftUI
import WorldAssets

struct ContentView: View {
    let workouts = ["Cardio", "Strength Training", "Yoga", "Pilates", "Bench Press"]
    @State private var selectedWorkout: String?
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3) // 3 columns
    
    let images = [
        "Flowers_14_Yellow",
        "Landscape_2_Sunset",
        "Landscape_22_Sailboats",
        "Landscape_28_Purple_Sky",
        "Landscape_29_Tropical_Sunset_Boat",
        "Landscape_33_Trees_Rocks"
    ]
    let texts = ["Text1", "Text2", "Text3", "Text4", "Text5", "Text6"]
    @State private var isImmersiveActive = false

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
                // Use NavigationLink to switch to immersive view
                   NavigationLink(destination: Starfield(), isActive: $isImmersiveActive) {
                       EmptyView()
                   }
                   Button(action: { isImmersiveActive = true }) {
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
                ForEach(0..<6) { index in
                    ZStack {
                        // Box background
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.2))
                        
                        // Image in the middle
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .cornerRadius(20)
                            .shadow(color: .white, radius: 5, x: 0, y: 0)

                        
                        // Button below the image
                        VStack {
                            Spacer()
                            Button(action: {}) {
                                Text(texts[index])
                                    .foregroundColor(.white)
                                    .padding()
                                    .cornerRadius(10)
                            }
                        }
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
