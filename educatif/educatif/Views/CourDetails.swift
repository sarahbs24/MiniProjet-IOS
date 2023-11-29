//
//  CourDetails.swift
//  educatif
//
//  Created by sarrabs on 27/11/2023.
//

// CourDetails.swift
import SwiftUI

struct CourDetails: View {
    let cours: Cours
    @ObservedObject var viewModel: CoursViewModel
    @State private var updatedCours: Cours
    @State private var isShowingQuiz = false

    init(cours: Cours, viewModel: CoursViewModel) {
        self.cours = cours
        self.viewModel = viewModel
        self._updatedCours = State(initialValue: cours)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GeometryReader { geometry in
                        Path { path in
                            let width = geometry.size.width
                            let radius = width * 0.5

                            path.addArc(center: CGPoint(x: width * 0.5, y: radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
                        }
                        .fill(Color(hex: "8BC34A"))
                        .rotationEffect(.degrees(180))
                        .frame(height: 100)
                        .edgesIgnoringSafeArea(.top)
                    }

                    Spacer()

                    VStack {
                        Text(updatedCours.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#00574B"))
                            .padding()

                        remoteImage(url: updatedCours.titleImage, placeholder: "photo")
                            .padding()

                        VStack(alignment: .leading, spacing: 20) { // Increase spacing here
                            Text(updatedCours.header)
                                .foregroundColor(Color(hex: "#00574B"))
                                .padding(.bottom)

                            Spacer()

                            HStack {
                                Button(action: {
                                    isShowingQuiz.toggle()
                                }) {
                                    Image(systemName: "book")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "#00574B"))
                                        .cornerRadius(10)
                                }
                                .sheet(isPresented: $isShowingQuiz) {
                                    QuizView(cours: updatedCours)
                                }

                                Spacer()

                                Button(action: {
                                    // Handle update action
                                }) {
                                    Image(systemName: "pencil")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "#00574B"))
                                        .cornerRadius(10)
                                }

                                Spacer()

                                Button(action: {
                                    // Handle delete action
                                }) {
                                    Image(systemName: "trash")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "#00574B"))
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding()
                    .background(Color.clear)
                    .edgesIgnoringSafeArea(.top)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hide the default back button

            // Add a custom back button with action
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Handle custom back action
                        // For example, you can use NavigationLink to navigate back.
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    // CourDetails_Previews
    struct CourDetails_Previews: PreviewProvider {
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

            return NavigationView {
                CourDetails(cours: sampleCours, viewModel: viewModel)
            }
            .previewDevice("iPhone 12") // Adjust the device preview as needed
        }
    }
}
