//
//  PomodorroViewModel.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

// ViewModels/PomodoroViewModel.swift
import Foundation

class PomodoroViewModel: ObservableObject {
    
    var currentSessionDuration: Int = 0

    
    
//    @Published var timeDuration: Int = 0 // Timer duration in seconds

    @Published var tasks: [Tasks] = []
    @Published var currentSession: PomodoroSession?
    @Published var isTimeStarted: Bool = false
    @Published var timeDuration: Int = PomodoroSession.workDuration
    @Published var currentTaskIndex: Int = 0
    @Published var isBreak: Bool = false
    
    func startNextSession() {
        guard currentTaskIndex < tasks.count else {
            // All tasks completed
            return
        }
        
        let task = tasks[currentTaskIndex]
        currentSession = PomodoroSession(task: task)
        timeDuration = PomodoroSession.workDuration
        isBreak = false
    }
    
    func startPomodoroSession(tomatoCount: Int) {
        guard tomatoCount > 0 else { return }
        currentSessionDuration = 1500 // Duration for each tomato in seconds
        timeDuration = currentSessionDuration;
        isTimeStarted = true
    }
    
    
    func resetTimer() {
        timeDuration = 0
        isTimeStarted = false
    }
//
//    func completeCurrentSession() {
//        guard var session = currentSession else { return }
//        
//        session.pomodoroCount += 1
//        
//        // Mark the current task as completed
//        if currentTaskIndex < tasks.count {
//            tasks[currentTaskIndex].isCompleted = true
//        }
//        
//        // Check if all tasks are completed
//        if currentTaskIndex == tasks.count - 1 {
//            // This was the last task
//            isTimeStarted = false
//            currentSession = nil
//            return
//        }
//        
//        // Determine break duration based on pomodoro count
//        if session.pomodoroCount % PomodoroSession.pomodorosUntilLongBreak == 0 {
//            // After every 4th pomodoro, take a long 15-minute break
//            timeDuration = PomodoroSession.longBreakDuration
//            isBreak = true
//        } else {
//            // After other pomodoros, take a short 5-minute break
//            timeDuration = PomodoroSession.shortBreakDuration
//            isBreak = true
//        }
//        
//        if isBreak {
//            // Store the current session during break
//            currentSession = session
//        } else {
//            // After break is complete, move to next task
//            currentTaskIndex += 1
//            startNextSession()
//        }
//    }
//
//    // Add this new function to handle break completion
//    func completeBreak() {
//        isBreak = false
//        currentTaskIndex += 1
//        startNextSession()
//    }

}
