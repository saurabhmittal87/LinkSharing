package linksharing

import global.GlobalContent
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.codehaus.groovy.grails.web.util.WebUtils
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.context.MessageSource
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpSession

@Transactional
class UserService {

    MessageSource messageSource
    SubscriptionService subscriptionService
    TopicService topicService
    def authenticateSignUp(GrailsParameterMap params, HttpSession session) {

        try
        {
            User user = new User()

            GrailsWebRequest webUtils = WebUtils.retrieveGrailsWebRequest()
            def request = webUtils.getCurrentRequest()

            user.topic = null;
            user.password = params.password
            user.lastName = params.lastname
            user.gender = params.gender
            user.admin = false
            user.email = params.email
            user.firstName =params.firstname
            user.username = params.username

            MultipartFile myfile = request.getFile('image')
            user.fileExtention = myfile.originalFilename.lastIndexOf(".")>-1?myfile.originalFilename.substring(myfile.originalFilename.lastIndexOf(".")):null


            File fileDest = new File(GlobalContent.userImageDirectory +  user.username)
            myfile.transferTo(fileDest)


            if(user.validate())
            {
                user.save(flush: true)
                session.user = user
                return ""
            }
            else
            {
            String errorMessage = ""
            user.errors?.allErrors.each(){
                println it
                if(errorMessage.equals(""))
                     errorMessage =  messageSource.getMessage(it, null)
            };
                return errorMessage
            }

        }
        catch (Exception ex)
        {
            println ex.toString()
            return "Some error occurred while registering user"
        }
    }

    def getSubscriptionCountByUser(User user)
    {
        subscriptionService.getSubscriptionCountByUser(user)
    }

    def getTopicsSubscribedByUser(User user)
    {
        subscriptionService.getTopicsSubscribedByUser(user);
    }
    def getSubscriptionByUser(User user,Integer lowerLimit, Integer count)
    {
        subscriptionService.getSubscriptionByUser(user, lowerLimit, count)
    }

    def getTopicCountByUser(User user)
    {
        topicService.getTopicCountByUser(user)
    }


}
