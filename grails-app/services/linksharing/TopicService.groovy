package linksharing

import global.MyEnum
import grails.transaction.Transactional
import org.springframework.web.context.request.RequestContextHolder
@Transactional
class TopicService {

    SubscriptionService subscriptionService
    ResourceService resourceService
   def getTopicCountByUser(User user){

       Topic.createCriteria().count(){
           eq("user",user)
       }
   }

    def getSubscriptionCount(Topic topic)
    {
        subscriptionService.getSubscriptionCountByTopic(topic)
    }

    def getTopicByUser(User user){
        List<Topic> topicList
        if(user.admin) {
            topicList = Topic.createCriteria().list() {
                eq("user", user)
            }
        }
        else{
            topicList = Topic.createCriteria().list {
                eq("user",user)
                eq("visibility",MyEnum.Visibility.PUBLIC)
            }
        }
        return topicList
    }

    def getTrendingTopics()
    {
        List<Topic> topicList = updateTopicsList(Topic.list());

        return topicList.sort {-it.resourceCount}
    }

    def updateTopicsList(List<Topic> topicList)
    {
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        User user  = session.user
        topicList.each {
            Integer resourceCount = resourceService.getResourceCountByTopic(it);
            if (resourceCount != null)
                it.resourceCount = resourceCount

            Integer subscriptionCountByTopic = subscriptionService.getSubscriptionCountByTopic(it);
            if (subscriptionCountByTopic != null)
                it.subscriptionCount = subscriptionCountByTopic;

            it.isSubscribed = subscriptionService.isSubscribed(user,it)

        }
        return  topicList
    }
    
    def getTopicById(Long id)
    {
        Topic.findById(id)
    }

    def getSubscribedUsersByTopic(Topic topic)
    {
        subscriptionService.getSubscribedUsersByTopic(topic)
    }

    def createTopic(String topicName, String visibility, User user)
    {
        Topic topic4 = new Topic(resource: null, name: topicName, user: user)
        if(visibility.equals("Public"))
            topic4.visibility = MyEnum.Visibility.PUBLIC
        else
            topic4.visibility = MyEnum.Visibility.PRIVATE

        if(topic4.validate())
            topic4.save(flush: true)
        else
            println topic4.errors
    }

    def deleteTopicById(Long id)
    {
        Topic topic = Topic.findById(id)
        if(topic)
            topic.delete(flush: true)
    }
}
