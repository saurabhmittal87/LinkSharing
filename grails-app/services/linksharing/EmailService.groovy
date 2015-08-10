package linksharing

import grails.transaction.Transactional

@Transactional
class EmailService {

    def mailService
    def groovyPageRenderer
    TopicService topicService
    UserService userService
    InvitationService invitationService
    def sendEmail(String email, Long topicId) {

        User user = userService.getUserByEmail(email)
        Topic topic
        if(user)
        {
            topic = topicService.getTopicById(topicId)
            invitationService.sendInvitation(user, topic)
            def content = groovyPageRenderer.render(view: '/layouts/email',model: [email:email, topicId:topicId])
            mailService.sendMail {
                to (email)
                subject "LinkSharing Invitation"
                html (content)
            }
        }
    }
}
