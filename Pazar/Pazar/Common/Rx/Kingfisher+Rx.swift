//
//  Kingfisher+Rx.swift
//  Pazar
//
//  Created by tsamodol on 15.09.2021..
//

import Kingfisher
import RxCocoa
import RxSwift

public extension Reactive where Base == KingfisherWrapper<KFCrossPlatformImageView> {
    func setImage(with source: Source?,
                  placeholder: Placeholder? = nil,
                  options: KingfisherOptionsInfo? = nil) -> Single<KFCrossPlatformImage> {
        Single.create { [base] single in
            let task = base.setImage(with: source,
                                     placeholder: placeholder,
                                     options: options,
                                     completionHandler: { result in
                                         switch result {
                                         case let .success(value):
                                             single(.success(value.image))
                                         case let .failure(error):
                                             single(.error(error))
                                         }
                                     })
            return Disposables.create { task?.cancel() }
        }
    }

    func setImage(with resource: Resource?,
                  placeholder: Placeholder? = nil,
                  options: KingfisherOptionsInfo? = nil) -> Single<KFCrossPlatformImage> {
        let source: Source?
        if let resource = resource {
            source = Source.network(resource)
        } else {
            source = nil
        }
        return setImage(with: source, placeholder: placeholder, options: options)
    }

    func image(placeholder: Placeholder? = nil,
               options: KingfisherOptionsInfo? = nil) -> Binder<Resource?> {
        // `base.base` is the `Kingfisher` class' associated `ImageView`.
        return Binder(base.base) { imageView, image in
            imageView.kf.setImage(with: image,
                                  placeholder: placeholder,
                                  options: options)
        }
    }
}

extension KingfisherWrapper: ReactiveCompatible {}
