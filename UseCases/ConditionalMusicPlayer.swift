//
//  ConditionalMusicPlayer.swift
//  Telephone
//
//  Copyright © 2008-2016 Alexey Kuznetsov
//  Copyright © 2016-2017 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

public final class ConditionalMusicPlayer {
    private let origin: MusicPlayer
    private let settings: MusicPlayerSettings

    public init(origin: MusicPlayer, settings: MusicPlayerSettings) {
        self.origin = origin
        self.settings = settings
    }
}

extension ConditionalMusicPlayer: MusicPlayer {
    @objc public func pause() {
        if settings.shouldPause {
            origin.pause()
        }
    }

    @objc public func resume() {
        if settings.shouldPause {
            origin.resume()
        }
    }
}
