package linksharing

import global.MyEnum
import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    TopicService topicService
    def getSubscriptionCountByUser(User user){
        Subscription.createCriteria().count(){
//            createAlias("user","_user")
            eq("user",user)
        }
    }

    def getSubscriptionCountByTopic(Topic topic){
        Subscription.createCriteria().count(){
            eq("topic",topic)
        }
    }
    def getSubscriptionByUser(User user, Integer lowerLimit, Integer count){
        Subscription.createCriteria().list(){
            eq("user",user)
            firstResult lowerLimit
            maxResults count
        }
    }

    def getSubscriptionByTopic(Topic topic, Integer lowerLimit, Integer count){
        Subscription.createCriteria().list(){
//            createAlias("topic","_topic")
            eq("topic",topic)
            firstResult lowerLimit
            maxResults count
        }
    }

    def getSubscriptionCountByUserAndTopic(User user, Topic topic)
    {
        Subscription.findWhere(user: user, topic: topic)
    }

    def getTopicsSubscribedByUser(User user)
    {
       List<Topic>topicList= Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user", user)
        }

        topicList.each {
            topicService.updateTopic(it)
        }
        return topicList
    }

    def getSubscribedUsersByTopic(Topic topic)
    {
        List<Topic>topicList= Subscription.createCriteria().list {
            projections {
                property("user")
            }
            eq("topic", topic)
        }
    }

    def manageSubscrition(User user, Topic topic, String action)
    {
        Subscription subscription = Subscription.findByUserAndTopic(user,topic)

        if(action.equals(MyEnum.SubscriptionStatus.Subscribe.toString()))
            {
                subscription = new Subscription()
                subscription.seriousness = MyEnum.Seriousness.CASUAL
                subscription.topic = topic
                subscription.user = user
                subscription.save(flush: true)
            }
        else if(action.equals(MyEnum.SubscriptionStatus.Unsubscribe.toString())) {
            subscription.delete(flush: true)
        }
    }

    def Boolean isSubscribed(User user, Topic topic)
    {
        Subscription subscription = Subscription.findByUserAndTopic(user,topic)
        if(subscription)
            return true
        else
            return false
    }
}
