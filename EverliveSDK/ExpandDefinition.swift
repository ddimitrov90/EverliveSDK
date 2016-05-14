//
//  ExpandDefinition.swift
//  EverliveSwift
//
//  Created by Dimitar Dimitrov on 3/26/16.
//  Copyright © 2016 ddimitrov. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ExpandDefinition : QueryProtocol {
    var relationField: String
    var returnAs: String
    
    convenience public init(relationField: String){
        self.init(relationField: relationField, returnAs: relationField)
    }
    
    required public init(relationField: String, returnAs: String){
        self.relationField = relationField
        self.returnAs = returnAs
    }
    
    public func getJson() -> String {
        let jsonObj = self.getJsonObj()
        return jsonObj.rawString(NSUTF8StringEncoding, options: NSJSONWritingOptions(rawValue: 0))!
    }
    
    public func getJsonObj() -> JSON {
        let expandHeader = [self.relationField : self.prepareDefinitionObject()]
        return JSON(expandHeader)
    }
    
    internal func prepareDefinitionObject() -> [String: String] {
        var expandDefinitionObject:[String:String] = [:]
        expandDefinitionObject["ReturnAs"] = self.returnAs
        return expandDefinitionObject
    }
}