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

    }

    def handleInvitation(){
        String email = params.email
        String topicId = params.topicId
        String action = params.actiontype
        String invitationResponse = null;
        if(email != null && topicId !=null)
            invitationResponse = invitationService.handleInvitation(email, topicId.toLong(),action)

        flash.message = invitationResponse

        if(session.user.email != email)
            session.user = null;
        if(!invitationResponse.startsWith("Thank")){
                redirect(controller: "user", action: "login")
        }
        else
            redirect(controller: "topic", action: "topic", params: [topicId:topicId])
    }

}
