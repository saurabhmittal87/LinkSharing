package linksharing

import global.GlobalContent
import org.springframework.web.multipart.MultipartFile

class ResourceController {

    ResourceService resourceService
    TopicService topicService
    UserService userService
    CommonService commonService

    def index() {

        Resource resource = resourceService.getResourceByID(params.id.toLong())

        List<Topic> trendingTopics = topicService.getTrendingTopics()
        Integer topicCount = trendingTopics.size()
        trendingTopics = commonService.getSubList(trendingTopics,0,GlobalContent.sideBarItemLimit)

        [myResource:resource, trendingTopics:trendingTopics,topicCount:topicCount]
    }

    def createResource(){

        User user = session.user;
        Topic topic = topicService.getTopicById(params.topicid.toLong())
        String description = params.description
        String url = params.url
        String type = params.url != null ? "url":"document";
        MultipartFile myFile = null;
        if(type.equals("document"))
        {
            myFile = request.getFile('mydocument')
        }
        resourceService.createLinkResource(user, topic,url,description,type,myFile)
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

    def deleteResource(){
        Resource resource = resourceService.getResourceByID(params.long('resourceId'))
        println "Resource: " + resource.id

        if(resource)
        {
            resource.delete(flush: true)
            redirect(controller: "user", action: "dashboard")
        }

    }
}
