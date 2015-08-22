package linksharing

class Invitation {

    String email
    User user
    static  constraints = {
        email(nullable: true)
        user(nullable: true)
    }
    static belongsTo = [topic:Topic]

}
