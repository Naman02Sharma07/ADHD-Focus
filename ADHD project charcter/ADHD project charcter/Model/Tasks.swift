//
//  Task.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

import Foundation

struct Tasks: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
//    var userEmail: String  // Link each task to a specific email
}
