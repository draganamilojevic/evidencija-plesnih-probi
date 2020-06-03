<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>Lista probi</title>
</head>
<body>
<div id="header">
	<h2>Lista probi</h2>
</div>
<div id="dugme">
	<input id="dugmeDodaj" type="button" value="Dodaj probu" onclick="window.location.href='prikaziFormuZaProbu'; return false;"/>
</div>

<table id="tabela">
 <tr>
    <th>Plesna grupa</th>
    <th>Instruktor</th>
    <th>Datum</th>
    <th>Adresa</th>
    <th>Izmena</th>
    <th>Brisanje</th>
 </tr>
 <c:forEach var="temp" items="${probe}">
    <c:url var="updateLink" value="/proba/prikaziFormuIzmena">
    	<c:param name="grupaid" value="${temp.id.grupaID}"/>
    	<c:param name="instruktorid" value="${temp.id.instruktorID}"/>
    	<c:param name="datum" value="${temp.id.datum}"/>
    </c:url>
    <c:url var="deleteLink" value="/proba/obrisi">
    	<c:param name="grupaid" value="${temp.id.grupaID}"/>
    	<c:param name="instruktorid" value="${temp.id.instruktorID}"/>
    	<c:param name="datum" value="${temp.id.datum}"/>
    </c:url>
 	<tr>
 		<td> ${temp.plesnaGrupa.nazivGrupe} </td>
 		<td> ${temp.instruktor.ime} ${temp.instruktor.prezime} </td>
 		<td> ${temp.id.datum} </td>
 		<td> ${temp.adresa} </td>
 		<td> <a href="${updateLink}">Izmeni</a> </td>
 		<td> <a href="${deleteLink}" onClick="if(!(confirm('Da li ste sigurni da zelite da obrisete ovu probu?'))) return false">Obrisi</a></td>
 	</tr>
 </c:forEach>
</table>

</body>
</html>