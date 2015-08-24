package linksharing

import global.GlobalContent
import global.MyEnum
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.context.request.RequestContextHolder

@Transactional
class ResourceService {

    def getRecentShares() {

        List<Resource> resourceList = Resource.createCriteria().listDistinct {
            order("dateCreated", "desc")
            createAlias("topic", "_topic")
            eq("_topic.visibility", MyEnum.Visibility.Public)
            firstResult 0
            maxResults 5
        }
        return resourceList

    }

    def getTopPosts() {

        List<Resource> resourceList = Resource.createCriteria().listDistinct {
            order("rating", "desc")
            createAlias("topic", "_topic")
            eq("_topic.visibility", MyEnum.Visibility.Public)
            firstResult 0
            maxResults 5
        }
        return resourceList
    }

    def getResourceCountByTopic(Topic topic) {
        Resource.createCriteria().count() {
            eq("topic", topic)
        }
    }

    def getResourceByID(Long id, User user) {
        updateResource(Resource.findById(id), user)
    }

    def getResourcesByTopicList(List<Topic> topicList, User user) {

        List<Resource> resourceList = Resource.findAllByTopicInList(topicList)

        updateResourceList(resourceList, user)
        resourceList.sort {-it.dateCreated.getTime()}
    }

    def getUnReadResourcesByTopicList(List<Topic> topicList, User user){

        List<Resource> resourceList = getResourcesByTopicList(topicList , user)
        removeReadResources(resourceList)
    }

    def removeReadResources(List<Resource> resourceList){
        List<Resource> readResourceList = ReadingStatus.list().resource
        return resourceList - readResourceList
    }

    def updateResourceList(List<Resource> resourceList, User user)
    {
        resourceList.each {
            updateResource(it, user)
        }
    }

    def updateResource(Resource resource, User user)
    {
            Long resourceId = resource.id

            LinkResource linkResource = LinkResource.findById(resourceId)
            if(linkResource)
                resource.urlPath = linkResource.url
            else
                resource.file = DocumentResource.findById(resourceId).filePath

            ReadingStatus readingStatus = ReadingStatus.findByUserAndResource(user, resource)
            if(readingStatus)
                resource.isRead = true;
        return resource
    }
    def getResourcesByTopic(Topic topic, User user) {

        List<Resource> resourceList = Resource.findAllByTopic(topic)

        updateResourceList(resourceList, user)
        List<Resource> readResourceList = ReadingStatus.list().resource
        return resourceList - readResourceList
    }

    def createResource(User user, Topic topic, String value, String description, String type,MultipartFile myfile, Long resourceId) {
        if (type.equals("url")) {
            LinkResource linkResource = new LinkResource(user: user, topic: topic, url: value, description: description)
            if (linkResource.validate())
                linkResource.save(flush: true)
            else {
                println linkResource.properties
                println linkResource.errors
            }
        }
        else if(type.equals("document")){
            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath( GlobalContent.userFileDirectory + myfile.getOriginalFilename() )
            File fileDest = new File(storagePath)
            myfile.transferTo(fileDest)

            DocumentResource documentResource = new DocumentResource(user: user, topic: topic, filePath: myfile.getOriginalFilename(), description: description)
            if (documentResource.validate())
                documentResource.save(flush: true)
            else {
                println documentResource.properties
                println documentResource.errors
            }
        }
        else if(type.equals("createLinkResource"))
        {
            LinkResource linkResource = LinkResource.findById(resourceId)
            linkResource.topic = topic
            linkResource.url = value
            linkResource.description = description
            linkResource.save(flush: true)
            }
        else if(type.equals("createDocumentResource"))
        {
            DocumentResource documentResource = DocumentResource.findById(resourceId)
            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath( GlobalContent.userFileDirectory + myfile.getOriginalFilename() )
            File fileDest = new File(storagePath)
            myfile.transferTo(fileDest)

            documentResource.topic = topic
            documentResource.filePath = myfile.originalFilename
            documentResource.description = description
            documentResource.save(flush: true)

        }
    }

//    def getUnReadResourceListByUser(Long userId){
//        User user  = User.findById(userId)
//
//        List<Topic> topicList = Topic.findAllBy
//    }

}
