package linksharing

class User {

    String email
    String userName
    String password
    String firstName
    String lastName
    Byte []image
    Boolean admin
    Date dateCreated
    Date lastUpdated

    static hasMany = [topic: Topic]

    static mapping = {
        password column: '`password`'
    }

    static constraints = {
        email(unique: true, email: true, blank: false)
        userName(unique: true, blank: false)
        password(blank: false, password: true)
    }

    boolean equals(other) {
        if (!(other instanceof User)) {
            return false
        }

        other.email == this.email && other.username == this.username
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    String toString(){
        userName
    }
}
