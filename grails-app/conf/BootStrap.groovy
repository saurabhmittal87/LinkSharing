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

        User user2 = new User()
        user2.admin = true
        user2.gender = MyEnum.Gender.Female
        user2.email = 'new.user@tothenew.com'
        user2.firstName = "User"
        user2.imagePath = null;
        user2.lastName = "Kumar"
        user2.password = "aaaa"
        user2.topic = null;
        user2.username = "user1987"
        user2.save(flush: true)


        Topic topic = new Topic()
        topic.visibility = MyEnum.Visibility.PUBLIC
        topic.resource =  null;
        topic.name = "Grails"
        topic.user = user
        topic.save(flush: true)

        Topic topic2 = new Topic()
        topic2.visibility = MyEnum.Visibility.PUBLIC
        topic2.resource =  null;
        topic2.name = "Java"
        topic2.user = user2
        topic2.save(flush: true)

        Topic topic3 = new Topic()
        topic3.visibility = MyEnum.Visibility.PUBLIC
        topic3.resource =  null;
        topic3.name = "PeopleSoft"
        topic3.user = user
        topic3.save(flush: true)

        Topic topic4 = new Topic()
        topic4.visibility = MyEnum.Visibility.PRIVATE
        topic4.resource =  null;
        topic4.name = ".NET"
        topic4.user = user2
        topic4.save(flush: true)


        Resource resource1 = new Resource()
        resource1.rating = 5
        resource1.topic = topic4
        resource1.description = "Resource 1"
        resource1.save(flush: true)

        Resource resource2 = new Resource()
        resource2.rating = 5
        resource2.topic = topic
        resource2.description = "Resource 2"
        resource2.save(flush: true)

        Resource resource3 = new Resource()
        resource3.rating = 4
        resource3.topic = topic2
        resource3.description = "Resource 3"
        resource3.save(flush: true)

        Resource resource4 = new Resource()
        resource4.rating = 4
        resource4.topic = topic2
        resource4.description = "Resource 4"
        resource4.save(flush: true)

        Resource resource5 = new Resource()
        resource5.rating = 5
        resource5.topic = topic3
        resource5.description = "Resource 5"
        resource5.save(flush: true)

        Resource resource6 = new Resource()
        resource6.rating = 0
        resource6.topic = topic
        resource6.description = "Resource 6"
        resource6.save(flush: true)

        Resource resource7 = new Resource()
        resource7.rating = 5
        resource7.topic = topic2
        resource7.description = "Resource 7"
        resource7.save(flush: true)

    }
    def destroy = {
    }
}
