//
//  MultipleExpandDefinition.swift
//  Pods
//
//  Created by Dimitar Dimitrov on 4/24/16.
//
//

import Foundation
import SwiftyJSON

public class MultipleExpandDefinition: QueryProtocol {
    var expandDefinitions: [ExpandDefinition]
    
    required public init(expandDefinitions: [ExpandDefinition]){
        self.expandDefinitions = expandDefinitions
    }
    
    public func getJson() -> String {
        let jsonObj = self.getJsonObj()
        return jsonObj.rawString(NSUTF8StringEncoding, options: NSJSONWritingOptions(rawValue: 0))!
    }
    
    public func getJsonObj() -> JSON {
        var exp:[String:[String:String]] = [:]
        for index in 0...self.expandDefinitions.count-1 {
            exp[self.expandDefinitions[index].relationField] = self.expandDefinitions[index].prepareDefinitionObject()
        }
        let expandHeader = JSON(exp)
        return expandHeader
    }
}