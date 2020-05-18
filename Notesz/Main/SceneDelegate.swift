//
//  SceneDelegate.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 03. 10..
//

import UIKit
import SwiftUI

class KeyTestController<Content>: UIHostingController<Content> where Content: View {
    override func becomeFirstResponder() -> Bool {
        true
    }

    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(
                title: "Új feladat",
                image: nil,
                action: #selector(newTask),
                input: "n",
                modifierFlags: .command,
                propertyList: nil,
                alternates: [],
                discoverabilityTitle: "Új feladat",
                attributes: .init(),
                state: .on
            ),
            UIKeyCommand(
                title: "Új projekt",
                image: nil,
                action: #selector(newTask),
                input: "p",
                modifierFlags: .command,
                propertyList: nil,
                alternates: [],
                discoverabilityTitle: "Új projekt",
                attributes: .init(),
                state: .on
            ),
            UIKeyCommand(
                title: "Új csoport",
                image: nil,
                action: #selector(newTask),
                input: "g",
                modifierFlags: .command,
                propertyList: nil,
                alternates: [],
                discoverabilityTitle: "Új csoport",
                attributes: .init(),
                state: .on
            )
        ]
    }

    @objc
    func newTask() {
        print("new task")
    }

    @objc
    func newProject() {
        print("new project")
    }

    @objc
    func newGroup() {
        print("new group")
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
//        let taskListViewModel = TaskListViewModel()
//        let contentView = TaskListView(viewModel: taskListViewModel)

        let contentView = MainView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = KeyTestController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
