package linksharing

import global.GlobalContent
import global.MyEnum
import org.springframework.web.multipart.MultipartFile

class ResourceController {

    ResourceService resourceService
    TopicService topicService
    UserService userService
    CommonService commonService
    ReadingStatusService readingStatusService

    def resource() {

        Resource resource = resourceService.getResourceByID(params.id.toLong(),session.user)

        List<Topic> trendingTopics = topicService.getTrendingTopics()
        Integer topicCount = trendingTopics.size()
        trendingTopics = commonService.getSubList(trendingTopics,0,GlobalContent.sideBarItemLimit)
        List<Topic> topicList = userService.getTopicsSubscribedByUser(session.user);
        readingStatusService.updateReadingStatus(session.user,resource, MyEnum.ReadingResourceAction.Add)
        [myResource:resource, trendingTopics:trendingTopics,topicCount:topicCount,topicList:topicList]
    }

    def createOrUpdateResource(){

        User user = session.user;
        Topic topic = topicService.getTopicById(params.topicid.toLong())
        String description = params.description
        String url = params.url
        String type = params.type;
        Long resourceId = params.long('resourceId')
        if(!type)
        type = null != url ? "url":"document";
        MultipartFile myFile = null;
        if(type.equals("document") || type.equals("createDocumentResource"))
        {
            myFile = request.getFile('mydocument')
        }

        resourceService.createResource(user, topic,url,description,type,myFile,resourceId)
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
        resourceList = resourceService.getResourcesByTopicList(topicList,session.user)
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

    def manageReadingStatus(){

        String action = params.theAction
        Long resourceId = params.long('resourceId')
        Long userId = params.long('userId')

        MyEnum.ReadingResourceAction readingResourceAction = null;

        if(action.equals(MyEnum.ReadingResourceAction.Add.toString()))
            readingResourceAction = MyEnum.ReadingResourceAction.Add
        else if(action.equals(MyEnum.ReadingResourceAction.Delete.toString()))
            readingResourceAction = MyEnum.ReadingResourceAction.Delete

        readingStatusService.updateReadingStatus(User.findById(userId), Resource.findById(resourceId), readingResourceAction)
    }
}
