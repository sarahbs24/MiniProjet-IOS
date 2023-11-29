//
//  CoursListView.swift
//  educatif
//
//  Created by sarrabs on 27/11/2023.
//

// CoursListView.swift
import SwiftUI

struct CoursListView: View {
    @ObservedObject var viewModel = CoursViewModel()

    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    Path { path in
                        let width = geometry.size.width
                        let _ = geometry.size.height

                        let radius = width * 0.5

                        path.addArc(center: CGPoint(x: width * 0.5, y: radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
                    }
                    .fill(Color(hex: "8BC34A"))
                    .edgesIgnoringSafeArea(.top)
                    .rotationEffect(.degrees(180))
                }
                .frame(height: 100)

                List(viewModel.cours) { cours in
                    NavigationLink(destination: CourDetails(cours: cours, viewModel: viewModel)) {
                        CoursRow(cours: cours, viewModel: viewModel)
                    }
                }
                .navigationTitle("Cours")
                .navigationBarItems(
                    leading: Button(action: {
                        viewModel.toggleFavoritesOnly()
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(hex: "#00574B"))
                    },
                    trailing: HStack {
                        Button(action: {
                            viewModel.loadCours()
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(Color(hex: "#00574B"))
                        }
                        NavigationLink(destination: AddCoursView(viewModel: viewModel)) {
                            Image(systemName: "plus")
                                .foregroundColor(Color(hex: "#00574B"))
                        }
                    }
                )
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    viewModel.loadCours()
                }
            }
        }
    }
    struct CoursListView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = CoursViewModel()
            let sampleCours = Cours(
                id: "sampleId",
                titleImage: "sampleImageUrl",
                title: "Sample Title",
                header: "Sample Header",
                favori: false
            )

            viewModel.cours = [sampleCours]

            return CoursListView(viewModel: viewModel)
                .previewDevice("iPhone 14 Pro") // Adjust the device as needed
        }
    }
}
