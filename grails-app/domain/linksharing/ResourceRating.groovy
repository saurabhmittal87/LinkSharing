package linksharing

import org.apache.commons.lang.builder.HashCodeBuilder

class ResourceRating implements Serializable{

    Resource resource
    User user
    Integer score

    static mapping = {
        id composite: ['resource', 'user']
    }

    static constraints = {

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
