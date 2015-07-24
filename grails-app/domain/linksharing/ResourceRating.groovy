package linksharing

import org.apache.commons.lang.builder.HashCodeBuilder

class ResourceRating implements Serializable{

//    Resource resource
//    User user
    Integer score

    static mapping = {
        id composite: ['resource', 'user']
    }

    static belongsTo = [user: User, resource: Resource]

    static constraints = {
        score range: 0..5
    }

    boolean equals(other) {
        if (!(other instanceof ResourceRating)) {
            return false
        }

        other.resource == resource && other.user == user
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append resource
        builder.append user
        builder.toHashCode()
    }
}
