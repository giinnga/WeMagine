//
//  LanguagesManager.swift
//  WeMagine
//
//  Created by Joao Nassar Galante Guedes on 23/03/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class LanguagesManager: NSObject {
    
    class func textLoginEnterNoLoginButton(lan: String) -> String {
        
        if(lan == "pt") {
            return "Entrar sem fazer login"
        }
        
        return "Enter without logging in"
    }
    
    class func textLoginCouldNotConnectFacebook(lan: String) -> String {
        
        if(lan == "pt") {
            return "Não foi possível se conectar com o facebook!\nTente novamente mais tarde!"
        }
        
        return "Could not connect with facebook!\nPlease try again later!"
    }
    
    class func textMainNotLoggedInSend(lan: String) -> String {
        
        if(lan == "pt") {
            return "Você não pode enviar uma ideia sem estar logado. Por favor, entre com o facebook para poder fazer isso!"
        }
        
        return "You can't send a new idea without logging in. Please, log in with facebook to be able to to that!"
    }
    
    class func textMainNotLoggedInSee(lan: String) -> String {
        
        if(lan == "pt") {
            return "Você não pode ver suas ideias sem estar logado. Por favor, entre com o facebook para poder fazer isso!"
        }
        
        return "You can't see your ideas without logging in. Please, log in with facebook to be able to to that!"
    }
    
    class func textMainButtonOK(lan: String) -> String {
        
        if(lan == "pt") {
            return "Certo!"
        }
        
        return "OK then!"
    }
    
    class func textMainButtonCancel(lan: String) -> String {
        
        if(lan == "pt") {
            return "Deixa pra lá"
        }
        
        return "Nevermind"
    }
    
    class func textMainMenuShareImagination(lan: String) -> String {
        
        if(lan == "pt") {
            return "Compartilhar ideia"
        }
        
        return "Share imagination"
    }
    
    class func textMainMenuMyIdeas(lan: String) -> String {
        
        if(lan == "pt") {
            return "Minhas ideias"
        }
        
        return "My shared ideas"
    }
    
    class func textMainMenuTutorial(lan: String) -> String {
        
        if(lan == "pt") {
            return "Tutorial"
        }
        
        return "Tutorial"
    }
    
    class func textMainMenuExit(lan: String) -> String {
        
        if(lan == "pt") {
            return "Sair"
        }
        
        return "Exit"
    }
    
    class func textMainMenuReport(lan: String) -> String {
        
        if(lan == "pt") {
            return "Denunciar ideia"
        }
        
        return "Report idea"
    }
    
    class func textMainMenuLogOut(lan: String) -> String {
        
        if(lan == "pt") {
            return "Desconectar"
        }
        
        return "Log Out"
    }
    
    class func textMainMenuReportText(lan: String) -> String {
        
        if(lan == "pt") {
            return "Se você considera esta ideia ofensiva e/ou inapropriada, você pode denunciá-la para nós. Você quer fazer isso?"
        }
        
        return "If you think this idea is offensive and/or inapropiate, you can report it to us. Do you want to do this?"
    }
    
    class func textMainMenuReportOk(lan: String) -> String {
        
        if(lan == "pt") {
            return "Sim"
        }
        
        return "Yes"
    }
    
    class func textMainMenuReportCancel(lan: String) -> String {
        
        if(lan == "pt") {
            return "Não"
        }
        
        return "No"
    }
    
    class func textMainMenuReportSucess(lan: String) -> String {
        
        if(lan == "pt") {
            return "Ideia reportada com sucesso!"
        }
        
        return "Idea sucessfully reported!"
    }
    
    class func textMainMenuReportFail(lan: String) -> String {
        
        if(lan == "pt") {
            return "Algo deu errado ao tentar denunciar a ideia. Por favor tente novamente."
        }
        
        return "Something went wrong while reporting the idea. Please try again."
    }
    
    class func textSendTutorial(lan: String) -> String {
        
        if(lan == "pt") {
            return "Toque na nuvem para\ncompartilhar sua ideia!"
        }
        
        return "Tap on the cloud to\nshare your idea!"
    }
    
    class func textMainMenuReportError(lan: String) -> String {
        
        if(lan == "pt") {
            return "Erro"
        }
        
        return "Error"
    }
    
    class func textMainMenuReportRetry(lan: String) -> String {
        
        if(lan == "pt") {
            return "Tentar"
        }
        
        return "Retry"
    }
    
    class func textMainMenuReportNotRetry(lan: String) -> String {
        
        if(lan == "pt") {
            return "Cancelar"
        }
        
        return "Cancel"
    }
    
    class func textSendError(lan: String) -> String {
        
        if(lan == "pt") {
            return "Algo deu errado!\nPor favor tente novamente!"
        }
        
        return "Something went wrong!\nPlease try again!"
    }
    
    class func imageBackButton(lan: String) -> String {
        
        if(lan == "pt") {
            return "BackButtonPT@3x.png"
        }
        
        return "BackButton@3x.png"
        
    }
    
    class func textMyIdeasBigCloudText(lan: String) -> String {
        if(lan == "pt") {
            return "Minhas ideias"
        }
        
        return "My shared ideas"
    }
    
    class func textTutorialStep0(lan: String) -> String {
        if(lan == "pt") {
            return "Bem-vindo ao We magine!"
        }
        
        return "Welcome to We magine!"
    }
    
    class func textTutorialStep1(lan: String) -> String {
        if(lan == "pt") {
            return "Aqui você vai aprender a usar o aplicativo."
        }
        
        return "Here you will learn how to use the app."
    }
    
    class func textTutorialStep2(lan: String) -> String {
        if(lan == "pt") {
            return "Alguma ideia aleatória vai aparecer nesta nuvem!"
        }
        
        return "Some random idea will appear in this cloud!"
    }
    
    class func textTutorialStep3(lan: String) -> String {
        if(lan == "pt") {
            return "Clique aqui se gostar da ideia!"
        }
        
        return "Tap here if you like the idea!"
    }
    
    class func textTutorialStep4(lan: String) -> String {
        if(lan == "pt") {
            return "E se você não gostar, clique aqui."
        }
        
        return "And if you don't like it, tap here."
    }
    
    class func textTutorialStep5(lan: String) -> String {
        if(lan == "pt") {
            return "Se você estiver logado, você pode enviar sua ideia clicando nesta lâmpada."
        }
        
        return "If you are logged in, you can send your ideas by tapping this lamp."
    }
    
    class func textTutorialStep6(lan: String) -> String {
        if(lan == "pt") {
            return "Clique aqui para abrir o menu."
        }
        
        return "Tap here to open the app menu."
    }
    
    class func textTutorialStep7(lan: String) -> String {
        if(lan == "pt") {
            return "Aqui você pode ver todas as ideias que você enviou e desconectar se desejar."
        }
        
        return "Here you can view all the ideas you've sent and log out if you want to."
    }
    
    class func textTutorialStep8(lan: String) -> String {
        if(lan == "pt") {
            return "Você também pode assistir a esse tutorial novamente!"
        }
        
        return "You can also watch this tutorial again!"
    }
    
    class func textTutorialStep9(lan: String) -> String {
        if(lan == "pt") {
            return "Aproveite o aplicativo!\nE continue imaginando!"
        }
        
        return "Enjoy the app!\nAnd keep imagining!"
    }
    
}
