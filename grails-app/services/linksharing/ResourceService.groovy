package linksharing

import global.MyEnum
import grails.transaction.Transactional

@Transactional
class ResourceService {

    def getRecentShares() {

        List<Resource> resourceList = Resource.createCriteria().listDistinct {
            order("dateCreated", "desc")
            createAlias("topic","_topic")
            eq("_topic.visibility",MyEnum.Visibility.PUBLIC)
            firstResult 0
            maxResults 5
        }
        return resourceList

    }

    def getTopPosts(){

        List<Resource> resourceList = Resource.createCriteria().listDistinct {
            order("rating", "desc")
            createAlias("topic","_topic")
            eq("_topic.visibility",MyEnum.Visibility.PUBLIC)
            firstResult 0
            maxResults 5
        }
        return resourceList
    }

    def getResourceCountByTopic(Topic topic)
    {
        Resource.createCriteria().count(){
            eq("topic", topic)
        }
    }

    def getResourceByID(Long id)
    {
        Resource.findById(id)
    }
    def getResourcesByTopicList(List<Topic> topicList)
    {
        List<LinkResource> linkResourceList = LinkResource.findAllByTopicInList(topicList)
        List<DocumentResource> documentResourceList = DocumentResource.findAllByTopicInList(topicList)
        List<Resource> resourceList = new ArrayList<Resource>()

        linkResourceList.each {
            Resource resource = (Resource)it
            resourceList.add(resource)
            resource.urlPath = it.url
        }

        documentResourceList.each {
            Resource resource = (Resource)it
            resourceList.add(resource)
            resource.file = it.filePath
        }
//        List<Resource> readResourceList = ReadingStatus.list().resource
        return resourceList// - readResourceList
    }


    def getResourcesByTopic(Topic topic)
    {
        List<LinkResource> linkResourceList = LinkResource.findAllByTopic(topic)
        List<DocumentResource> documentResourceList = DocumentResource.findAllByTopic(topic)
        List<Resource> resourceList = new ArrayList<Resource>()

        linkResourceList.each {
            Resource resource = (Resource)it
            resourceList.add(resource)
            resource.urlPath = it.url
        }

        documentResourceList.each {
            Resource resource = (Resource)it
            resourceList.add(resource)
            resource.file = it.filePath
        }
//        List<Resource> readResourceList = ReadingStatus.list().resource
        return resourceList// - readResourceList
    }

}
