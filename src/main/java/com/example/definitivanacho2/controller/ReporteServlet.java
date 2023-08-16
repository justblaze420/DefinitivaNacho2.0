package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.utils.MysqlConnector;
import net.sf.jasperreports.engine.JasperRunManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name="ReporteServlet", value = "/ReporteServlet")
public class ReporteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. Cargar el archivo .jasper.
        String reportPath = "/WEB-INF/RegistrosSRP.jasper"; // Asegúrate de tener el archivo .jasper correcto aquí.
        File reportFile = new File(getServletContext().getRealPath(reportPath));
        InputStream reportStream = new FileInputStream(reportFile);

        //2. Parámetros para el reporte (si los hay). Por ahora no añadiremos ninguno.
        Map<String, Object> parameters = new HashMap<>();

        //3. Conectar a la base de datos.
        Connection con = new MysqlConnector().connect();

        //4. Configurar la respuesta para enviar el PDF.
        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "Attachment; filename=Registros-SRP.pdf");

        //5. Generar el reporte y escribirlo en la respuesta.
        try {
            byte[] bytes = JasperRunManager.runReportToPdf(reportStream, parameters, con);
            OutputStream os = resp.getOutputStream();
            os.write(bytes);
            os.flush();
            os.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
