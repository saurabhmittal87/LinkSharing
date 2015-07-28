package linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

   SubscriptionService subscriptionService

   def getTopicCountByUser(User user){

       Topic.createCriteria().count(){
//           createAlias("user","_user")
           eq("user",user)
       }
   }

    def getSubscriptionCount(Topic topic)
    {
        subscriptionService.getSubscriptionCount(topic)
    }

    def getTopicsSubscribedByUser(User user){

        Topic.createCriteria().list(){
            eq("user", user)
            'subscription'{
                eq("user", user)
                eq("topic", it)
            }
        }

    }
}
