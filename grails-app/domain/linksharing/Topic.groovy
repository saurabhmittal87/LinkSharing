package linksharing

class Topic {

    enum Visibility {
        PUBLIC, PRIVATE
    }
    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    User createdBy

    static constraints = {
        visibility blank: false
    }

    static belongsTo = [createdBy: User]
}
