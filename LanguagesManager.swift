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
        
        if(lan == "pt-br") {
            return "Entrar sem fazer login"
        }
        
        return "Enter without logging in"
    }
    
    class func textLoginCouldNotConnectFacebook(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Não foi possível se conectar com o facebook!\nTente novamente mais tarde!"
        }
        
        return "Could not connect with facebook!\nPlease try again later!"
    }
    
    class func textMainNotLoggedInSend(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Você não pode enviar uma ideia sem estar logado. Por favor, entre com o facebook para poder fazer isso!"
        }
        
        return "You can't send a new idea without logging in. Please, log in with facebook to be able to to that!"
    }
    
    class func textMainNotLoggedInSee(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Você não pode ver suas ideias sem estar logado. Por favor, entre com o facebook para poder fazer isso!"
        }
        
        return "You can't see your ideas without logging in. Please, log in with facebook to be able to to that!"
    }
    
    class func textMainButtonOK(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Certo!"
        }
        
        return "OK then!"
    }
    
    class func textMainButtonCancel(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Deixa pra lá"
        }
        
        return "Nevermind"
    }
    
    class func textMainMenuShareImagination(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Compartilhar ideia"
        }
        
        return "Share imagination"
    }
    
    class func textMainMenuMyIdeas(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Minhas ideias"
        }
        
        return "My shared ideas"
    }
    
    class func textMainMenuTutorial(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Tutorial"
        }
        
        return "Tutorial"
    }
    
    class func textMainMenuExit(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Sair"
        }
        
        return "Exit"
    }
    
    class func textMainMenuLogOut(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Desconectar"
        }
        
        return "LogOut"
    }
    
    class func textSendTutorial(lan: String) -> String {
        
        if(lan == "pt-br") {
            return "Toque na nuvem para\ncompartilhar sua ideia!"
        }
        
        return "Tap on the cloud to\nshare your idea!"
    }
    
}
