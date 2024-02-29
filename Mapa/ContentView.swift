//  ContentView.swift
//  Map
//
//  Created by iOS Lab on 27/02/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    
    let coordinates: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 19.06914, longitude: -98.31088),
        CLLocationCoordinate2D(latitude: 19.051341, longitude: -98.283982),
        CLLocationCoordinate2D(latitude: 42.34603, longitude: -71.057087),
        CLLocationCoordinate2D(latitude: 42.320390, longitude: -71.059550)
    ]
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                Marker("Loc1", coordinate: mapItem.placemark.coordinate)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinates.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
}
