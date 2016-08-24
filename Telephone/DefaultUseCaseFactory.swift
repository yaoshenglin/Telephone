//
//  DefaultUseCaseFactory.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//  Copyright (c) 2016 64 Characters
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

import UseCases

final class DefaultUseCaseFactory {
    private let repository: SystemAudioDeviceRepository
    private let defaults: StringUserDefaults

    init(repository: SystemAudioDeviceRepository, defaults: StringUserDefaults) {
        self.repository = repository
        self.defaults = defaults
    }
}

extension DefaultUseCaseFactory: UseCaseFactory {
    func createUserDefaultsSoundIOLoadUseCase(output output: UserDefaultsSoundIOLoadUseCaseOutput) -> ThrowingUseCase {
        return UserDefaultsSoundIOLoadUseCase(repository: repository, defaults: defaults, output: output)
    }

    func createUserDefaultsSoundIOSaveUseCase(soundIO soundIO: PresentationSoundIO) -> UseCase {
        return UserDefaultsSoundIOSaveUseCase(soundIO: soundIO, defaults: defaults)
    }

    func createUserDefaultsRingtoneSoundNameSaveUseCase(name name: String) -> UseCase {
        return UserDefaultsRingtoneSoundNameSaveUseCase(name: name, defaults: defaults)
    }
}