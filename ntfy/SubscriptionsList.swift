//
//  ContentView.swift
//  ntfy-ios
//
//  Created by Andrew Cope on 1/15/22.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui

import SwiftUI

struct SubscriptionsList: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var subscriptions: FetchedResults<Subscription>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(subscriptions) { subscription in
                    ZStack {
                        NavigationLink(
                            destination: EmptyView() // TODO
                        ) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())

                        SubscriptionRow(subscription: subscription)
                    }
                    /*.swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
//                            subscription.delete()
//                            subscriptions.subscriptions = Database.current.getSubscriptions()
                        } label: {
                            Label("Delete", systemImage: "trash.circle")
                        }
                    }*/
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Subscribed topics")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: AddSubscriptionView()
                    ) {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .overlay(Group {
                if subscriptions.isEmpty {
                    Text("No Topics")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

/*
struct SubscriptionsList_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsList(
            subscriptions: NtfySubscriptionList,
            currentView: (.subscriptionList)
        )
    }
}
*/
