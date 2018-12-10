//
//  LoginModule_Extension.swift
//  LoginModule_Extension
//
//  Created by 唐瑞鹏 on 2018/12/10.
//  Copyright © 2018年 rptang. All rights reserved.
//

import CTMediator

public extension CTMediator {
    
    @objc public func LoginModule_showSwift(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"framework_ios_module_login"
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget("LoginModule", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
    @objc public func A_showObjc(callback:@escaping (String) -> Void) -> UIViewController? {
        let callbackBlock = callback as @convention(block) (String) -> Void
        let callbackBlockObject = unsafeBitCast(callbackBlock, to: AnyObject.self)
        let params = ["callback":callbackBlockObject] as [AnyHashable:Any]
        if let viewController = self.performTarget("LoginModule", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}

