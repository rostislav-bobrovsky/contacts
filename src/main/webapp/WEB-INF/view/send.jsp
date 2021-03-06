<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.itechart.contacts.mail.TemplateEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send</title>
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/formSend.js"></script>
</head>
<body>
<div class="container">
    <header class="page-header">
        <h1 class="text-center">Send</h1>
    </header>

    <form action="list?action=sended&limit=${limit}&offset=${offset}" method="post" onsubmit="return checkSendForm();">
        <%--<form action="${pageContext.request.contextPath}/contacts/1" method="post" onsubmit="return checkSendForm();">--%>
        <div class="row col-lg-12">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="to" class="col-lg-1 control-label">To</label>

                    <div class="col-lg-11">
                        <input type="text" class="form-control" id="to" name="to" disabled
                               value="${emails}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="subject" class="col-lg-1 control-label">Subject</label>

                    <div class="col-lg-11">
                        <input type="text" class="form-control" id="subject" name="subject" value="">
                    </div>
                </div>
                <c:forEach var="template" items="<%=TemplateEnum.values()%>">
                    <input type="hidden" id="id${template.displayName}" value="${template.template}">
                </c:forEach>
                <div class="form-group">
                    <label for="templateSelect" class="col-lg-1 control-label">Template</label>

                    <div class="col-lg-4">
                        <select id="templateSelect" name="templateSelect" class="form-control"
                                onchange="changeTemplate();">
                            <option selected>-None selected-</option>
                            <c:forEach var="template" items="<%=TemplateEnum.values()%>">
                                <option>${template.displayName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div id="lineTextarea" class="form-group">
                        <div class="col-lg-offset-1 col-lg-11">
                            <textarea id="textareaText" name="textareaText" class="form-control textarea-vertical"
                                      rows="10"
                                      placeholder="Compose email"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <a class="btn btn-default btn-lg pull-right" href="list?limit=${limit}&offset=${offset}">Cancel</a>
                </div>
                <c:if test="${not empty emails}">
                    <div class="col-lg-6">
                        <button type="submit" class="btn btn-primary btn-lg"><span
                                class="glyphicon glyphicon-send"></span>&nbsp;Send mail
                        </button>
                    </div>
                </c:if>
            </div>
        </div>
    </form>
</div>
</body>
</html>
