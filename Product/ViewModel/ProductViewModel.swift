//
//  ProductViewModel.swift
//  HomeMade
//
//  Created by Tolba Hamdi on 6/11/23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseAuth

class ProductViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var selectedimage: UIImage?
    @Published var products: [Product] = []
    private let collectionRef: CollectionReference = Firestore.firestore().collection("Products")
    @Published var isSaved: Bool = false
    @Published var showErrorMessage = false
    
    init() {
        product = Product(storeId: "", image: "", name: "", price: "")
    }
    
    func fetchProducts(storeID: String) {
        var products: [Product] = []
        
        collectionRef.addSnapshotListener { [weak self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                return
            }
            products = documents.compactMap({ document in
                try? document.data(as: Product.self)
            })
            self?.products = products.filter({ $0.storeId == storeID })
        }
    }
    
    func saveProduct(storeID: String) {
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
            self.product.image = imageUrl
            self.product.storeId = storeID
            do {
                try self.collectionRef.addDocument(from: self.product)
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
    private func storeImage(_ image: UIImage?, completion: @escaping (Result<URL, Error>) -> Void) {
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
    
}


