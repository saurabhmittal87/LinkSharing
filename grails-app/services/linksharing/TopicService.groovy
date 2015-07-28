package linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

   SubscriptionService subscriptionService

   def getTopicCountByUser(User user){

       Topic.createCriteria().count(){
           createAlias("user","_user")
           eq("_user",user)
       }
   }

    def getSubscriptionCount(Topic topic)
    {
        subscriptionService.getSubscriptionCount(topic)
    }
}
