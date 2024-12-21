import SwiftUI

struct FoodsView: View {
    @State private var isMenuOpen = false
    @State private var selectedDate = Date()
    @State private var isAdding = false

    var body: some View {
        NavigationView {
            ZStack {
                // Main content
                VStack {
                    Text("Add and track the food you eat each day.")
                        .font(.headline)
                        .padding()

                    Spacer()
                }
                .blur(radius: (isMenuOpen || isAdding) ? 10 : 0)

                // Detect taps outside of the buttons or DatePicker
                if isMenuOpen || isAdding {
                    Color.black.opacity(0.01)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isMenuOpen = false
                                isAdding = false
                            }
                        }
                }
                

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
                    .background(
                        Color.white.opacity(0.01) // Transparent background for tap detection
                            .onTapGesture {
                                withAnimation {
                                    isMenuOpen = false
                                }
                            }
                    )
                    .shadow(radius: 10)
                    .padding(.top, 50)
                }

                // Smaller buttons moving outward
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            // First button (Meal)
                            NavigationLink(destination: AddMealView()) {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: "fork.knife")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                    )
                            }
                            .offset(y: isAdding ? -80 : 0)
                            .opacity(isAdding ? 1 : 0)
                            .scaleEffect(isAdding ? 1 : 0.5)
                            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isAdding)

                            // Second button (Symptom)
                            NavigationLink(destination: AddSymptomView()) {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: "heart.text.square")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                    )
                            }
                            .offset(y: isAdding ? -160 : 0)
                            .opacity(isAdding ? 1 : 0)
                            .scaleEffect(isAdding ? 1 : 0.5)
                            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isAdding)

                            // Add button
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
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
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
