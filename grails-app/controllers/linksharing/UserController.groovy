package linksharing

import global.GlobalContent
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    ResourceService resourceService
    SubscriptionService subscriptionService
    TopicService topicService
    CommonService commonService
    EmailService emailService

    def index(Integer max) {
        User user = userService.getUserByID(params.id.toLong())

        List<Topic> topicList = topicService.getTopicListByUser(user)
        [user:user, topicList: topicList]
    }

    def login()
    {
        if(session.user)
            redirect(action: "dashboard")
        List<Resource> topPosts = resourceService.getTopPosts()
        List<Resource> recentShares = resourceService.getRecentShares()

        [topPosts: topPosts, recentShares: recentShares]
    }

    def dashboard() {
        try {
            User user = session.user
            if(null == user) {
                redirect(action: "login")
                return
            }

            session.user = userService.updateUser(user,[totalTopics:'',totalSubscriptions:''])

            Integer subscriptionCount = userService.getSubscriptionCountByUser(user)
            Integer topicCount = userService.getTopicCountByUser(user)
            List<Topic> topicList = userService.getTopicsSubscribedByUser(user);
            List<Topic> trendingTopics = topicService.getTrendingTopics()

            Integer trendTopicCount = trendingTopics.size();
            trendingTopics = commonService.getSubList(trendingTopics,0,5)

            List<Resource> resourceList = resourceService.getResourcesByTopicList(topicList)

            Integer resourceCount = resourceList.size()
            resourceList = commonService.getSubList(resourceList,0,5)

            [user: user, subscriptionCount:subscriptionCount,resourceCount:resourceCount, topicCount:topicCount, subCount:'9', trendTopicCount:trendTopicCount, topicList:topicList, trendingTopics:trendingTopics, resourceList:resourceList]
        }
        catch (NullPointerException noe)
        {
            redirect(action: "login")
        }

    }
    def authenticatelogin = {

        def user = User.findByUsernameAndPasswordAndActive(params.username, params.password, true)
        if(user)
        {
            user.totalTopics = topicService.getTopicCountByUser(user)
            user.totalSubscriptions = subscriptionService.getSubscriptionCountByUser(user)
            session.user = user
            redirect(action: "dashboard")
        }
        else
        {
            flash.put("login error","Either of username and password is not correct")
            redirect(action: "login")
        }
    }

    def authenticatesignup = {
        MultipartFile userImage;
        userImage = request.getFile('image')
        def errorMessage = userService.authenticateSignUp(params,session,userImage)
        if(errorMessage.length()>0) {
        flash.error = errorMessage
        redirect(action: "login")
        }
        else{
            redirect(action: "dashboard")
        }

    }

    def logout = {
        session.user = null
        redirect(action: "login")

    }

    def profile = {
        User user = session.user;
        List<Topic> topicList = topicService.getTopicListByUser(session.user)
        Integer topicCount = topicList.size()
        topicList = commonService.getSubList(topicList,0,GlobalContent.sideBarItemLimit)

        [user:user, topicList:topicList,topicCount:topicCount]
    }

    def subscriptionManager = {
        User user = session.user;
        Topic topic = topicService.getTopicById(params.topicId.toLong())
        String action = params.actionstatus
        subscriptionService.manageSubscrition(user,topic,action)
        redirect(action: "dashboard")
    }


    def deleteTopic = {
        topicService.deleteTopicById(params.topicid.toLong())
        redirect(action: "dashboard")
    }

    def users = {
        List <User> userList = userService.getUserList()
        [userList:userList]
    }

    def static updateUserStats = {
    }

    def manageUserActivation = {

        Long userId = params.long('userId')
        Boolean newActivationStatus = params.boolean('newActivationStatus')
        userService.manageUserActivation(userId,newActivationStatus)

        if(userId == session.user.id) {
            redirect(action: "logout")
        }
        else
            redirect(action: "users")
    }

    def forgotPassword = {
        String email = params.email
        if(email) {
            emailService.sendPasswordMail(email)
            [message: "An email has been sent to your registered email id"]
        }
    }
}
