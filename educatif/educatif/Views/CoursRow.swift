//
//  CoursRow.swift
//  educatif
//
//  Created by sarrabs on 29/11/2023.
//

// CoursRow.swift
import SwiftUI

struct CoursRow: View {
    let cours: Cours
    @ObservedObject var viewModel: CoursViewModel

    var body: some View {
        HStack {
            remoteImage(url: cours.titleImage, placeholder: "photo")
                .frame(width: 80, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(cours.title)
                    .font(.headline)
                    .foregroundColor(Color(hex: "#00574B"))

                Text(cours.header)
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "#00574B"))
            }

            Spacer()

            Button(action: {
                viewModel.toggleFavorite(for: cours)
            }) {
                Image(systemName: cours.favori ? "heart.fill" : "heart")
                    .foregroundColor(cours.favori ? Color.red : Color.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.vertical, 5)
    }
    struct CoursRow_Previews: PreviewProvider {
        static var previews: some View {
            let sampleCours = Cours(
                id: "sampleId",
                titleImage: "sampleImageUrl",
                title: "Sample Title",
                header: "Sample Header",
                favori: false
            )

            let viewModel = CoursViewModel()
            viewModel.cours = [sampleCours]

            return CoursRow(cours: sampleCours, viewModel: viewModel)
                .previewLayout(.fixed(width: 300, height: 100)) // Adjust the size as needed
                .padding()
        }
    }
}
