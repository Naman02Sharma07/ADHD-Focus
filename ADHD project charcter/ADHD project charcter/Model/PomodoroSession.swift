//
//  PomodoroSession.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

import Foundation

struct PomodoroSession: Identifiable {
    let id = UUID()
    let task: Tasks
    var completed: Bool = false
    var pomodoroCount: Int = 0
    
    // Standard Pomodoro settings
    static let workDuration: Int = 1500  // 25 minutes
    static let shortBreakDuration: Int = 300  // 5 minutes
    static let longBreakDuration: Int = 900   // 15 minutes
    static let pomodorosUntilLongBreak: Int = 4
}
