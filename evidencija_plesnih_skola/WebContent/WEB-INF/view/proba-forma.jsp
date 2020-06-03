<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<style type="text/css">td:nth-child(3) {
	width: 12%;
	background: white;
	border-top-style: hidden;
	
}</style>
<title>Proba Forma</title>
</head>
<body>
<div id="headerForma">
<h2>Podaci o probi</h2>
</div>
<div id="proba-forma">
<form:form action="obradiFormu" modelAttribute="proba" method="POST">
   <table>
     <colgroup>
        <col class="outlined">
        <col class="outlined">
        <col>
     </colgroup>
      <tr>
          <td><label>Plesna grupa:</label></td>
          <td>
              <form:select path="id.grupaID" class="poljeForme">
                  <form:options items="${grupe}" />
              </form:select>
             
          </td>
          <td></td>
      </tr>
      <tr>
          <td><label>Instruktor:</label></td>
          <td><form:select path="id.instruktorID" class="poljeForme">
                  <form:options items="${instruktori}" />
              </form:select>
          </td>
          <td></td>
      </tr>
      <tr>
      	  <td><label>Datum:(yyyy-mm-dd)</label></td>
      	  <td> 
      	      <form:input class="poljeForme" path="id.datum" type="date" placeholder="npr.2020-05-24"/>
      	      
      	  </td>
      	  <td><form:errors path="id.datum" cssClass="error"/></td>
      </tr>
      <tr>
      	  <td><label>Adresa:(ulica i broj)</label></td>
      	  <td><form:input class="poljeForme" path="adresa" placeholder="npr.Karadjordjeva 65"/>
      	       </td>
          <td><form:errors path="adresa" cssClass="error"/></td>
      </tr>
      
   </table><br>
   <div id="dugmeSacuvaj">
       <input id="dugmeDodaj" type="submit" value="Sacuvaj probu"/>
   </div>
</form:form>
<br>
</div>

</body>
</html>