package linksharing

import grails.transaction.Transactional

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

    def getTopicsCreatedByUser(User user){
        List<Topic> topicList = Topic.createCriteria().list(){
            eq("user", user)
        }

        List<Topic> newTopicList = new ArrayList<Topic>();
        topicList.each {
            Subscription subscription = subscriptionService.getSubscriptionCountByUserAndTopic(user,it)
            if(subscription)
                newTopicList.add(it)
            }
        return newTopicList
    }

    def getTrendingTopics()
    {
        List<Topic> topicList = updateTopicsList(Topic.list());

        return topicList.sort {-it.resourceCount}
    }

    def updateTopicsList(List<Topic> topicList)
    {
        topicList.each {
            Integer resourceCount = resourceService.getResourceCountByTopic(it);
            if (resourceCount != null)
                it.resourceCount = resourceCount

            Integer subscriptionCountByTopic = subscriptionService.getSubscriptionCountByTopic(it);
            if (subscriptionCountByTopic != null)
                it.subscriptionCount = subscriptionCountByTopic;
        }
        return  topicList
    }
}
