package linksharing

class TopicController {

    TopicService topicService
    ResourceService resourceService

    def index() {
        redirect(action:"topic")
    }

    def topic(){
        Topic topic  = topicService.getTopicById(params.id.toLong())
        List<Topic> topicList = new ArrayList<Topic>()
        topicList.add(topic)

        List<User> userList = topicService.getSubscribedUsersByTopic(topic)

        List<Resource> resourceList = resourceService.getResourcesByTopic(topic)
        [topicList: topicList,userList: userList, resourceList:resourceList, user:session.user]
    }
}
