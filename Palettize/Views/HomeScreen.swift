//
//  HomeScreen.swift
//  Palettize
//
//  Created by Chris Y on 9/12/20.
//  Copyright © 2020 Cyfr. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @State var isUploaded = false /// false is before any images uploaded, true is after. TODO: make Core Data
    var body: some View {
        ZStack {
            BackgroundGradient()
            if (!isUploaded) {
                PreUploadScreen(setUploaded: $isUploaded)
            } else {
                PostUploadScreen(setUploaded: $isUploaded)
            }
        }
    }
}

struct PreUploadScreen: View {
    @Binding var setUploaded: Bool
    var body: some View {
        VStack {
            Text("Upload an image to begin")
            UploadButton(setUploaded: self.$setUploaded)
        }
    }
}

struct PostUploadScreen: View {
    @Binding var setUploaded: Bool /// If all images are deleted, back to PreUpload
    var body: some View {
        VStack {
            UploadButton(setUploaded: self.$setUploaded)
        }
    }
}

struct BackgroundGradient: View {
    var body: some View {
        VStack {
            Text("")
        }.edgesIgnoringSafeArea(.all)
    }
}

struct UploadButton: View {
    @Binding var setUploaded: Bool
    var body: some View {
        Button(action: {
            self.setUploaded = true
        }) {
            Image(systemName: "square.and.arrow.up")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
