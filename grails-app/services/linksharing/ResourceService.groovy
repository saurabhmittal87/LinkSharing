package linksharing

import global.GlobalContent
import global.MyEnum
import grails.transaction.Transactional
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

    def getResourceByID(Long id) {
        updateResource(Resource.findById(id))
    }

    def getResourcesByTopicList(List<Topic> topicList) {

        List<Resource> resourceList = Resource.findAllByTopicInList(topicList)

//        List<LinkResource> linkResourceList = LinkResource.findAllByTopicInList(topicList)
//        List<DocumentResource> documentResourceList = DocumentResource.findAllByTopicInList(topicList)
//
//        linkResourceList.each {
//            Resource resource = (Resource) it
//            resourceList.add(resource)
//            resource.urlPath = it.url
//        }
//
//        documentResourceList.each {
//            Resource resource = (Resource) it
//            resourceList.add(resource)
//            resource.file = it.filePath
//        }
        updateResourceList(resourceList)
        resourceList.sort {-it.dateCreated.getTime()}
    }

    def updateResourceList(List<Resource> resourceList)
    {
        resourceList.each {
            Long resourceId = it.id

            LinkResource linkResource = LinkResource.findById(resourceId)
            if(linkResource)
                it.urlPath = linkResource.url
            else
                it.file = DocumentResource.findById(resourceId).filePath
        }
    }

    def updateResource(Resource resource)
    {
            Long resourceId = resource.id

            LinkResource linkResource = LinkResource.findById(resourceId)
            if(linkResource)
                resource.urlPath = linkResource.url
            else
                resource.file = DocumentResource.findById(resourceId).filePath
        return resource
    }
    def getResourcesByTopic(Topic topic) {

        List<Resource> resourceList = Resource.findAllByTopic(topic)
//        List<LinkResource> linkResourceList = LinkResource.findAllByTopic(topic)
//        List<DocumentResource> documentResourceList = DocumentResource.findAllByTopic(topic)
//        List<Resource> resourceList = new ArrayList<Resource>()
//
//        linkResourceList.each {
//            Resource resource = (Resource) it
//            resourceList.add(resource)
//            resource.urlPath = it.url
//        }
//
//        documentResourceList.each {
//            Resource resource = (Resource) it
//            resourceList.add(resource)
//            resource.file = it.filePath
//        }

        updateResourceList(resourceList)
//        List<Resource> readResourceList = ReadingStatus.list().resource
        return resourceList// - readResourceList
    }

    def createLinkResource(User user, Topic topic, String value, String description, String type) {

        if (type.equals("url")) {
            LinkResource linkResource = new LinkResource(user: user, topic: topic, url: value, rating: 0, description: description)
            if (linkResource.validate())
                linkResource.save(flush: true)
            else {
                println linkResource.properties
                println "----------------------"
                println linkResource.errors
            }
        }
        else if(type.equals("document")){

            GrailsWebRequest webUtils = WebUtils.retrieveGrailsWebRequest()
            def request = webUtils.getCurrentRequest()
            request = RequestContextHolder.currentRequestAttributes().request
            MultipartFile myfile = request.getFile('mydocument')
            File fileDest = new File(GlobalContent.userFileDirectory +  myfile.getOriginalFilename())
            myfile.transferTo(fileDest)

            DocumentResource documentResource = new DocumentResource(user: user, topic: topic, filePath:myfile.getOriginalFilename(), rating: 0, description: description)
            if (documentResource.validate())
                documentResource.save(flush: true)
            else {
                println documentResource.properties
                println documentResource.errors
            }
        }
    }

}
