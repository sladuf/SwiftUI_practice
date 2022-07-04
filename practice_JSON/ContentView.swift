//
//  ContentView.swift
//  practice_JSON
//


import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {

        List(todos){ todo in
            VStack(alignment: .leading) {
                Text("ID: \(todo.id.description)")
                    .foregroundColor(.blue)
                    .bold()
                Text(todo.title)
            }.padding()
            
        }
        .onAppear{
            network().getTodos { todos in
                self.todos = todos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
