package linksharing

import global.MyEnum
import org.springframework.web.multipart.MultipartFile

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    String imagePath
    Boolean admin
    MyEnum.Gender gender
    Date dateCreated
    Date lastUpdated

    static hasMany = [topic: Topic]

    static mapping = {
//        password column: '`password`'
    }

    static constraints = {
        email(unique: true, email: true, blank: false)
        username(unique: true, blank: false)
        password(blank: false, password: true)
        imagePath(nullable: true)
        topic(nullable: true)
    }

    boolean equals(other) {
        if (!(other instanceof User)) {
            return false
        }

        other.email == this.email && other.username == this.username
    }

//    def beforeInsert() {
//        encodePassword()
//    }
//
//    def beforeUpdate() {
//        if (isDirty('password')) {
//            encodePassword()
//        }
//    }
//
//    protected void encodePassword() {
//        password = springSecurityService.encodePassword(password)
//    }

    String toString(){
        username
    }
}
