<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<%
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    boolean encontrado = false;
    int tipoUsuario = -1; 

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/prueba", "root", "")) {
        String query = "";

        query = "SELECT usuario FROM admin WHERE usuario = ? AND contrasena = ?";
        try (PreparedStatement pstmtAdmin = conn.prepareStatement(query)) {
            pstmtAdmin.setString(1, usuario);
            pstmtAdmin.setString(2, contrasena);
            ResultSet rsAdmin = pstmtAdmin.executeQuery();
            if (rsAdmin.next()) {
                encontrado = true;
                tipoUsuario = 1; // Admin
            }
        }
        
        if (!encontrado) {
            query = "SELECT usuario FROM registrate WHERE usuario = ? AND contrasena = ?";
            try (PreparedStatement pstmtUsuario = conn.prepareStatement(query)) {
                pstmtUsuario.setString(1, usuario);
                pstmtUsuario.setString(2, contrasena);
                ResultSet rsUsuario = pstmtUsuario.executeQuery();
                if (rsUsuario.next()) {
                    encontrado = true;
                    tipoUsuario = 0;
                }
            }
        }

        if (encontrado) {
            if (tipoUsuario == 1) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("ingresar.jsp");
            }
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error en el bloque catch: " + e.getMessage());
        response.sendRedirect("error.jsp");
    }
%>
