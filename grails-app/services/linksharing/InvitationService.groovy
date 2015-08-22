package linksharing

import global.MyEnum
import grails.transaction.Transactional

@Transactional
class InvitationService {

    TopicService topicService
    UserService userService
    String handleInvitation(String email, Long topicId, String action){

        String responseMessage = null;
        User user  = userService.getUserByEmail(email)
        Topic topic = topicService.getTopicById(topicId)
        Invitation invitation = Invitation.findByEmailAndTopic(email,topic)
        if(user && invitation)
        {

            if(action.equals("accepted")) {
                acceptInvitation(invitation)
                responseMessage = "Thank you for accepting the invitation"
            }
            else if(action.equals("rejected"))
                responseMessage = "Your invitation is successfully rejected"
            deleteInvitation(invitation)
        }
        else if(invitation)
        {
            if(action.equals("accepted"))
                responseMessage = "Kindly signup before accepting the invitation"
            else if(action.equals("rejected")) {
                deleteInvitation(invitation)
                responseMessage = "Your invitation is successfully rejected"
            }
        }
        else
            return "Your response for this invitation has been processed already."
        return responseMessage;
    }

    void deleteInvitation(Invitation invitation)
    {
        if(invitation)
            invitation.delete(flush: true)
    }

    void acceptInvitation(Invitation invitation)
    {
        Subscription subscription = new Subscription()
        subscription.seriousness = MyEnum.Seriousness.Casual
        subscription.topic = invitation.topic
        subscription.user = invitation.user
        subscription.save(flush: true)
    }
    def sendInvitation(User user,String email, Topic topic){
        Invitation invitation = new Invitation()
        invitation.user = user
        invitation.topic = topic
        invitation.email = email
        if(invitation.validate())
            invitation.save(flush: true)
        else
            println "Error" + invitation.errors
    }

    def Boolean isInvitationOpen (User user, Topic topic)
    {
        Integer invitation = Invitation.createCriteria().count{
            eq('user', user)
            eq("topic", topic)
        }
        if(invitation)
            true
        else
            false
    }
}
