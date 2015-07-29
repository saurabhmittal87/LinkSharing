package linksharing

import global.MyEnum

class Subscription implements Serializable {

    MyEnum.Seriousness seriousness
    Date dateCreated

    static constraints = {
    }

    static belongsTo = [topic: Topic, user: User]

    static mapping = {
        id composite:['topic', 'user']
    }
}
