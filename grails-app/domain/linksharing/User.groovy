package linksharing

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    Byte []image
    Boolean admin
    Date dateCreated
    Date lastUpdated

    static constraints = {
        email(unique: true)
        username(unique: true)
    }

    boolean equals(other) {
        if (!(other instanceof User)) {
            return false
        }

        other.email == this.email && other.username == this.username
    }
}
