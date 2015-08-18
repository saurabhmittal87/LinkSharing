package linksharing

class Rating {

    Integer rating

    static belongsTo = [user: User, resource: Resource]
    static constraints = {
        rating (range: 0..5, nullable: true)
    }
}