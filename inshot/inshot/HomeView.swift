//
//  HomeView.swift
//  CapCut
//
//  Created by Mac on 22/07/2024.
//

import SwiftUI

struct HomeView: View {
        @State var showingModal = false
        var body: some View {
            ZStack {
                VStack {
                    HomeViewContents()
                    Spacer()
                }
                if !showingModal {
                    TermsOfServiceModalView(agreeAndContinueButton: $showingModal)
                }
            }
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeViewContents: View {
    @State var userRegistration = false
    var body: some View {
        VStack {
            HStack {
                Button {
                    userRegistration.toggle()
                } label: {
                    Image(systemName: "person")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $userRegistration) {
                    UserRegistration()
                }
                Spacer()
                HStack(spacing: 30) {
                    Text("Pro")
                        .font(.system(size: 20, weight: .bold))
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }
                .padding(.all)
            }
            .padding(.horizontal)
        }
    }
}

struct UserRegistration: View {
    @State var signInView = false
    var body: some View {
        VStack {
            VStack {
                Text("CHI")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 20) {
                Button {
                    signInView.toggle()
                } label: {
                    HStack(spacing: 60) {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                        Text("Sign in with email")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                            .frame(width: 8)
                    }
                }
                .frame(width: UIScreen.main.bounds.width/1.2, height: 45)
                .cornerRadius(22)
                .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .fullScreenCover(isPresented: $signInView) {
                    SignInView()
                }
                VStack {
                    Text("I have read and acknowledge the CHI\n")
                        .foregroundColor(.black)
                    +
                    Text("Terms of Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text(" Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                }
                .font(.system(size: 18, weight: .bold))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
            }
        }
    }
}

struct SignInView: View {
    @State var showNewView = false
    @State var email = ""
    @State var password = ""
    @State var continueButton = false
    @State var showSignUpView = false
    @Environment(\.presentationMode) var presentationMode
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fullScreenCover(isPresented: $showNewView) {
                            UserRegistration()
                        }
                }
                Text("Sign in")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 100) {
                HStack {
                    Image(systemName: "")
                    Text("CHI")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
                VStack(spacing: 20) {
                    TextField("Enter email address", text: $email)
                        .keyboardType(.emailAddress)
                        .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                        .background(.gray.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isEmailFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                        )
                        .focused($isEmailFocused)
                    SecureField("Enter password", text: $password)
                        .keyboardType(.asciiCapable)
                        .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                        .background(.gray.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                        )
                        .focused($isPasswordFocused)
                    Button {
                        continueButton.toggle()
                    } label: {
                        Text("Continue")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                    Button {
                        print("")
                    } label: {
                        Text("Forgot password?")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                }
                    Spacer()
                    HStack {
                        Text("Don't have an account?")
                        Button {
                            showSignUpView.toggle()
                        } label: {
                            Text("Sign up")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        }
                        .fullScreenCover(isPresented: $showSignUpView) {
                            FirstSignUpView()
                    }
                }
            }
        }
    }
}

struct FirstSignUpView: View {
    @State var email = ""
    @State var showNewView = false
    @State var continueButton = false
    @FocusState var isEmailFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView()
                }
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 120)
            VStack(spacing: 20) {
                Text("What's your email address?")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                TextField("Enter email address", text: $email)
                    .keyboardType(.emailAddress)
                    .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isEmailFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                    )
                    .focused($isEmailFocused)
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                VStack {
                    Text("By continuing, you agree to our")
                        .foregroundColor(.gray.opacity(0.9))
                    +
                    Text(" Terms of\n Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and")
                        .foregroundColor(.gray.opacity(0.9))
                    +
                    Text(" Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(".")
                        .foregroundColor(.gray.opacity(0.9))
                }
                .font(.system(size: 18, weight: .bold))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
            }
            Spacer()
        }
    }
}

struct SecondSignUpView: View {
    @State var continueButton = false
    @State var showNewView = false
    @State var code = Array(repeating: "", count: 6)
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView()
                }
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 40) {
                Text("Enter a 6-digit code")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                HStack {
                    ForEach(0..<6, id: \.self) {
                        index in
                        TextField("", text: $code[index])
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                    }
                }
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct SecondSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SecondSignUpView()
    }
}

struct ThirdSignUpView: View {
    @State var password = ""
    @State var continueButton = false
    @State var showNewView = false
    @State var code = Array(repeating: "", count: 6)
    @FocusState var isPasswordFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView()
                }
                    .frame(width: 50)
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
            }
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 40) {
                Text("Create password")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                SecureField("Enter password", text: $password)
                    .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                    )
                    .focused($isPasswordFocused)
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct ThirdSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSignUpView()
    }
}

struct FourthSignUpView: View {
    @State var dateOfBirth = ""
    @State var showNewView = false
    @State var continueButton = false
    @State var selectedDate = Date()
    @State var showDatePicker = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView()
                }
                Spacer()
                    .frame(width: 150)
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                    .lineLimit(0)
            }
            .padding(.trailing,  150)
            Spacer()
                .frame(height: 100)
        VStack(alignment: .center, spacing: 30) {
            Text("When's your date of birth?")
                .font(.system(size: 25, weight: .black))
                .foregroundColor(.black)
            Text("To protect underage users, fill in your\n birthday. Your age information won't be\n shown publicly")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black.opacity(0.9))
            TextField("Birthday", text: $dateOfBirth)
                .keyboardType(.emailAddress)
                .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                .background(.gray.opacity(0.1))
                .cornerRadius(5)
                .onTapGesture {
                    showDatePicker = true
                }
                .onAppear() {
                    let dateformatter = DateFormatter()
                    dateformatter.dateFormat = "yyyy-MM-dd"
                    dateOfBirth = dateformatter.string(from: selectedDate)
                }
                .sheet(isPresented: $showDatePicker) {
                    Color.red
        DatePickerView(selectedDate: $selectedDate, dateString: $dateOfBirth, isPresented: $showDatePicker)
                        .presentationDetents([.height(300)])
                }
                
            Button {
                continueButton.toggle()
            } label: {
                Text("Continue")
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.gray.opacity(0.5))
            }
            .frame(width: UIScreen.main.bounds.width/1.2, height: 50)
            .background(.gray.opacity(0.2))
            .cornerRadius(5)
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.white)
    }
}

struct FourthSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FourthSignUpView()
    }
}

struct FifthSignUpView: View {
    @State var text = ""
    @State var showNewView = false
    @State var continueButton = false
    @FocusState var isNickNameFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView()
                }
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Skip")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 20) {
                Text("Create nickname")
                    .font(.system(size: 30, weight: .black))
                Text("This can be anything you like and can be \n changed later. If you skip this step, you\n will be automatically assigned a default\n nickname.")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black.opacity(0.9))
                VStack(spacing: 50) {
                TextField("Enter a nickname", text: $text)
                .font(isNickNameFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                    .keyboardType(.emailAddress)
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(5)
                    .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(isNickNameFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                    )
                    .focused($isNickNameFocused)
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Confirm")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray.opacity(0.4))
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                .background(.gray.opacity(0.2))
                .cornerRadius(5)
                }
            }
            Spacer()
        }
    }
}

struct FifthSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FifthSignUpView()
    }
}

struct TermsOfServiceModalView: View {
    @Binding var agreeAndContinueButton: Bool
    var body: some View {
        //VStack {
            ZStack {
Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.vertical)
                VStack(spacing: 20) {
        Text("Terms of Service and Privacy \n Policy")
                        .font(.system(size: 16, weight: .black))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                    VStack {
                        Text("By tapping Agree and continue, you\n agree to CHI's")
                            .foregroundColor(.black.opacity(0.9))
                        +
                        Text(" Terms of Service")
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        +
                        Text(" and\n acknowledge that you have read our\n")
                            .foregroundColor(.black.opacity(0.9))
                        +
                        Text("Privacy Policy")
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        +
                        Text(" and")
                            .foregroundColor(.black.opacity(0.9))
                        +
                        Text(" Cookies Policy")
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        +
                        Text(" to\n learn how we collect, use, and share\n your data.")
                    }
                    .font(.system(size: 14, weight: .bold))
                    .lineSpacing(7)
                    HStack(spacing: 10) {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                            .padding(.bottom, 30)
                        Text("You confirmed that you are \n over 13 years old to receive \n advertisements.")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.black.opacity(0.9))
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                    }
                    Button(action: {
                        agreeAndContinueButton.toggle()
                    }) {
                        Text("Agree and continue")
                            .font(.system(size: 16, weight: .black))
                            .shadow(color: .white,radius: 0, x: 0.1, y: 0.1)
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width/1.6, height: 55)
                    .background(Color(red: 0/255, green: 230/255, blue: 255/255))
                    .cornerRadius(10)
                    .shadow(color: .clear,radius: 0, x: 0, y: 0)
                }
                .frame(width: 300, height: 400)
                .background(Color.white)
                .cornerRadius(20).shadow(radius: 20)
            }
        //}
    }
}

