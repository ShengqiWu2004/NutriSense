import Foundation
import SwiftUI

struct FoodsView: View {
    @State private var isMenuOpen = false
    @State private var selectedDate = Date()
    @State private var isAdding = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Add and track the food you eat each day.")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
                .blur(radius: (isMenuOpen || isAdding) ? 10 : 0)

                if isMenuOpen {
                    VStack {
                        VStack {
                            Text("Select a Date")
                                .font(.headline)
                                .foregroundColor(Color.accentColor)
                                .padding(.top, 20)

                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .accentColor(Color.accentColor)
                                .labelsHidden()
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .shadow(radius: 10)
                    .padding(.top, 50)
                }

                if isAdding {
                    Color.black.opacity(0.01) // Detects taps while being nearly invisible
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isAdding = false
                            }
                        }
                    VStack {
                        Spacer()

                        HStack {
                            Spacer()

                            VStack(spacing: 10) {
                                NavigationLink(destination: AddMealView()) {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "fork.knife")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                        )
                                }
                                .onTapGesture {
                                    withAnimation {
                                        isAdding = false
                                    }
                                }

                                NavigationLink(destination: AddSymptomView()) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "heart")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                        )
                                }
                                .onTapGesture {
                                    withAnimation {
                                        isAdding = false
                                    }
                                }
                            }

                            ZStack {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 60, height: 60)

                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                            .onTapGesture {
                                withAnimation {
                                    isAdding.toggle()
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 60, height: 60)

                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                            .onTapGesture {
                                withAnimation {
                                    isAdding.toggle()
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .animation(.easeInOut(duration: 0.15), value: isMenuOpen)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(isMenuOpen ? Color.green : Color.gray)
                            .font(.title2)
                    }
                }
            }
        }
    }
}
