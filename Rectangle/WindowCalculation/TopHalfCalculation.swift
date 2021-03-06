//
//  TopHalfCalculation.swift
//  Rectangle, Ported from Spectacle
//
//  Created by Ryan Hanson on 6/14/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation

class TopHalfCalculation: WindowCalculation, RepeatedExecutionsCalculation {

    override func calculateRect(_ windowRect: CGRect, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {

        if Defaults.subsequentExecutionMode.value == .none
            || lastAction == nil {
            return calculateFirstRect(windowRect, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
        }
        
        return calculateRepeatedRect(windowRect, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
    }
    
    
    func calculateFirstRect(_ windowRect: CGRect, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var oneHalfRect = visibleFrameOfScreen
        oneHalfRect.size.height = floor(oneHalfRect.height / 2.0)
        oneHalfRect.origin.y += oneHalfRect.height + (visibleFrameOfScreen.height.truncatingRemainder(dividingBy: 2.0))
        return RectResult(oneHalfRect)
    }
    
    func calculateSecondRect(_ windowRect: CGRect, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var twoThirdsRect = visibleFrameOfScreen
        twoThirdsRect.size.height = floor(visibleFrameOfScreen.height * 2 / 3.0)
        twoThirdsRect.origin.y = visibleFrameOfScreen.origin.y + visibleFrameOfScreen.height - twoThirdsRect.height
        return RectResult(twoThirdsRect)
    }
    
    func calculateThirdRect(_ windowRect: CGRect, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var oneThirdRect = visibleFrameOfScreen
        oneThirdRect.size.height = floor(visibleFrameOfScreen.height / 3.0)
        oneThirdRect.origin.y = visibleFrameOfScreen.origin.y + visibleFrameOfScreen.height - oneThirdRect.height
        return RectResult(oneThirdRect)
    }
}
