import global.MyEnum
import linksharing.DocumentResource
import linksharing.LinkResource
import linksharing.ReadingStatus
import linksharing.Resource
import linksharing.Subscription
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
        user.fileExtention = ".jpg";
        user.lastName = "Mittal"
        user.password = "aaaa"
        user.topic = null;
        user.username = "saurabhmittal1987"
        user.active = true
        user.save(flush: true)

        User user2 = new User()
        user2.admin = false
        user2.gender = MyEnum.Gender.Female
        user2.email = 'new.user@tothenew.com'
        user2.firstName = "User"
        user2.fileExtention = ".jpg";
        user2.lastName = "Kumar"
        user2.password = "aaaa"
        user2.topic = null;
        user2.active = true
        user2.username = "user1987"
        user2.save(flush: true)


        Topic topic = new Topic()
        topic.visibility = MyEnum.Visibility.Public
        topic.resource =  null;
        topic.name = "Grails"
        topic.user = user
        topic.save(flush: true)

        Topic topic2 = new Topic()
        topic2.visibility = MyEnum.Visibility.Public
        topic2.resource =  null;
        topic2.name = "Java"
        topic2.user = user2
        topic2.save(flush: true)

        Topic topic3 = new Topic()
        topic3.visibility = MyEnum.Visibility.Public
        topic3.resource =  null;
        topic3.name = "PeopleSoft"
        topic3.user = user2
        topic3.save(flush: true)

        Topic topic4 = new Topic()
        topic4.visibility = MyEnum.Visibility.Public
        topic4.resource =  null;
        topic4.name = "PeopleSoft"
        topic4.user = user
        topic4.save(flush: true)

        Topic topic5 = new Topic()
        topic5.visibility = MyEnum.Visibility.Private
        topic5.resource =  null;
        topic5.name = "Groovy"
        topic5.user = user
        topic5.save(flush: true)

        Topic topic6 = new Topic()
        topic6.visibility = MyEnum.Visibility.Private
        topic6.resource =  null;
        topic6.name = "Oracle"
        topic6.user = user2
        topic6.save(flush: true)


        Topic topic7 = new Topic()
        topic7.visibility = MyEnum.Visibility.Private
        topic7.resource =  null;
        topic7.name = "PHP"
        topic7.user = user
        topic7.save(flush: true)

        Topic topic8 = new Topic()
        topic8.visibility = MyEnum.Visibility.Private
        topic8.resource =  null;
        topic8.name = "WordPress"
        topic8.user = user
        topic8.save(flush: true)


        Topic topic9 = new Topic()
        topic9.visibility = MyEnum.Visibility.Private
        topic9.resource =  null;
        topic9.name = "Joomla"
        topic9.user = user2
        topic9.save(flush: true)

//        Subscription subscription1 = new Subscription()
//        subscription1.seriousness = MyEnum.Seriousness.CASUAL
//        subscription1.topic = topic
//        subscription1.user = user
//        subscription1.save(flush: true, failOnError: true)
//
//        Subscription subscription2 = new Subscription()
//        subscription2.seriousness = MyEnum.Seriousness.CASUAL
//        subscription2.topic = topic3
//        subscription2.user = user
//        subscription2.save(flush: true, failOnError: false)
//
//        Subscription subscription3 = new Subscription()
//        subscription3.seriousness = MyEnum.Seriousness.CASUAL
//        subscription3.topic = topic4
//        subscription3.user = user
//        subscription3.save(flush: true, failOnError: false)
//
//        Subscription subscription5 = new Subscription()
//        subscription5.seriousness = MyEnum.Seriousness.CASUAL
//        subscription5.topic = topic5
//        subscription5.user = user
//        subscription5.save(flush: true, failOnError: false)
//
//        Subscription subscription4 = new Subscription()
//        subscription4.seriousness = MyEnum.Seriousness.CASUAL
//        subscription4.topic = topic
//        subscription4.user = user2
//        subscription4.save(flush: true, failOnError: false)
//
//        Subscription subscription6 = new Subscription()
//        subscription6.seriousness = MyEnum.Seriousness.CASUAL
//        subscription6.topic = topic2
//        subscription6.user = user2
//        subscription6.save(flush: true, failOnError: false)
//
//
//        Subscription subscription7 = new Subscription()
//        subscription7.seriousness = MyEnum.Seriousness.CASUAL
//        subscription7.topic = topic3
//        subscription7.user = user2
//        subscription7.save(flush: true, failOnError: false)
//
//        Subscription subscription8 = new Subscription()
//        subscription8.seriousness = MyEnum.Seriousness.CASUAL
//        subscription8.topic = topic6
//        subscription8.user = user2
//        subscription8.save(flush: true, failOnError: false)



        LinkResource resource1 = new LinkResource()
        resource1.user = user
        resource1.topic = topic
        resource1.description = "Resource 1"
        resource1.url = "http://www.google.co.in"
        resource1.save(flush: true)

        LinkResource resource2 = new LinkResource()
        resource2.user = user
        resource2.topic = topic
        resource2.description = "Resource 2"
        resource2.url = "http://www.yahoo.com"
        if(resource2.validate()){
            resource2.save(flush: true)
        }else {
            println resource2.errors
        }


        LinkResource resource3 = new LinkResource()
        resource3.topic = topic
        resource3.user = user
        resource3.url = "http://www.tothenew.com"
        resource3.description = "Resource 3"
        resource3.save(flush: true)

        DocumentResource resource4 = new DocumentResource()
        resource4.topic = topic
        resource4.user = user
        resource4.description = "Resource 4"
        resource4.filePath = "PAth1"
        resource4.save(flush: true)

        DocumentResource resource5 = new DocumentResource()
        resource5.user = user
        resource5.topic = topic
        resource5.description = "Resource 5"
        resource5.filePath = "PAth1"
        if(resource5.validate())
            resource5.save(flush: true)
        else
            println resource5.errors

        DocumentResource resource6 = new DocumentResource()
        resource6.topic = topic
        resource6.description = "Resource 6"
        resource6.user = user
        resource6.filePath = "PAth1"
        resource6.save(flush: true)

        DocumentResource resource7 = new DocumentResource()
        resource7.topic = topic2
        resource7.description = "Resource 7"
        resource7.user = user
        resource7.filePath = "PAth1"
        resource7.save(flush: true)

    }
    def destroy = {
    }
}
