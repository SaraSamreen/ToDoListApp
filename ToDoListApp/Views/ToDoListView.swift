//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Mac on 02/07/2026.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel(userId: "")
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }

                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "GELjI2PSUmYoMVLlY8JqHsSyUPx2")
}
