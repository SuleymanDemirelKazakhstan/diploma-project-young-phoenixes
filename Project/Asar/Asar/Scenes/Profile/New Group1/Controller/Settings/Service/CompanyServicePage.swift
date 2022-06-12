//
//  CompanyServicePage.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 10.06.2022.
//

import UIKit

class CompanyServicePage: UIViewController {

    private let items: [CellConfigurator] = [
        ServiceCellConfigurator(item: ServiceModel(
            conflabel: "Услуги компании",
            firstlabel: "Компания вправе оказывать Пользователю Услуги (далее - Услуги) по предоставлению информации о порядке размещения/уже размещенной на Интернет-ресурсе Заявке Заказчика и возможности его принять и (или) исполнить, а также Анкете Специалиста.",
            secondlabel: "Компания обязуется: оказывать Пользователю Услуги в порядке и на условиях, определенных в Соглашении об использовании Интернет-ресурса ASAR; при оказании Услуг обеспечить возможность доступа Пользователя к данным Профиля с использованием логина и пароля; считать оплатой Пользователя за Услуги те денежные средства, в назначении платежа которых был указан номер лицевого счета (уникальный номер, позволяющий Компании идентифицировать Пользователя).",
            thirdlabel: " Компания имеет право: временно приостановить оказание Пользователю Услуг по техническим, технологическим или иным причинам, препятствующим оказанию Услуг, на время устранения таких причин; приостановить оказание услуг Пользователю в следующих случаях наличия подозрений о взломе Пользователя третьими лицами; приостановить оказание Услуг и/или досрочно расторгнуть Соглашение об использовании Интернет-ресурса ASAR в одностороннем внесудебном порядке путем направления соответствующего уведомления Пользователю на номер телефона, указанный последним при использовании Интернет-ресурса, в случаях нарушения Пользователем обязательств и/или гарантий, принятых в соответствии с Соглашением об использовании Интернет-ресурса ASAR; досрочно расторгнуть Соглашение об использовании Интернет-ресурса naimi.kz в одностороннем внесудебном порядке путем направления соответствующего уведомления Пользователю на номер телефона, указанный последним при использовании Интернет-ресурса, в случае нарушения Пользователем срока и порядка оплаты Услуг.",
            fourthlabel: "  Компания имеет право: временно приостановить оказание Пользователю Услуг по техническим, технологическим или иным причинам, препятствующим оказанию Услуг, на время устранения таких причин; приостановить оказание услуг Пользователю в следующих случаях наличия подозрений о взломе Пользователя третьими лицами; приостановить оказание Услуг и/или досрочно расторгнуть Соглашение об использовании Интернет-ресурса ASAR в одностороннем внесудебном порядке путем направления соответствующего уведомления Пользователю на номер телефона, указанный последним при использовании Интернет-ресурса, в случаях нарушения Пользователем обязательств и/или гарантий, принятых в соответствии с Соглашением об использовании Интернет-ресурса ASAR; досрочно расторгнуть Соглашение об использовании Интернет-ресурса naimi.kz в одностороннем внесудебном порядке путем направления соответствующего уведомления Пользователю на номер телефона, указанный последним при использовании Интернет-ресурса, в случае нарушения Пользователем срока и порядка оплаты Услуг.",
            fifthlabel: "  Пользователь имеет право: пользоваться Услугами Компании при условии Акцепта Соглашения об использовании Интернет-ресурса ASAR, в качестве Оферты; ринимать оказанные Компанией Услуги в порядке и в сроки, установленные Соглашением об использовании Интернет-ресурса ASAR. Пользователь обязуется: при пользовании Услугами Компании соблюдать все условия оказания Услуг, установленные в Соглашении об использовании Интернет-ресурса ASAR; своевременно оплачивать Услуги Компании; при оплате Услуг Компании указывать номер лицевого счета (уникальный номер, позволяющий Компании идентифицировать Пользователя); не злоупотреблять предоставленными возможностями, не использовать самостоятельно или с привлечением третьих лиц оказание Услуг и/или возможности использования Сервисов Компании в целях, которые могут быть квалифицированы как нарушение прав третьих лиц на объекты интеллектуальной собственности, недобросовестная конкуренция, иное нарушение закона; не осуществлять действий, которые влияют на нормальную работу Интернет-ресурса.",
            sixlabel: " Пользователь самостоятельно несет ответственность за сохранность и конфиденциальность регистрационных данных (логин и пароль). Все действия, осуществленные в отношении оказанных Компанией Услуг с использованием логина и пароля Пользователя, считаются осуществленными им самим. Пользователь самостоятельно несет ответственность перед третьими лицами за все действия, совершенные с использованием своих регистрационных данных (логина и пароля). Компания не несет ответственности за несанкционированное использование регистрационных данных Пользователя третьими лицами. Стоимость Услуг Компании определяется в зависимости от типа Заявки и проффесиональности Специалиста. Стоимость Услуг Компании оплачивается в тенге. Компания оказывает Услуги Пользователю на условиях авансовой оплаты. Верифицированный Пользователь обязуется указывать номер лицевого счета (уникальный номер, позволяющий Компании идентифицировать Пользователя) при оплате Услуг Компании. Способы оплаты Услуг Компании указаны в разделе «Баланс» настоящего Соглашения.",
            seventhlabel: "  Услуги считаются оказанными Компанией Пользователю: После получения номера телефона заказчика либо личного сообщения от заказчика в Заявке, по которой был отправлен Отклик Специалистом; После покупки одного из пакетов Безлимита; После получения контактных данных Специалиста из Каталога. Услуги считаются оплаченными Пользователем с момента получения Компанией подтверждения из банка о поступлении всей суммы оплаты на расчетный счет Компании либо признания Компанией факта платежа в пользу Компании через платежную систему в случае осуществления Пользователем электронного платежа. Компания оставляет за собой право внести изменения в условия настоящего Соглашения и/или отозвать Соглашение в любой момент по своему усмотрению. В случае внесения Компанией изменений в Соглашение, такие изменения вступают в силу с момента размещения измененного текста Соглашения в сети Интернет по адресу: https:/asar.kz/legal вступления изменений в силу не определен дополнительно в самом Соглашении. Просмотр данной страницы в сети Интернет для ознакомления с действующей редакцией Соглашения является личной ответственностью каждого Посетителя и/или Пользователя (в том числе Специалиста). В течение срока действия Соглашения Компания предпримет все усилия для устранения каких-либо сбоев и ошибок в работе Интернет-ресурса, в случае их возникновения, в максимально короткие сроки. При этом Компания не гарантирует отсутствия ошибок и сбоев при размещении Заявок, в том числе в отношении работы программного обеспечения.",
            eightslabel: "Принимая условия настоящего Соглашения путем Акцепта, Пользователь (в том числе Специалист) гарантирует Компании, что: указал достоверные данные, в том числе персональные данные, при регистрации в Интернет-ресурсе и достоверные данные Пользователя (в том числе номер лицевого счета) при проведении платежа за Услуги Компании; заключает Соглашение добровольно, при этом: полностью ознакомился с условиями Соглашения, полностью понимает значение и последствия своих действий в отношении заключения и исполнения Соглашения; обладает всеми правами и полномочиями, необходимыми для заключения и исполнения Соглашения. За нарушение условий Соглашения Стороны несут ответственность, установленную Соглашением и/или действующим законодательством Республики Казахстан. Компания ни при каких обстоятельствах не несет никакой ответственности за: какие-либо действия/бездействие, являющиеся прямым или косвенным результатом действий/бездействия Пользователя (в том числе Специалиста) и/или третьих лиц; какие-либо косвенные убытки и/или упущенную выгоду Пользователя и/или третьих сторон вне зависимости от того, могла ли Компания предвидеть возможность таких убытков или нет; использование (невозможность использования) и какие бы то ни было последствия использования (невозможности использования) Пользователем выбранной им формы оплаты Услуг, а равно использование/невозможность использования Пользователем и/или третьими лицами любых средств и/или способов передачи/получения информации. Пользователь (в том числе Специалист) несет ответственность в полном объеме за соблюдение всех требований законодательства, в том числе законодательства о рекламе, об интеллектуальной собственности, о конкуренции, но не ограничиваясь перечисленным; достоверность сведений, указанных им при регистрации в качестве Пользователя в Интернет-ресурсе. Пользователь обязуется своими силами и за свой счет разрешать споры и урегулировать претензии третьих лиц в отношении выполнения Заявок, либо возместить убытки (включая судебные расходы), причиненные Компании в связи с претензиями и исками, основанием предъявления которых явились действия или бездействия Пользователя при использовании Услуг Компании. В случае, если содержание, форма и/или размещение информации Пользователя на Интернет-ресурсе явилось основанием для предъявления к Компании предписаний по уплате штрафных санкций со стороны государственных органов, Пользователь обязуется незамедлительно по требованию Компании предоставить всю запрашиваемую информацию, касающуюся размещения и содержания информации на Интернет-ресурсе, содействовать Компании в урегулировании предписаний, а также возместить все убытки (включая расходы по уплате штрафов), причиненные Компании вследствие предъявления ей, предписаний в результате размещения информации Пользователя в Интернет-ресурсе. В случае нарушения Пользователем сроков оплаты оказанных Услуг, Компания вправе взыскать с Пользователя неустойку в размере 0,1% от неоплаченной в срок суммы за каждый день просрочки. Компания самостоятельно определяет размер задолженности по оплате Услуг в отношении каждого Пользователя, допустимый для дальнейшего использования им Интернет-ресурса. Компания имеет право направлять смс Посетителям (Пользователям) на номера телефонов, указанные последними при использовании Интернет-ресурса."
        ))
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        return tableView
    }()

    private lazy var tableDirector: TableDirector = {
          let tableDirector = TableDirector(tableView: tableView, items: items)
          return tableDirector
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDirector.tableView.reloadData()
        view.backgroundColor = .systemGray6
        setupLayouts()
    }
    
    private func setupLayouts(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
 
    
}




