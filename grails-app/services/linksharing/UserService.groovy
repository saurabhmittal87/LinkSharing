package linksharing

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.codehaus.groovy.grails.web.util.WebUtils
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.context.MessageSource
import org.springframework.web.multipart.MultipartFile

@Transactional
class UserService {

    MessageSource messageSource
    SubscriptionService subscriptionService
    TopicService topicService
    def authenticateSignUp(GrailsParameterMap params) {

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
            def homeDir = System.getProperty("user.home") //user home e.g /home/username for unix
            user.imagePath = homeDir.toString() + "/userimage/" + params.username


            File fileDest = new File(user.imagePath)
            myfile.transferTo(fileDest)


            if(user.validate())
            {
                user.save(flush: true)
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

    def getSubscriptionByUser(User user,Integer lowerLimit, Integer count)
    {
        subscriptionService.getSubscriptionByUser(user, lowerLimit, count)
    }

    def getTopicCountByUser(User user)
    {
        topicService.getTopicCountByUser(user)
    }


}
