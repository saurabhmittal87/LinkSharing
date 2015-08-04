package linksharing

class ResourceController {

    ResourceService resourceService
    TopicService topicService

    def index() {

        Resource resource = resourceService.getResourceByID(params.id.toLong())
        List<Topic> trendingTopics = topicService.getTrendingTopics()

        [myResource:resource, trendingTopics:trendingTopics]
    }

    def createResource(){

        User user = session.user;
        Topic topic = topicService.getTopicById(params.topicid.toLong())
        String description = params.description
        String url = params.url
        String type = params.url != null ? "url":"document";
        resourceService.createLinkResource(user, topic,url,description,type)
        redirect(action: "dashboard", controller: "user")
    }
}
