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
    def authenticateSignUp(GrailsParameterMap params) {

        try
        {
            User user = new User()

            GrailsWebRequest webUtils = WebUtils.retrieveGrailsWebRequest()
            def request = webUtils.getCurrentRequest()

            user.topic = null;
            user.password = params.password
            user.lastName = params.lastname

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
            }
            else
            {
            String errorMessage = ""
            user.errors?.allErrors?.each{
                errorMessage +=  messageSource.getMessage(it, null) + "\n"
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
}
