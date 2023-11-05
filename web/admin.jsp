<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="newcss4.css" type="text/css">
    <!-- Considera agregar algún framework de CSS como Bootstrap para un diseño más atractivo -->
</head>
<body>
    <div class="admin-container">
        <header class="admin-header">
            <h1>Panel de Administración - Donaciones de Juguetes</h1>
        </header>
        <!-- Área de mensajes o notificaciones -->
        <section id="messages">
            <!-- Mensajes de confirmación o error aquí -->
        </section>
        <!-- Listado de donaciones -->
        <section id="donations-list">
            <h2>Listado de Donaciones</h2>
            <table class="donations-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descripción del Juguete</th>
                        <th>Fecha de Entrega</th>
                        <th>Cantidad</th>
                        <th>Fundación</th>
                        <th>Comentarios</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${donations}" var="donation">
                        <tr>
                            <td>${donation.id}</td>
                            <td>${donation.descripcion}</td>
                            <td>${donation.fechaEntrega}</td>
                            <td>${donation.cantidad}</td>
                            <td>${donation.fundacion}</td>
                            <td>${donation.comentarios}</td>
                            <td>
                                <!-- Botones para editar y eliminar -->
                                <a href="editDonation.jsp?id=${donation.id}">Editar</a> | 
                                <a href="deleteDonation.jsp?id=${donation.id}">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <!-- Otras secciones que podrías necesitar en tu panel de administración -->
        <!-- ... -->
    </div>
</body>
</html>