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
        String filePath = null
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
            List<Resource>resourceList;
            Integer resourceCount = 0;
            getResourceList(resourceList,resourceCount,offset,max)
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

    private HashMap getResourceList(List<Resource>resourceList, Integer resourceCount, Integer offset, Integer maximum){
        List<Topic> topicList = userService.getTopicsSubscribedByUser(session.user);
        resourceList = resourceService.getResourcesByTopicList(topicList)
        resourceCount = resourceList.size()
        if(offset)
            resourceList = commonService.getSubList(resourceList, offset,maximum)
        [resourceList:resourceList, resourceCount: resourceCount]
    }


    def posts(){
        List<Resource>resourceList;
        Integer resourceCount = 0;
        HashMap map = getResourceList(resourceList,resourceCount,null,null)
        resourceList = map['resourceList']
        resourceCount = map['resourceCount']
        [resourceList:resourceList, resourceCount:resourceCount]
    }
}
