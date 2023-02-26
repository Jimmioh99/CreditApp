//
//  Assembler.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([PresentationAssembly()], container: container)
        return assembler
    }()
}
