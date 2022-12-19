//
//  DebuggingSceneDelegate.swift
//  EssentialApp
//
//  Created by Trip Phillips on 12/19/22.
//

import UIKit
import EssentialFeed

#if DEBUG
class DebuggingSceneDelegate: SceneDelegate {
    override func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        #if DEBUG
        if CommandLine.arguments.contains("-reset") {
            try? FileManager.default.removeItem(at: localStoreURL)
        }
        #endif
        
        super.scene(scene, willConnectTo: session, options: connectionOptions)
    }
    
    override func makeRemoteClient() -> HTTPClient {
        #if DEBUG
        if UserDefaults.standard.string(forKey: "connectivity") == "offline" {
            return AlwaysFailingHTTPClient()
        }
        #endif
        
        return super.makeRemoteClient()
    }
}

private class AlwaysFailingHTTPClient: HTTPClient {
    
    private class Task: HTTPClientTask {
        func cancel() {}
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> EssentialFeed.HTTPClientTask {
        completion(.failure(NSError(domain: "offline", code: 0)))
        return Task()
    }
}
#endif
