import linksharing.User

class BootStrap {

    def init = { servletContext ->

        createUser()
    }

    def createUser= {

//        User user = new User()
//        user.admin = true
//        user.email = 'saurabh.mittal@tothenew.com'
//        user.firstName = "Saurabh"
//        user.imagePath = null;
//        user.lastName = "Mittal"
//        user.password = "aaaa"
//        user.topic = null;
//        user.username = "aaaa"
//
//        user.save(flush: true)
    }
    def destroy = {
    }
}
