package linksharing

import grails.transaction.Transactional

@Transactional
class InvitationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    EmailService emailService
    InvitationService invitationService

    def index(Integer max) {

        emailService.sendEmail("saurabh.mittal@tothenew.com",2.toLong())
       render "Email Sent"
    }

    def accepted(){
        String email = params.email
        String topicId = params.topicId

        if(email != null && topicId !=null)
            invitationService.accepted(email, topicId.toLong())
    }

}
