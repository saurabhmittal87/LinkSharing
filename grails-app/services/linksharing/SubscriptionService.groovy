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
                subscription.seriousness = MyEnum.Seriousness.Casual
                subscription.topic = topic
                subscription.user = user
                subscription.save(flush: true)
            }
        else if(action.equals(MyEnum.SubscriptionStatus.Unsubscribe.toString())) {
            subscription.delete(flush: true)
        }
    }

    void updateTopicSubscriptionField(User user, Topic topic)
    {
        Subscription subscription = Subscription.findByUserAndTopic(user,topic)
        if(subscription)
        {
            topic.isSubscribed = true
            topic.seriousness = subscription.seriousness
        }
    }

    def updateSubscription(User user, Topic topic, String seriousness)
    {
        Subscription subscription = Subscription.findByUserAndTopic(user, topic);

        if(seriousness.equals(MyEnum.Seriousness.Very_Serious.toString()))
            subscription.seriousness = MyEnum.Seriousness.Very_Serious
        else if(seriousness.equals(MyEnum.Seriousness.Serious.toString()))
            subscription.seriousness = MyEnum.Seriousness.Serious
        else if(seriousness.equals(MyEnum.Seriousness.Casual.toString()))
            subscription.seriousness = MyEnum.Seriousness.Casual

        subscription.save(flush: true)


    }
}
