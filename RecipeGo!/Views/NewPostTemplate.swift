//
//  NewPostTemplate.swift
//  RecipeGo!
//
//  Created by Matilda on 10/10/22.

import SwiftUI

// VIEW STRUCT
struct NewPostTemplate: View {
    
    //@StateObject var viewModel: TemplateViewModel<Post>
    
    // function that accepts a new post object, uploads to firebase and updates the other views
    typealias CreateAction = (Post) async throws -> Void
    let createAction: CreateAction
    
    // state variables are stored when views are destroyed and recreated, or reloaded
    @State private var newPost = Post(title: "", content: "", authorName: "")
    @State private var state = FormState.idle
    
    
    // dismiss newPostTemplate when no longer needed in view
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {  // info section
                    TextField("Title", text: $newPost.title)
                    TextField("Author Name", text: $newPost.authorName)
                }
                //ImageSection(imageURL: $viewModel.imageURL)
                Section("Content") {  // description section
                    TextEditor(text: $newPost.content)
                        .multilineTextAlignment(.leading)
                }
                Button(action: createPost) { // create post button
                    if state == .working {
                        ProgressView() // tapped
                    }
                    else {
                        Text("Share")
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .listRowBackground(Color.accentColor)
            }
            onSubmit(createPost)
            .navigationTitle("New Post")
        }
        .disabled(state == .working) // disable input fields when shared
        // alert if not working
        .alert("Can't create post", isPresented: $state.isError, actions:{}) {
            Text("Error: Post couldn't be created")
        }
    }
    
    private func createPost() {
        Task {
            state = .working
            do {
                try await createAction(newPost) // calls createAction to make the post 
                dismiss() // dismiss view when finished
            } catch {
                print("[NewPostTemplate] error making post \(error)")
                state = .error
            }
        }
    }
}


// IMAGE
private extension NewPostTemplate {
    struct ImageSection: View {
        @Binding var imageURL: URL?
        
        var body: some View {
            Section("Image") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    EmptyView()
                }
                ImagePickerButton(imageURL: $imageURL) {
                    Label("Choose Image", systemImage: "photo.fill")
                }
            }
        }
    }
}

private extension NewPostTemplate {
    
    // to show user if post is uploading or not
    enum FormState {
        case idle, working, error // idle when error is dismissed 
        // alert
        var isError: Bool { // error is true when state is error
            get {
                self == .error
            }
            set {
                guard !newValue else { return }
                self = .idle
            }
        }
    }
}


/*
 For preview 
 */
struct NewPostTemplate_Previews: PreviewProvider {
    static var previews: some View {
        NewPostTemplate(createAction: { _ in })
    }
}






