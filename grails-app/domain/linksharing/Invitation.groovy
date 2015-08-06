package linksharing

class Invitation {

    Boolean acceptance
    Date dateCreated

    static belongsTo = [user:User, topic:Topic]

    static constraints = {
        acceptance(nullable: true, blank: true)
    }
}
