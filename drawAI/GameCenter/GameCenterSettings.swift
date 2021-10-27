//
//  GameCenterViewModel.swift
//  drawAI
//
//  Created by Alessandro Negrão on 26/10/21.
//

import Foundation
import GameKit

class GameCenterSettings{
    
    private var board: GKLeaderboard?
    var scorePoint: Int = 5
    
    func authenticateUser(){
        let player = GKLocalPlayer.local
        player.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.isActive = player.isAuthenticated
        }
    }
    
    func submitScoreToLeaderboard(){
        GKLeaderboard.submitScore(scorePoint, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.animeiml.drawAI"]) { (error) in
            
        }
    }
}
