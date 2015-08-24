package linksharing

import global.MyEnum
import grails.transaction.Transactional

@Transactional
class ReadingStatusService {

    def updateReadingStatus(User user, Resource resource, MyEnum.ReadingResourceAction action) {

        ReadingStatus readingStatus = ReadingStatus.findByUserAndResource(user,resource)
        if(!readingStatus && action == MyEnum.ReadingResourceAction.Add){
                readingStatus = new ReadingStatus(user:user, resource:resource)
                readingStatus.save(flush: true)
        }
        else if(readingStatus && action == MyEnum.ReadingResourceAction.Delete)
            readingStatus.delete(flush: true)
    }
}
