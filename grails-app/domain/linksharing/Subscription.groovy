package linksharing

import global.MyEnum

class Subscription {

    MyEnum.Seriousness seriousness
    Date dateCreated

    static constraints = {
    }

    static belongsTo = [topic: Topic, user: User]
}
