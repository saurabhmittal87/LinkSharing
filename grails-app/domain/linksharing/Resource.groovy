package linksharing

class Resource {

    String description
    Integer rating
    Date dateCreated
    Date lastUpdated
    transient String urlPath
    transient String file

    static transients = ['urlPath', 'file']
    static constraints = {
        description(nullable: true)
        rating (range: 0..5, nullable: true)
        urlPath(nullable: true)
        file(nullable: true)

    }
    static belongsTo = [topic: Topic, user: User]

    static hasMany = [readingStatus: ReadingStatus]
    static mapping = {
        tablePerHierarchy false
//        readingStatus cascade: 'all-delete-orphan'
    }
}