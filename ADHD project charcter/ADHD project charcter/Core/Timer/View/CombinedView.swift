import SwiftUI

struct CombinedView: View {
    
    @State private var currentTomatoIndex: Int = 0

    @State private var sessionsCompleted: Int = 0
    @State private var totalTomatoesSelected: Int = 0
    
    
    @StateObject private var viewModel = PomodoroViewModel()
    
    @AppStorage("loggedInEmail") private var loggedInEmail: String = "" // Store logged-in user's email
    @State private var selectedTask: Tasks? = nil // Track the selected task
    @State private var tomatoCounts: [Int] = [0, 0, 0, 0] // Counts for each tomato icon
    @State private var tasks: [Tasks] = []
    @State private var newTaskTitle: String = ""
    @State var to: CGFloat = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            // Timer View
            VStack {
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.red.opacity(0.90), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 210, height: 210)
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.black.opacity(0.90),style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 210, height: 210)
                        .rotationEffect(.init(degrees: -90))
                    VStack {
                        Text("\(self.viewModel.timeDuration, specifier: formatTime())")
                            .font(.custom("Avenir", size: 45))
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                }
                //                HStack(spacing: 25) {
                //                    Image("tomato") // Replace with your asset names
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 30, height: 30) // Adjust size as needed
                //
                //                    Image("tomato")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 30, height: 30)
                //
                //                    Image("tomato")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 30, height: 30)
                //
                //                    Image("tomato-3")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 30, height: 30)
                //                }
                
                HStack(spacing: 25) {
//                    ForEach(0..<4) { index in
//                        Button(action: {
//                            if selectedTask != nil && currentTomatoIndex < 4 {
//                                tomatoCounts[index] += 1
//                                currentTomatoIndex += 1
//                            }
//                        
//                        
////                        Button(action: {
////                            // Increment the count for the selected tomato
////                            if selectedTask != nil {
////                                tomatoCounts[index] += 1
////                            }
//                        
//                        
//                        }) {
//                            Image(tomatoCounts[index] > 0 ? "tomato" : "tomato-3")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30)
//                        }
//                    }
                    
                    
                    
                    ForEach(0..<4) { index in
                        Button(action: {
                            if selectedTask != nil {
                                if currentTomatoIndex < 4 {
                                    tomatoCounts[currentTomatoIndex] += 1
                                    currentTomatoIndex += 1
                                    totalTomatoesSelected += 1 // Increment total tomatoes selected
                                }
                            }
                        }) {
                            Image(tomatoCounts[index] > 0 ? "tomato" : "tomato-3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                .padding(.top, 20)
                HStack(spacing: 20) {
                    Button(action: {
                        viewModel.currentTaskIndex = 0
                        viewModel.startNextSession()
                        viewModel.isTimeStarted = false
                        withAnimation(.default) {
                            self.to = 1 // Full circle
                        }
                    }) {
                        HStack(spacing: 15) {
                            Text("Cancel")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.white)
                        .clipShape(Capsule())
                    }
                    
//                    Button(action: {
//                        self.viewModel.isTimeStarted.toggle()
//                    }) {
                    
                    Button(action: {
                        viewModel.isTimeStarted.toggle()
                        if viewModel.isTimeStarted {
                            viewModel.startPomodoroSession(tomatoCount: currentTomatoIndex)
                        }
                    }) {
                        HStack(spacing: 15) {
                            Text(self.viewModel.isTimeStarted ? "Pause" : "Start")
                                .foregroundColor(self.viewModel.isTimeStarted ? .red : .green)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.white)
                        .clipShape(Capsule())
                    }
                }
                .padding(.top, 55)
            }
            
            .onReceive(self.time) { _ in
                if self.viewModel.isTimeStarted {
                    if self.viewModel.timeDuration > 0 {
                        // Decrease the time duration by 1 second
                        self.viewModel.timeDuration -= 1
                        
                        // Update the circle's progress
                        withAnimation(.default) {
                            let totalTime = viewModel.isBreak ?
                            (viewModel.timeDuration == PomodoroSession.longBreakDuration ?
                             PomodoroSession.longBreakDuration : PomodoroSession.shortBreakDuration) :
                            PomodoroSession.workDuration
                            self.to = CGFloat(self.viewModel.timeDuration) / CGFloat(totalTime)
                        }
                    } else {
                        // Timer has finished for one session
                        if sessionsCompleted < totalTomatoesSelected {
                            // Reset the tomato icon back to default in reverse order
                            tomatoCounts[totalTomatoesSelected - 1 - sessionsCompleted] = 0 // Change the completed tomato to its default icon
                            sessionsCompleted += 1 // Increment completed sessions count

                            // Reset the timer for the next session
                            viewModel.timeDuration = 15 // Reset to the session duration (15 seconds in this case)
                        }
                        
                        // Stop the timer if all sessions are completed
                        if sessionsCompleted >= totalTomatoesSelected {
                            viewModel.isTimeStarted = false
                        }
                    }
                }
            }
               
            
            .padding()
            
            // To-Do List View
            VStack {
                HStack {
                    TextField("Add a new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: addTask) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                Text("To Do List")
                    .font(.headline)
                    .padding(.horizontal,30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                // Use List for better swipe actions
                //                List {
                //                    ForEach(tasks) { task in
                //                        TaskRow(task: task, selectedTask: $selectedTask)
                //                    }
                
                
                
                //                List {
                //                    ForEach(tasks) { task in
                //                    TaskRow(task: task, selectedTask: $selectedTask, tomatoCounts: $tomatoCounts)
                //                    }
                
                
                
                List {
                    ForEach(tasks) { task in
                        TaskRow(task: task, selectedTask: $selectedTask, tomatoCounts: $tomatoCounts)
                        
                        
                        //                            .onTapGesture {
                        //                                // When a new task is selected, reset the tomato counts
                        //                                selectedTask = task
                        //                                resetTomatoCounts()
                        //                            }
                            .onTapGesture {
                                selectedTask = task
                                resetTomatoCounts()
                                sessionsCompleted = 0 // Reset completed sessions
                                totalTomatoesSelected = 0 // Reset total tomatoes selected
                            }
                        
                        
                    }
                    .onDelete(perform: deleteTask) // Use onDelete for swipe-to-delete
                    // Add extra space at the bottom of the list
                    Color.clear.frame(height: 50) // This adds extra space for scrolling

                }
                .listStyle(PlainListStyle()) // Set list style to plain (removes default system tray appearance)
                .background(Color.white) // Set the background of the list to white
                .padding(.top, 10)
            }
            .padding(.horizontal)
            .background(Color.white)
            .edgesIgnoringSafeArea(.bottom)
        }
        
        .padding(.top,80)
        .background(Color.white) // Set the background of the entire view to white
        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the entire screen
    }

    // MARK: - Methods

    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Tasks(title: newTaskTitle)
        tasks.append(newTask)
        saveTasks()  // Save the task after adding
        newTaskTitle = ""  // Clear the text field
    }

    private func deleteTask(at offsets: IndexSet) {
        // Remove the task from the array using the provided index set
        tasks.remove(atOffsets: offsets)
        saveTasks()  // Save the updated list after deletion
    }

    private func loadTasks() {
        guard !loggedInEmail.isEmpty else { return }
        let userKey = "tasks_\(loggedInEmail)"  // Use email as a unique key for each user's tasks
        if let loadedTasks = try? JSONDecoder().decode([Tasks].self, from: UserDefaults.standard.data(forKey: userKey) ?? Data()) {
            tasks = loadedTasks
        }
    }

    private func saveTasks() {
        guard !loggedInEmail.isEmpty else { return }
        let userKey = "tasks_\(loggedInEmail)"  // Use email as a unique key for each user's tasks
        if let encodedTasks = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedTasks, forKey: userKey)  // Save tasks using user's email as key
        }
    }

//    func formatTime() -> String {
//        let minutes = Int(viewModel.timeDuration) / 60 % 60
//        let seconds = Int(viewModel.timeDuration) % 60
//        return String(format: "%02i:%02i", minutes, seconds)
//    }
    
    
    private func formatTime() -> String {
        let minutes = viewModel.timeDuration / 60
        let seconds = viewModel.timeDuration % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
//    private func resetTomatoCounts() {
//            tomatoCounts = [0, 0, 0, 0] // Reset all counts to zero
//        }
    
    private func resetTomatoCounts() {
        tomatoCounts = [0, 0, 0, 0]
        currentTomatoIndex = 0
    }
}

#Preview {
    CombinedView()
}

