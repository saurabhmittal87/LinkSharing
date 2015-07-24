package linksharing

class Subscription {

    enum Seriousness {
        VERY_SERIOUS, SERIOUS, CASUAL
    }
//    Topic topic
//    User user
    Seriousness seriousness
    Date dateCreated

    static constraints = {
    }

    static belongsTo = [topic: Topic, user: User]
}
