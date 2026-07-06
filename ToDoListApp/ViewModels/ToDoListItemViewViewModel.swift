//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Mac on 03/07/2026.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import Combine

class ToDoListItemtViewViewModel: ObservableObject{
    
    init() {}
    
        func toggleIsDone(item: ToDoListItem){
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            guard let uid = Auth.auth().currentUser?.uid else{
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .collection("todos")
                .document(itemCopy.id)
                .setData(itemCopy.asDictionary())
        }
    }



