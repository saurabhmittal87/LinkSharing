package linksharing

import global.MyEnum
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
    
    def getTopicById(Long id)
    {
        Topic.findById(id)
    }

    def getSubscribedUsersByTopic(Topic topic)
    {
        subscriptionService.getSubscribedUsersByTopic(topic)
    }

}
