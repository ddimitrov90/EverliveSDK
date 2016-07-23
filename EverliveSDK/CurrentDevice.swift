//
//  CurrentDevice.swift
//  EverliveSDK
//
//  Created by Dimitar Dimitrov on 7/23/16.
//  Copyright © 2016 Dimitar Dimitrov. All rights reserved.
//

import Foundation

public class CurrentDevice {
    var everliveConnection:EverliveConnection
    var pushHandler: PushHandler
    private static var currentDevice:CurrentDevice?
    public static func getInstance(connection: EverliveConnection, pushHandler: PushHandler) -> CurrentDevice {
        if CurrentDevice.currentDevice == nil {
            CurrentDevice.currentDevice = CurrentDevice(connection: connection, pushHandler: pushHandler)
        }
        return CurrentDevice.currentDevice!
    }
    
    private init(connection: EverliveConnection, pushHandler: PushHandler){
        self.everliveConnection = connection
        self.pushHandler = pushHandler
    }
    
    public func register(token: NSData, completionHandler: (Bool, EverliveError?) -> Void) {
        let newDevice = PushDevice()
        newDevice.HardwareId = "k0r"
        var token = token.description.stringByReplacingOccurrencesOfString("<", withString: "")
        token = token.stringByReplacingOccurrencesOfString(">", withString: "")
        token = token.stringByReplacingOccurrencesOfString(" ", withString: "")
        newDevice.PushToken = token
        newDevice.PlatformType = 4
        newDevice.PlatformVersion = UIDevice.currentDevice().systemVersion
        newDevice.Locale = NSLocale.currentLocale().localeIdentifier
        newDevice.TimeZone = NSTimeZone.defaultTimeZone().name
        
        self.pushHandler.Devices().create(newDevice).execute(completionHandler)
    }
    
}