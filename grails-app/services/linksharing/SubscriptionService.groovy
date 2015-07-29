package linksharing

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

        return topicService.updateTopicsList(topicList)

    }


}
