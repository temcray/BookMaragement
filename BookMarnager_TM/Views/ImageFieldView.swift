//
//  ImageFieldView.swift
//  BookMarnager_TM
//
//  Created by Tatiana6mo on 3/5/26.
//

import SwiftUI
import PhotosUI


struct ImageFieldView: View {
    @Binding var data: Data?
        @State private var photosPickerItem: PhotosPickerItem?
        private var imagePreview: UIImage {
            if let data {
                UIImage(data: data)!
            } else{
                UIImage(resource: .lotrKing) // add a defuilt cover later.
            }
        }
        
        var body: some View {
            PhotosPicker(
                //config properties
                selection: $photosPickerItem,
                matching: .images,
                photoLibrary: .shared()
            ){
                //how it looks / what it displays
                Image(uiImage: imagePreview)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
            }.onChange(of: photosPickerItem){
                Task{
                    if let photosPickerItem,
                       let imageData = try? await photosPickerItem.loadTransferable(type: Data.self){
                        data = imageData
                    }
                }
            }
        }
}

