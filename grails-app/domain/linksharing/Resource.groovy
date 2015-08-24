package linksharing

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    String urlPath
    String file
    Boolean isRead = false
    static transients = ['urlPath', 'file','isRead']
    static constraints = {
        description(nullable: true)
        urlPath(nullable: true)
        file(nullable: true)
    }
    static belongsTo = [topic: Topic, user: User]

    static hasMany = [readingStatus: ReadingStatus, rating: Rating]
    static mapping = {
        tablePerHierarchy false
//        readingStatus cascade: 'all-delete-orphan'
    }
}