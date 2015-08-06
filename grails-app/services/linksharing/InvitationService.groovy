package linksharing

import grails.transaction.Transactional

@Transactional
class InvitationService {

    TopicService topicService
    UserService userService
    def accepted(String email, Long topicId){

        println "!1111111111"
        User user  = userService.getUserByEmail(email)
        Topic topic = topicService.getTopicById(topicId)

        Invitation invitation = Invitation.findByUserAndTopic(user, topic)

        if(invitation)
        {
            println "22222222222222"
            invitation.acceptance = true
            invitation.save(flush: true)
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
