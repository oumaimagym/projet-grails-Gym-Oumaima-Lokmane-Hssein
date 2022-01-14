package emsi.mbds

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

class ApiController {

    UserService userService
    AnnonceService annonceService

    /**
     * GET / PUT / PATCH / DELETE
     * Pour une note max : Gérer la notion de role en plus de l'utilisateur
     */
    @Secured('ROLE_ADMIN')
    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                userInstance.setPassword(request.JSON.password)
                userInstance.setUsername(request.JSON.username)
                userService.save(userInstance)
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            case "PATCH":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                userInstance.setPassword(request.JSON.password)
                userInstance.setUsername(request.JSON.username)
                if (userInstance.save()) {
                    response.withFormat {
                        xml { render userInstance as XML }
                        json { render userInstance as JSON }
                    }
                }
                return response.status = 501
                break;
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                UserRole.where { user == userInstance}.deleteAll()
                userService.delete(params.id)
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * POST / GET
     */
    @Secured('ROLE_ADMIN')
    def users() {
        switch (request.getMethod()) {
            case "GET":
                def users = User.getAll()
                if (!users)
                    return response.status = 404
                response.withFormat {
                    xml { render users as XML }
                    json { render users as JSON }
                }
                break;
            case "POST":
                if (!request.JSON.username || !request.JSON.password)
                    return response.status = 400
                def userInstance = new User()
                userInstance.setUsername(request.JSON.username)
                userInstance.setPassword(request.JSON.username)
                userService.save(userInstance)
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406

    }
    /**
     * GET / PUT / PATCH / DELETE
     */
    @Secured('ROLE_ADMIN')
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                break;
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                annonceInstance.setTitle(request.JSON.title)
                annonceInstance.setDescription(request.JSON.description)
                annonceInstance.setPrice(request.JSON.price)
                annonceService.save(annonceInstance)
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                break;
            case "PATCH":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                annonceInstance.setTitle(request.JSON.title)
                annonceInstance.setDescription(request.JSON.description)
                annonceService.save(annonceInstance)
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                break;
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                annonceService.delete(params.id)
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * POST / GET
     * Pour une note maximale : gérer la notion d'illustration
     */
    @Secured('ROLE_ADMIN')
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                def annonces = Annonce.getAll()
                if (!annonces)
                    return response.status = 404
                response.withFormat {
                    xml { render annonces as XML }
                    json { render annonces as JSON }
                }
                break;
            case "POST":
                if (!request.JSON.title || !request.JSON.description || !request.JSON.ref)
                    return response.status = 400
                def annonce = new Annonce()
                annonce.setTitle(request.JSON.title)
                annonce.setDescription(request.JSON.description)
                annonce.setRef(request.JSON.ref)
                annonce.setPrice(request.JSON.price)
                def user = User.findByUsername(request.JSON.author)
                println(user)
                annonce.setAuthor(user)
                annonceService.save(annonce)
                response.withFormat {
                    xml { render annonce as XML }
                    json { render annonce as JSON }
                }
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }
}

