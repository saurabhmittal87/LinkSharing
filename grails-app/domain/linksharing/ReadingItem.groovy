package linksharing

import org.apache.commons.lang.builder.HashCodeBuilder

class ReadingItem implements Serializable{

    Resource resource
    User user
    Boolean reading

    static mapping = {
        id composite:['resource', 'user']
    }
    static constraints = {
    }

    boolean equals(other) {
        if (!(other instanceof ReadingItem)) {
            return false
        }

        other.resource == this.resource && other.user == this.user
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append resource
        builder.append user
        builder.toHashCode()
    }
}
