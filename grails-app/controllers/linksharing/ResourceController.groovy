package linksharing

class ResourceController {

    ResourceService resourceService
    TopicService topicService

    def index() {

        Resource resource = resourceService.getResourceByID(params.id.toLong())
        List<Topic> trendingTopics = topicService.getTrendingTopics()

        [myResource:resource, trendingTopics:trendingTopics]
    }
}
