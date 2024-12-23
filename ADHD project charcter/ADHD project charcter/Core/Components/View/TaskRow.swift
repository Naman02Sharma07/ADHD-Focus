//
//  TaskRow.swift
//  ADHD project charcter
//
//  Created by student on 22/11/24.
//

import SwiftUI

struct TaskRow: View {
    let task: Tasks
    @Binding var selectedTask: Tasks?
    @Binding var tomatoCounts: [Int] // Binding to track tomato counts


    var body: some View {
        HStack {
            Button(action: {
            selectedTask = task // Set the selected task when tapped
            }) {
            Image(systemName: selectedTask == task ? "circle.fill" : "circle") // Use circle fill if selected
                .foregroundColor(selectedTask == task ? .blue : .gray)
                }
            Text(task.title)
                .font(.body)
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}



struct TaskRow_Previews: PreviewProvider {
    @State static var selectedTask: Tasks? = nil // Temporary state for preview
    @State static var tomatoCounts: [Int] = [0, 0, 0, 0] // Initial counts for tomatoes

    static var previews: some View {
        TaskRow(task: Tasks(title: "Sample Task"), selectedTask: $selectedTask, tomatoCounts: $tomatoCounts)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
