//
//  ContentView.swift
//  navigation1
//
//  Created by Brian Malagoli on 23/03/2020.
//  Copyright © 2020 Brian Malagoli. All rights reserved.
//

import SwiftUI

struct carRow: View {
    
    var data: Car
    
    var body: some View {
        
        HStack {
            Image ("\(data.thumbnail)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text("\(data.title)")
                    .font(.title)
                Text("\(data.year)")
                    .font(.footnote)
            }
            Spacer()
        }
    }
}

struct Car: Identifiable {
    var id = UUID()
    var title: String
    var year: String
    var thumbnail: String
}

struct CarList: View {
        
    var carList = [
        Car(title: "Chevrolet Camaro", year: "2009", thumbnail: "Camaro"),
        Car(title: "Ferrari 812 Superfast", year: "2017", thumbnail: "F812"),
        Car(title: "Ford Mustang Shelby 500", year: "1967", thumbnail: "Mustang"),
        Car(title: "Banshee", year: "2013", thumbnail: "Banshee"),
        Car(title: "DeLorean DMC 12", year: "1981", thumbnail: "DeLorean"),
        Car(title: "Aston Martin DB5", year: "1963", thumbnail: "Aston"),
        Car(title: "Ferrari 308 GTS", year: "1984", thumbnail: "F308"),
        Car(title: "Pontiac Firebird Trans-Am", year: "1973", thumbnail: "Firebird"),
        Car(title: "GMC Vandura", year: "1982", thumbnail: "GMC"),
        Car(title: "Forf Falcon XB GT", year: "1979", thumbnail: "Falcon")
        ]
    
    @State private var showAddView = false
    
    var body : some View {
    
        NavigationView {
            List (carList) { car in
                NavigationLink (destination: carDetail(car: car)) {
                    carRow (data: car)
                }
            }
            .sheet(isPresented: $showAddView){
                carAdd()
            }
            .navigationBarTitle ("Cars")
            .navigationBarItems (trailing: Button(action: {
                self.showAddView = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
                    .font(Font.system(size: 25, weight: .medium))
            })
        }
    }
}

struct carDetail: View {
    var car : Car
    
    var body: some View {
        VStack {
            NavigationLink(destination: carAdd()) {
                Image(car.thumbnail)
                    .resizable()
                    .frame(maxWidth: 150, maxHeight: 150)
                    .clipShape(Circle())
            }
            Text("from: \(car.year)")
        }
        .navigationBarTitle(car.title)
    }
}

struct carAdd: View {
    var body: some View {
        Text("Swipe Down to leave ! :)")
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
    }
}
