//
//  MapView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/2.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: String = ""
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
//        Map(initialPosition: .region(region))
        Map(position: $position)
            .task {
                convertAddress(location: location)
            }
    }
    
    private func convertAddress(location: String) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location) { placemarks, error in
            if let error = error {
                print("failed to fetch geo location of string: ", error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            self.position = .region(region)
        }
    }
}

#Preview {
//    MapView(location: "54 Frith Street London W1D 4SL United Kingdom")
    MapView(location: "上海东方明珠")
}
