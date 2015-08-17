package linksharing

class ResourceController {

    ResourceService resourceService
    TopicService topicService
    UserService userService
    CommonService commonService

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

    def getResourcesByUser(){
        Integer offset = params.int('offset')
        Integer max = params.int('max')

        if(offset!= null && max != null)
        {

            List<Topic> topicList = userService.getTopicsSubscribedByUser(session.user);
            List<Resource> resourceList = resourceService.getResourcesByTopicList(topicList)
            Integer resourceCount = resourceList.size()
            resourceList = commonService.getSubList(resourceList, offset,max)

            render(template: "/layouts/resource", model: [resourceList:resourceList, resourceCount:resourceCount, offset:offset, max:max])
        }
    }
}
