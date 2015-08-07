package linksharing

import grails.transaction.Transactional

@Transactional
class InvitationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    EmailService emailService
    InvitationService invitationService

    def index() {
        String email = params.email
        String topicId = params.topicId;
        if(email!= null && topicId!=null)
            emailService.sendEmail(email,topicId.toLong())

        println "Email: " + email
        println "Topic: " + topicId
        render(view: actionName)
    }

    def accepted(){
        String email = params.email
        String topicId = params.topicId

        if(email != null && topicId !=null)
            invitationService.accepted(email, topicId.toLong())

        redirect(controller: "topic", action: "topic", params: [topicId:topicId])
    }

}
