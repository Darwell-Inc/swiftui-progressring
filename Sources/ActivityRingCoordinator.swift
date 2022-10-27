// The MIT License (MIT)
//
// Copyright (c) 2017 Alexey Grigoriv  <harshilshah1910@me.com>
//

import SwiftUI

final class ActivityRingCoordinator: ObservableObject {
	private(set) var scene: ActivityRingScene = .init()
	private(set) var progress: CGFloat = .zero
    private(set) var size: CGSize = .zero

    func setProgress(_ val: CGFloat) {
        let duration = abs(self.progress - val) * 1.5
        self.progress = val
        scene.animateProgress(to: max(0, val), withDuration: duration)
    }

    func setSize(_ val: CGSize) {
        let minVal = min(val.width, val.height)
        self.size = .init(width: minVal, height: minVal)
        self.scene.size = size
    }

    func setWidth(_ val: CGFloat) {
        self.scene.ringWidth = val
    }

    func applyStyle(_ val: ProgressRing.Style) {
        self.scene.backgroundRingColor = UIColor(val.backgroundColor)
        self.scene.startColor = UIColor(val.tailColor)
        self.scene.endColor = UIColor(val.headColor)
        self.scene.backgroundColor = .clear
    }
}
