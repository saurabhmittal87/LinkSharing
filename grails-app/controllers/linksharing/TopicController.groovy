package linksharing

class TopicController {

    TopicService topicService
    ResourceService resourceService
    InvitationService invitationService
    CommonService commonService
    SubscriptionService subscriptionService

    def index() {
        redirect(action:"topic")
    }

    def topic(){
        Topic topic  = topicService.getTopicById(params.topicId.toLong())
        List<Topic> topicList = new ArrayList<Topic>()
        topicList.add(topic)
        List<User> userList = topicService.getSubscribedUsersByTopic(topic)
        List<Resource> resourceList = resourceService.getResourcesByTopic(topic)
        Boolean invitationStatus = invitationService.isInvitationOpen(session.user, topic)

        [topicList: topicList,userList: userList, resourceList:resourceList,invitationStatus:invitationStatus, topicCount:topicList.size()]
    }

    def createTopic(){

        String topicName  = params.topicname
        String visibility = params.topicVisibility
        User user = session.user

        topicService.createTopic(topicName, visibility,user)

        redirect(controller: "user", action: "dashboard")
    }

    def trendingTopicsList(){
        String offset = params.offset
        String max = params.max
        if(offset && max)
        {
            Integer offsetValue = params.offset.toString().toInteger()
            Integer maxValue = params.max.toString().toInteger()
            List<Topic> topicList = topicService.getTrendingTopics();
            Integer topicCount = topicList.size();
            topicList = commonService.getSubList(topicList,offsetValue,maxValue)
            render(template: "/layouts/topic", model: [topicList:topicList, topicCount:topicCount, type: params.type])
        }
    }

    def updateTopic(){

        HashMap<String,String >valueMap = new HashMap<>()
        User user  = session.user

        valueMap.put("topicId",  params.topicId)
        valueMap.put("name", params.name)
        valueMap.put("userId", user.id.toString())
        if(params.visibility)
            valueMap.put("visibility", params.visibility)

        topicService.updateTopicByMap(valueMap)

        if(params.seriousness)
            subscriptionService.updateSubscription(user, topicService.getTopicById(params.topicId.toLong()), params.seriousness)
    }

}
