package linksharing

class ResourceRating {

    Resource resource
    User user
    Integer score

    static mapping = {
        table "ResourceRating"
        id composite:["resource", "user"]
    }

    static constraints = {

    }
}
