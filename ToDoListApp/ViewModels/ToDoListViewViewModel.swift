//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Mac on 03/07/2026.
//

import FirebaseFirestore
import Foundation
import Combine

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    //Delete to do list item
        func delete(id: String){
            let db = Firestore.firestore()
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
        }
    }

