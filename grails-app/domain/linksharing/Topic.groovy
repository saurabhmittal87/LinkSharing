package linksharing

class Topic {

    enum Visibility {
        PUBLIC, PRIVATE
    }
    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    User user

    static constraints = {
        visibility blank: false
    }

    static belongsTo = [user: User]
}
