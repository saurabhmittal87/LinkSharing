package linksharing

class Resource {

    String description
    Integer rating
    Date dateCreated
    Date lastUpdated

    static constraints = {
        description(nullable: true)
        rating (range: 0..5, nullable: true)

    }

    static belongsTo = [topic: Topic]


}
