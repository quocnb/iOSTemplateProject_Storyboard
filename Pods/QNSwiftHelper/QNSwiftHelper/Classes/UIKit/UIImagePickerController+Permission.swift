//
//  UIImagePickerController+ObtainPermission.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit
import Photos
import AVFoundation

public extension UIImagePickerController {
    typealias PermissionHandler = () -> Void

    static func requestPermission(for mediaType: UIImagePickerController.SourceType, success: PermissionHandler?, fail: PermissionHandler?) {
        switch mediaType {
        case .camera:
            requestCameraPermission(success: success, fail: fail)
        default:
            requestPhotoLibraryPermission(success: success, fail: fail)
        }
    }

    static func requestCameraPermission(success: PermissionHandler?, fail: PermissionHandler?) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            DispatchQueue.main.async {
                success?()
            }
        case .denied, .restricted:
            DispatchQueue.main.async {
                fail?()
            }
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted) in
                DispatchQueue.main.async {
                    if granted {
                        success?()
                    } else {
                        fail?()
                    }
                }
            })
        @unknown default:
            fail?()
        }
    }

    static func requestPhotoLibraryPermission(success: PermissionHandler?, fail: PermissionHandler?) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            DispatchQueue.main.async {
                success?()
            }
        case .denied, .restricted:
            DispatchQueue.main.async {
                fail?()
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        success?()
                    }
                case .denied, .restricted:
                    DispatchQueue.main.async {
                        fail?()
                    }
                default:
                    break
                }
            })
        @unknown default:
            fail?()
        }
    }
}
