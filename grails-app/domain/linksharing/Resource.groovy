package linksharing

class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static constraints = {
        description(nullable: true)
    }

    static belongsTo = [topic: Topic]


}
