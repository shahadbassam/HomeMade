//
//  StoreViewModel.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/10/23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseAuth

class StoreViewModel: ObservableObject {
    
    @Published var store: Store
    @Published var selectedimage: UIImage?
    @Published var stores: [Store] = []
    private let collectionRef: CollectionReference = Firestore.firestore().collection("Stores")
    @Published var isSaved: Bool = false
    @Published var showErrorMessage = false

        init() {
            store = Store(userId: Auth.auth().currentUser?.uid ?? "", image: "", ownerName: "", name: "", maroofNumber: "", freelancingDocument: "", socialAccount: "", region: "", email: "", phone: "", isOwner: "", isAccepted: true)
        }
        
        func fetchStores() {
            var stores: [Store] = []
            
            collectionRef.addSnapshotListener { [weak self] querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    return
                }
                stores = documents.compactMap({ document in
                    try? document.data(as: Store.self)
                })
                self?.stores = stores.filter({ $0.isAccepted == true })
            }
        }
        
        func saveStore() {
            var imageUrl: String = ""
            let group = DispatchGroup()
                group.enter()
                storeImage(selectedimage) { result in
                    switch result {
                    case .success(let downloadURL):
                        imageUrl = downloadURL.absoluteString
                        
                    case .failure(let error):
                        print("Error storing image: \(error.localizedDescription)")
                    }
                    group.leave()
                }
            
            group.notify(queue: .main) {
                self.store.image = imageUrl
                do {
                    try self.collectionRef.addDocument(from: self.store)
                    { error in
                        if let error = error {
                            print("Error storing office: \(error.localizedDescription)")
                        } else {
                            
                            self.isSaved = true
                            print("Data saved successfully!")
                        }
                    }
                } catch {
                    print("Error storing store: \(error.localizedDescription)")
                }
            }
        }
  
    // Function to store an image in Firebase Storage and return the download URL
    func storeImage(_ image: UIImage?, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let image else {return}
        let storageRef = Storage.storage().reference()
        let imageName = UUID().uuidString + ".jpg"
        let imagesRef = storageRef.child("images/\(imageName)")
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }
        
        let uploadTask = imagesRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                completion(.failure(error))
            } else {
                imagesRef.downloadURL { url, error in
                    if let error = error {
                        completion(.failure(error))
                    } else if let downloadURL = url {
                        completion(.success(downloadURL))
                    }
                }
            }
        }
        
        uploadTask.resume()
    }
    
    
    func pressWhatsUp(phoneNumber: String) {
        
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
        }
    
     func pressCallNumber(phoneNumber: String) {
         
      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    // Function to toggle bookmark for a workspace and user
        func toggleFavorite(store: Store) {
            guard let currentUserID = Auth.auth().currentUser?.uid else {
                print("User not authenticated")
                return
            }
            print(currentUserID)
            collectionRef.whereField("id", isEqualTo: store.id.uuidString).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error retrieving workspace document: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No documents found for the workspace")
                    return
                }
                
                if documents.count == 1 {
                    let document = documents[0]
                    var bookmarkedUserIDs = document.get("favoriteBy") as? [String] ?? []
                    
                    if bookmarkedUserIDs.contains(currentUserID) {
                        bookmarkedUserIDs.removeAll { $0 == currentUserID }
                    } else {
                        bookmarkedUserIDs.append(currentUserID)
                    }
                    
                    document.reference.updateData([
                        "favoriteBy": bookmarkedUserIDs
                    ]) { error in
                        if let error = error {
                            print("Error toggling bookmark: \(error.localizedDescription)")
                        } else {
                            print("Favorite toggled successfully")
                        }
                    }
                } else {
                    print("Multiple documents found for the workspace")
                }
            }
        }

        func isFavoriteByCurrentUser(store: Store) -> Bool {
            guard let currentUserID = Auth.auth().currentUser?.uid else {
                return false
            }
            
            return store.favoriteBy.contains(currentUserID)
        }
    
    func getFavoriteStores(stores: [Store]) -> [Store] {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return []
        }
        return stores.filter { $0.favoriteBy.contains(currentUserID)}
    }
    
    func getStoreId() -> String? {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return nil
        }
        return stores.first(where: {$0.userId == currentUserID})?.id.uuidString
    }
    
    func getCurrentStore() -> Store? {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return nil
        }
        return stores.first(where: {$0.userId == currentUserID})
    }
}
