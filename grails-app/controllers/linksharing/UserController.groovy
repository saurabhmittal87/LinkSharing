package linksharing

import global.MyEnum

import javax.validation.constraints.Null

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    ResourceService resourceService

    def index(Integer max) {
        redirect(action: "login")
    }

    def login()
    {
        List<Resource> topPosts = resourceService.getTopPosts()
        List<Resource> recentShares = resourceService.getRecentShares()

        [topPosts: topPosts, recentShares: recentShares, gender: MyEnum.Gender]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def dashboard() {

        try {
            User user = session.user
            Integer subscriptionCount = userService.getSubscriptionCount()
            Integer topicCount = userService.getTopicCount()

            [user: user, gender: MyEnum.Gender]
        }
        catch (NullPointerException noe)
        {
            List<Resource> topPosts = resourceService.getTopPosts()
            List<Resource> recentShares = resourceService.getRecentShares()
            render(view: login(), model: [topPosts: topPosts, recentShares: recentShares, gender: MyEnum.Gender])
        }

    }
    def authenticatelogin = {

        def user = User.findByUsernameAndPassword(params.username, params.password)
        if(user)
        {   session.user = user
            flash.message = "Hello ${user.firstName}"
            redirect(action: "dashboard")
        }
        else
        {   flash.message = "Sorry ${params.username}. Please Try Again"
            redirect(action: "login")
        }
    }

    def authenticatesignup = {

        def errorMessage = userService.authenticateSignUp(params)
        if(errorMessage.length()>0) {
        flash.error = errorMessage
        redirect(action: "login")
        }
        else{
            redirect(action: "dashboard")
        }

    }

    def logout = {
        flash.message = "GoodBye ${session.user.fullName}"
        session.user = null
        redirect(action: "login")

    }
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: userInstance.username, default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
