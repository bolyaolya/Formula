//
//  SettingsView.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import SwiftUI
import MessageUI

struct SettingsView<ViewModel>: View where ViewModel: SettingsViewModel {
    @StateObject var viewModel: ViewModel
    @State private var isShowingMailView = false
    
    var body: some View {
        ZStack {
            Color(.darkColor)
                .ignoresSafeArea()
            
            VStack {
                Text("Настройки")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                CustomDivider()
                    .padding(.bottom, 15)
                
                VStack {
                    ButtonView(action: {
                        Task {
                            DispatchQueue.main.async { viewModel.rateApp() }
                        }
                    },
                               buttonTitle: "Оценить приложение",
                               icon: "star.bubble")
                    
                    ButtonView(action: { isShowingMailView = true },
                               buttonTitle: "Обратная связь",
                               icon: "envelope.badge")
                    .sheet(isPresented: $isShowingMailView) {
                        if MFMailComposeViewController.canSendMail() {
                            MailView(recipients: ["1586446@mail.ru"],
                                     subject: "Формула - приложение в AppStore",
                                     body: "Здравствуйте, ")
                        } else {
                            Text("На вашем устройстве не настроен почтовый клиент.")
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Сделано с любовью к гонкам ❤️")
                        Text("v1.0")
                    }
                    .foregroundStyle(Color.white)
                    .font(.system(size: 12))
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
    }
}

struct MailView: UIViewControllerRepresentable {
    var recipients: [String]
    var subject: String
    var body: String
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(recipients)
        vc.setSubject(subject)
        vc.setMessageBody(body, isHTML: false)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}

