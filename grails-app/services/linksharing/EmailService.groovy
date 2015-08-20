package linksharing

import grails.transaction.Transactional
import org.springframework.web.context.request.RequestContextHolder

@Transactional
class EmailService {

    def mailService
    def groovyPageRenderer
    def grailsLinkGenerator
    TopicService topicService
    UserService userService
    InvitationService invitationService
    def sendEmail(String email, Long topicId) {

        User user = userService.getUserByEmail(email)
        Topic topic
        if(user)
        {
            def session = RequestContextHolder.currentRequestAttributes().getSession()

            topic = topicService.getTopicById(topicId)
            invitationService.sendInvitation(user, topic)
            def content = groovyPageRenderer.render(view: '/layouts/email',model: [username:session.user.firstName, topicName: topic.name, email:email, topicId:topicId, base: grailsLinkGenerator.serverBaseURL])
            sendMail(email,"LinkSharing Invitation",content)
        }
    }

    def sendPasswordMail(String email)
    {
        User user = User.findByEmail(email)
        if(user)
            sendMail(user.email,"LinkSharing Password","Your password is: " + user.password)
    }

    private void sendMail(String email, String theSubject, String content)
    {
        mailService.sendMail {
            to (email)
            subject(theSubject)
            html (content)
        }
    }
}
