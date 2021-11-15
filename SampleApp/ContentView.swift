//
//  ContentView.swift
//
//  Created by Lightech on 5/20/21.
//

import SwiftUI
import SwiftGit2

let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

struct ContentView: View {

    @State var message = ""

    let localRepoLocation = documentURL.appendingPathComponent("BigMac")
    let remoteRepoLocation = "https://github.com/light-tech/BigMac.git"

    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }

    var body: some View {
        VStack {
            Button("Open test Git repo", action: testGitRepo)
            Button("Clone remote Git repo", action: cloneGitRepo)
            ScrollView {
                Text(message)
            }
        }.padding(5)
    }

    func cloneGitRepo() {
        let remote: URL = URL(string: remoteRepoLocation)!

        let result = Repository.clone(from: remote, to: localRepoLocation)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }

            switch latestCommit {
            case let .success(commit):
                message = "Latest Commit: \(commit.message) by \(commit.author.name)"

            case let .failure(error):
                message = "Could not get commit: \(error)"
            }

        case let .failure(error):
            message = "Could not clone repository: \(error)"
        }
    }

    func testGitRepo() {
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }

            switch latestCommit {
            case let .success(commit):
                message = "Latest Commit: \(commit.message) by \(commit.author.name)"

            case let .failure(error):
                message = "Could not get commit: \(error)"
            }

        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
