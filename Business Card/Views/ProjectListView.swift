//
//  ProjectList.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//

import SwiftUI

struct ProjectListView: View {
    @ObservedObject private var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projectListViewModel.projects) {project in
                    NavigationLink {
                        ProjectDetailView(project: project)
                    } label: {
                        ProjectRowView(appIcon: project.appIcon!, name: project.name, yearCompleted: project.yearCompleted, shortDescription: project.shortDescription, applicationType: project.applicationType, baseURLString: projectListViewModel.baseURLString)
                    }
                }

            }
            .navigationTitle("Projects")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
