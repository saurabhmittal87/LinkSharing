package linksharing
import org.grails.rateable.*

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    transient String urlPath
    transient String file

    static transients = ['urlPath', 'file']
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