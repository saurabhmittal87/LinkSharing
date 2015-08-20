package linksharing

import global.GlobalContent

class TopicController {

    TopicService topicService
    ResourceService resourceService
    InvitationService invitationService
    CommonService commonService
    SubscriptionService subscriptionService
    UserService userService

    def index() {
        redirect(action:"topic")
    }

    def topic(){

        Topic topic  = topicService.getTopicById(params.topicId.toLong())
        List<Topic> topicList = new ArrayList<Topic>()
        topicList.add(topic)
        List<User> userList = topicService.getSubscribedUsersByTopic(topic)

        userList.each {
            userService.updateUser(it,[totalTopics:'',totalSubscriptions:''])
        }
        List<Resource> resourceList = resourceService.getResourcesByTopic(topic)
        Integer resourceCount = resourceList.size()
        resourceList = commonService.getSubList(resourceList,0,GlobalContent.mainItemLimit)
        Boolean invitationStatus = invitationService.isInvitationOpen(session.user, topic)
        [topicList: topicList,userList: userList, resourceList:resourceList,invitationStatus:invitationStatus, topicCount:1, resourceCount:resourceCount, actionname:'null' ]
    }

    def topics(){

        session.user = userService.updateUser(session.user,[totalTopics:'',totalSubscriptions:''])
        List<Topic> topicList = topicService.getTopicListByUser(session.user)
        List<Resource> resourceList =resourceService.getResourcesByTopic(topicList.get(0))
        Integer topicCount = topicList.size()
        Integer resourceCount = resourceList.size()

        topicList = commonService.getSubList(topicList,0,GlobalContent.mainItemLimit)
        resourceList = commonService.getSubList(resourceList,0,GlobalContent.mainItemLimit)

        [topicList: topicList, resourceList:resourceList,topicCount:topicCount,resourceCount:resourceCount]
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
        if(null != offset && null != max)
        {
            Integer offsetValue = params.offset.toString().toInteger()
            Integer maxValue = params.max.toString().toInteger()
            List<Topic> topicList = topicService.getTrendingTopics();
            Integer topicCount = topicList.size();
            topicList = commonService.getSubList(topicList,offsetValue,maxValue)
            render(template: "/layouts/topic", model: [topicList:topicList, topicCount:topicCount, type: params.type,actionname:params.actionname,maxCount:params.maxCount])
        }
    }

    def getTopicList(){
        Integer offset = params.int("offset")
        Integer max = params.int("max")
        if(null != offset && null != max)
        {
            List<Topic> topicList = topicService.getTopicListByUser(session.user)
            Integer topicCount = topicList.size()
            topicList = commonService.getSubList(topicList,offset,max)
            render(template: "/layouts/topic", model: [topicList:topicList, topicCount:topicCount, type: params.type, actionname:params.actionname,maxCount:params.maxCount])
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

    def posts(){

        List<Topic> topicList = topicService.getTopicsCreatedByUser(session.user)
        render(view: "topics")
    }

}
