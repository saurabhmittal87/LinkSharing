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


}
