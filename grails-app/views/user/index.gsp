
<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<html>
	<head>P
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="admin" title="${message(code: 'user.admin.label', default: 'Admin')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${userInstance.admin}" /></td>
					
						<td><g:formatDate date="${userInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
