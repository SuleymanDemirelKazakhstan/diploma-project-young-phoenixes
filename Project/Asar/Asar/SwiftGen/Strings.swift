// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Разрешить
  internal static let allow = L10n.tr("Localizable", "allow")
  /// Красота
  internal static let beautyTitle = L10n.tr("Localizable", "beautyTitle")
  /// Отклонить
  internal static let cancel = L10n.tr("Localizable", "cancel")
  /// Грузоперевозка
  internal static let cargoTitle = L10n.tr("Localizable", "cargoTitle")
  /// Категории
  internal static let categoriesTitle = L10n.tr("Localizable", "categoriesTitle")
  /// Выберите роль
  internal static let chooseRole = L10n.tr("Localizable", "chooseRole")
  /// Уборка
  internal static let cleaningTitle = L10n.tr("Localizable", "cleaningTitle")
  /// Подтвердить
  internal static let confirm = L10n.tr("Localizable", "confirm")
  /// Разрешить приложению 'ASAR' прочитать сообщение ниже и ввести код
  internal static let confirmationAlert = L10n.tr("Localizable", "confirmationAlert")
  /// Еще нет аккаунта?
  internal static let dontHaveAccTitle = L10n.tr("Localizable", "dontHaveAccTitle")
  /// Электрик
  internal static let electicianTitle = L10n.tr("Localizable", "electicianTitle")
  /// Рекомендуемые
  internal static let featuredTitle = L10n.tr("Localizable", "featuredTitle")
  /// Забыли пароль?
  internal static let forgotPasswordButton = L10n.tr("Localizable", "forgotPasswordButton")
  /// Бытовой ремонт
  internal static let householdRepairsTitle = L10n.tr("Localizable", "householdRepairsTitle")
  /// Установить
  internal static let input = L10n.tr("Localizable", "input")
  /// Установить пароль
  internal static let inputPassword = L10n.tr("Localizable", "inputPassword")
  /// Войти
  internal static let logInButton = L10n.tr("Localizable", "logInButton")
  /// Ищу работу
  internal static let lookingForJob = L10n.tr("Localizable", "lookingForJob")
  /// Ищу специалиста
  internal static let lookingForSpecialist = L10n.tr("Localizable", "lookingForSpecialist")
  /// Главная
  internal static let mainTabBarTitle = L10n.tr("Localizable", "mainTabBarTitle")
  /// Зарегистрироваться
  internal static let makeRegistrationButton = L10n.tr("Localizable", "makeRegistrationButton")
  /// Мои заявки
  internal static let myOrdersTabBarTitle = L10n.tr("Localizable", "myOrdersTabBarTitle")
  /// Заказать
  internal static let orderTabBarTitle = L10n.tr("Localizable", "orderTabBarTitle")
  /// Пароль
  internal static let passwordPlaceholder = L10n.tr("Localizable", "passwordPlaceholder")
  /// Номер телефона
  internal static let phoneNumberPlaceholder = L10n.tr("Localizable", "phoneNumberPlaceholder")
  /// Сантехник
  internal static let plumberTitle = L10n.tr("Localizable", "plumberTitle")
  /// Я соглашаюсь с условиями сервиса и политикой конфиденциальности
  internal static let privacyPolicy = L10n.tr("Localizable", "privacyPolicy")
  /// Профиль
  internal static let profileTabBarTitle = L10n.tr("Localizable", "profileTabBarTitle")
  /// Регистрация
  internal static let registrationTitle = L10n.tr("Localizable", "registrationTitle")
  /// Чтобы закончить регистрацию, нужно выбрать
  internal static let subtitleChooseRole = L10n.tr("Localizable", "subtitleChooseRole")
  /// Придумайте пароль, содержащие латинские буквы, заглавные буквы, цифры и знаки пропинания ! @ $ % ^ ( ) _ - +
  internal static let subtitleInputPassword = L10n.tr("Localizable", "subtitleInputPassword")
  /// Введите номер телефона, чтобы начать регистрацию
  internal static let subtitleOfRegistrationTitle = L10n.tr("Localizable", "subtitleOfRegistrationTitle")
  /// Введите данные, указанные при регистрации
  internal static let subtitleOfWelcomeTitle = L10n.tr("Localizable", "subtitleOfWelcomeTitle")
  /// Введите код авторизации, полученный по SMS на номер
  internal static let subtitleСonfirmation = L10n.tr("Localizable", "subtitleСonfirmation")
  /// Добро пожаловать!
  internal static let welcomeTitle = L10n.tr("Localizable", "welcomeTitle")
  /// Подтверждение
  internal static let сonfirmationTitle = L10n.tr("Localizable", "сonfirmationTitle")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
