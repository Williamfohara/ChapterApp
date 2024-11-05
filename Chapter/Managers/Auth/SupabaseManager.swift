import Supabase
import Foundation

class SupabaseManager {
    static let shared = SupabaseManager() // Singleton instance

    let client: SupabaseClient

    private init() {
        // Initialize Supabase client with your project URL and public API key
        let supabaseURL = URL(string: "https://tjmarpofomeejbenpjlq.supabase.co")!
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRqbWFycG9mb21lZWpiZW5wamxxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk5Nzc3NzUsImV4cCI6MjA0NTU1Mzc3NX0.t7xSFFCmOkKt67G1lSeOVkqVSzJeAyjIyP_VoLx9WrA"
        self.client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }

    // Sign-up function
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Task {
            do {
                let response = try await self.client.auth.signUp(email: email, password: password)
                completion(.success(response.user)) // Pass response.user directly
            } catch {
                completion(.failure(error))
            }
        }
    }

    // Sign-in function
    func signIn(email: String, password: String, completion: @escaping (Result<Session, Error>) -> Void) {
        Task {
            do {
                let response = try await self.client.auth.signIn(email: email, password: password)
                completion(.success(response)) // Pass response directly as session
            } catch {
                completion(.failure(error))
            }
        }
    }
}
