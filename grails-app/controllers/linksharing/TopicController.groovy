package linksharing

class TopicController {

    TopicService topicService
    ResourceService resourceService

    def index() {
        redirect(action:"topic")
    }

    def topic(){
        Topic topic  = topicService.getTopicById(params.topicId.toLong())
        List<Topic> topicList = new ArrayList<Topic>()
        topicList.add(topic)

        List<User> userList = topicService.getSubscribedUsersByTopic(topic)

        List<Resource> resourceList = resourceService.getResourcesByTopic(topic)
        [topicList: topicList,userList: userList, resourceList:resourceList, user:session.user]
    }

    def createtopic(){

        String topicname  = params.topicname
        String visibility = params.topicVisibility
        User user = session.user

        topicService.createTopic(topicname, visibility,user)

        redirect(controller: "user", action: "dashboard")
    }
}
