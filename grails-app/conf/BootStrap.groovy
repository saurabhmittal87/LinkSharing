import global.MyEnum
import linksharing.Resource
import linksharing.Topic
import linksharing.User

class BootStrap {

    def init = { servletContext ->

        createUser()
    }

    def createUser= {

        User user = new User()
        user.admin = true
        user.gender = MyEnum.Gender.Male
        user.email = 'saurabh.mittal@tothenew.com'
        user.firstName = "Saurabh"
        user.imagePath = null;
        user.lastName = "Mittal"
        user.password = "aaaa"
        user.topic = null;
        user.username = "saurabhmittal1987"

        user.save(flush: true)

        Topic topic = new Topic()
        topic.visibility = MyEnum.Visibility.PUBLIC
        topic.resource =  null;
        topic.name = "Grails"
        topic.user = user
        topic.save(flush: true)


        Resource resource1 = new Resource()
        resource1.rating = 1
        resource1.topic = topic
        resource1.description = "Sample Text 1"
        resource1.save(flush: true)

        Resource resource2 = new Resource()
        resource2.rating = 2
        resource2.topic = topic
        resource2.description = "Sample Text 2"
        resource2.save(flush: true)

        Resource resource3 = new Resource()
        resource3.rating = 3
        resource3.topic = topic
        resource3.description = "Sample Text 3"
        resource3.save(flush: true)

        Resource resource4 = new Resource()
        resource4.rating = 4
        resource4.topic = topic
        resource4.description = "Sample Text 4"
        resource4.save(flush: true)

        Resource resource5 = new Resource()
        resource5.rating = 5
        resource5.topic = topic
        resource5.description = "Sample Text 5"
        resource5.save(flush: true)

        Resource resource6 = new Resource()
        resource6.rating = 0
        resource6.topic = topic
        resource6.description = "Sample Text 0"
        resource6.save(flush: true)

        Resource resource7 = new Resource()
        resource7.rating = 5
        resource7.topic = topic
        resource7.description = "Sample Text 5"
        resource7.save(flush: true)

    }
    def destroy = {
    }
}
