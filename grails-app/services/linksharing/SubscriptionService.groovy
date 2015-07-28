package linksharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def getSubscriptionCount(User user){
        Subscription.createCriteria().count(){
            createAlias("user","_user")
            eq("_user",user)
        }
    }

    def getSubscriptionCount(Topic topic){
        Subscription.createCriteria().count(){
            createAlias("topic","_topic")
            eq("_topic",topic)
        }
    }
    def getSubscription(User user){
        Subscription.createCriteria().list(){
            createAlias("user","_user")
            eq("_user",user)
        }
    }

    def getSubscription(Topic topic){
        Subscription.createCriteria().list(){
            createAlias("topic","_topic")
            eq("_topic",topic)
        }
    }


}
