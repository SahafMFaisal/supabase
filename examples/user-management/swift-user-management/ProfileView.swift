struct ProfileView: View {
    // ... (existing code)

    @StateObject private var profileViewModel = ProfileViewModel()

    // ... (existing code)

    var body: some View {
        NavigationStack {
            Form {
                // ... (existing code)

                Section {
                    Button("Update profile") {
                        profileViewModel.updateProfile(username: username, fullName: fullName, website: website, avatarImage: avatarImage)
                    }
                    .bold()

                    if profileViewModel.isLoading {
                        ProgressView()
                    }
                }
            }
            // ... (existing code)
        }
        .task {
            await profileViewModel.getInitialProfile()
        }
    }
}

class ProfileViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var avatarImage: AvatarImage?

    // ... (existing code)

    func getInitialProfile() async {
        do {
            // ... (existing code)
        } catch {
            print("Error fetching initial profile: \(error.localizedDescription)")
        }
    }

    func updateProfile(username: String, fullName: String, website: String, avatarImage: AvatarImage?) {
        Task {
            isLoading = true
            defer { isLoading = false }

            do {
                // ... (existing code)
            } catch {
                print("Error updating profile: \(error.localizedDescription)")
            }
        }
    }

    // ... (existing code)
}
