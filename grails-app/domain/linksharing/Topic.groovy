package linksharing

class Topic {

    enum Visibility {
        PUBLIC, PRIVATE
    }
    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
//    User user

    static hasMany = [resource: Resource, subscription: Subscription]
    static constraints = {
    }

    static belongsTo = [user: User]
}
