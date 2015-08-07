package linksharing

import global.MyEnum
import grails.transaction.Transactional

@Transactional
class InvitationService {

    TopicService topicService
    UserService userService
    def accepted(String email, Long topicId){

        User user  = userService.getUserByEmail(email)
        Topic topic = topicService.getTopicById(topicId)

        Invitation invitation = Invitation.findByUserAndTopic(user, topic)

        if(invitation)
        {
            invitation.acceptance = true
            invitation.save(flush: true)

            Subscription subscription = new Subscription()
            subscription.seriousness = MyEnum.Seriousness.CASUAL
            subscription.topic = topic
            subscription.user = user
            subscription.save(flush: true)
        }
    }

    def sendInvitation(User  user, Topic topic){
        Invitation invitation = new Invitation()
        invitation.user = user
        invitation.topic = topic
        if(invitation.validate())
            invitation.save(flush: true)
        else
            println "Errrrpr" + invitation.errors
    }
}
