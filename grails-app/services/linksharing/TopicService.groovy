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
                eq("visibility",MyEnum.Visibility.Public)
            }
        }
        return topicList
    }

    def getTrendingTopics()
    {
        List<Topic> topicList = new ArrayList<Topic>()
        Topic.list().each() {
            topicList.add(updateTopic(it))
        }
        topicList.sort {-it.resourceCount}
    }

    def Topic updateTopic(Topic topic)
    {
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        User user  = session.user
            Integer resourceCount = resourceService.getResourceCountByTopic(topic);
            if (resourceCount != null)
                topic.resourceCount = resourceCount

            Integer subscriptionCountByTopic = subscriptionService.getSubscriptionCountByTopic(topic);
            if (subscriptionCountByTopic != null)
                topic.subscriptionCount = subscriptionCountByTopic;

        subscriptionService.updateTopicSubscriptionField(user,topic)
        return  topic
    }
    
    def getTopicById(Long id)
    {
        updateTopic(Topic.findById(id))
    }

    def getSubscribedUsersByTopic(Topic topic)
    {
        subscriptionService.getSubscribedUsersByTopic(topic)
    }

    def createTopic(String topicName, String visibility, User user)
    {
        Topic topic = new Topic(resource: null, name: topicName, user: user)
        if(visibility.equals("Public"))
            topic.visibility = MyEnum.Visibility.Public
        else
            topic.visibility = MyEnum.Visibility.Private

        if(topic.validate())
            topic.save(flush: true)
        else
            println topic.errors
    }

    def deleteTopicById(Long id)
    {
        Topic topic = Topic.findById(id)
        if(topic)
            topic.delete(flush: true)
    }

    def updateTopicByMap(HashMap<String,String> valueKey)
    {
        Topic topic  = Topic.findById(valueKey["topicId"].toLong())

        topic.name = valueKey["name"];
        topic.isSubscribed = valueKey["isSubscribed"]

        String visibility = valueKey["visibility"];
        if(visibility.equals(MyEnum.Visibility.Public.toString()))
            topic.visibility = MyEnum.Visibility.Public
        else
            topic.visibility = MyEnum.Visibility.Private

        updateTopic(topic)

        topic.save(flush: true)
    }
}
