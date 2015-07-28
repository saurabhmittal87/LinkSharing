package linksharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def getSubscriptionCountByUser(User user){
        Subscription.createCriteria().count(){
//            createAlias("user","_user")
            eq("user",user)
        }
    }

    def getSubscriptionCountByTopic(Topic topic){
        Subscription.createCriteria().count(){
//            createAlias("topic","_topic")
            eq("topic",topic)
        }
    }
    def getSubscriptionByUser(User user, Integer lowerLimit, Integer count){
        Subscription.createCriteria().list(){
//            createAlias("user","_user")
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


}
