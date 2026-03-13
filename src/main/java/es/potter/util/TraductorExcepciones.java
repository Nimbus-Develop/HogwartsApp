package es.potter.util;

import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.concurrent.CompletionException;

/**
 * Utilidad para convertir excepciones técnicas de base de datos
 * en mensajes de error amigables y traducidos para el usuario.
 * <p>
 * Desempaqueta la cadena de excepciones (CompletionException → RuntimeException → causa)
 * y clasifica el error mediante códigos SQL estándar y patrones de mensaje.
 * </p>
 *
 * @author HogwartsApp
 */
public class TraductorExcepciones {

    private TraductorExcepciones() {}

    /**
     * Devuelve un mensaje de error amigable y traducido a partir de una excepción.
     *
     * @param ex     Excepción producida (puede estar envuelta en CompletionException)
     * @param bundle ResourceBundle con las traducciones activas
     * @return Mensaje de error legible para el usuario
     */
    public static String traducir(Throwable ex, ResourceBundle bundle) {
        Throwable causa = desempaquetar(ex);
        String clave = obtenerClave(causa);
        try {
            return bundle.getString(clave);
        } catch (java.util.MissingResourceException mre) {
            return bundle.getString("errorDesconocido");
        }
    }

    /**
     * Desempaqueta la cadena de excepciones hasta llegar a la causa raíz significativa.
     * Se detiene cuando encuentra un SQLException u otro tipo no envoltorio.
     */
    private static Throwable desempaquetar(Throwable ex) {
        Throwable actual = ex;
        while ((actual instanceof CompletionException || actual instanceof RuntimeException)
                && actual.getCause() != null) {
            actual = actual.getCause();
        }
        return actual;
    }

    /**
     * Determina la clave de traducción adecuada según el tipo y contenido de la excepción.
     * Primero intenta el código de error SQL (más preciso), luego analiza el mensaje.
     */
    private static String obtenerClave(Throwable ex) {
        if (ex instanceof SQLException sqlEx) {
            String clavePorCodigo = clasificarPorCodigoSql(sqlEx);
            if (clavePorCodigo != null) return clavePorCodigo;
        }

        String mensaje = ex.getMessage();
        if (mensaje == null) mensaje = "";
        String m = mensaje.toLowerCase();

        if (m.contains("connection refused") || m.contains("communications link failure")
                || m.contains("unable to connect") || m.contains("cannot connect")
                || m.contains("no suitable driver") || m.contains("network") && m.contains("unreachable")) {
            return "errorConexionRechazada";
        }
        if (m.contains("access denied") || m.contains("authentication failed")
                || m.contains("invalid credentials") || m.contains("wrong password")) {
            return "errorConexionCredenciales";
        }
        if (m.contains("timeout") || m.contains("timed out") || m.contains("time-out")) {
            return "errorConexionTimeout";
        }
        if (m.contains("table") && (m.contains("doesn't exist") || m.contains("not found")
                || m.contains("no existe"))) {
            return "errorTablaNoEncontrada";
        }
        if (m.contains("database") && (m.contains("doesn't exist") || m.contains("not found")
                || m.contains("unknown") || m.contains("no existe"))) {
            return "errorBaseDatosNoEncontrada";
        }
        if (m.contains("duplicate") || m.contains("unique constraint") || m.contains("duplicado")) {
            return "errorDatosDuplicados";
        }
        if (m.contains("foreign key") || m.contains("referential integrity")
                || m.contains("integrity constraint")) {
            return "errorIntegridadDatos";
        }
        if (ex instanceof SQLException) {
            return "errorBaseDatosGenerico";
        }

        return "errorDesconocido";
    }

    /**
     * Clasifica la excepción usando el código de error SQL del motor de base de datos.
     * Cubre los códigos más comunes de MySQL/MariaDB, H2, Derby y HSQLDB.
     *
     * @return clave de traducción, o null si el código no está mapeado
     */
    private static String clasificarPorCodigoSql(SQLException ex) {
        int codigo = ex.getErrorCode();
        String sqlState = ex.getSQLState() != null ? ex.getSQLState() : "";

        // Credenciales incorrectas
        // MySQL/MariaDB: 1045, SQLState 28000 (también H2, HSQLDB usan 28000)
        if (codigo == 1045 || sqlState.equals("28000") || sqlState.equals("28P01")) {
            return "errorConexionCredenciales";
        }
        // Base de datos desconocida
        // MySQL/MariaDB: 1049, SQLState 42000
        if (codigo == 1049) {
            return "errorBaseDatosNoEncontrada";
        }
        // Tabla no existe
        // MySQL/MariaDB: 1146, H2: 42102, Derby: 42X05
        if (codigo == 1146 || codigo == 42102 || sqlState.equals("42X05") || sqlState.equals("42S02")) {
            return "errorTablaNoEncontrada";
        }
        // No se puede conectar al servidor
        // MySQL/MariaDB: 2003 (can't connect), 2005 (unknown host)
        if (codigo == 2003 || codigo == 2005) {
            return "errorConexionRechazada";
        }
        // Entrada duplicada
        // MySQL/MariaDB: 1062, SQLState 23000
        if (codigo == 1062 || sqlState.equals("23000") || sqlState.equals("23505")) {
            return "errorDatosDuplicados";
        }
        // Violación de integridad referencial
        // MySQL/MariaDB: 1451 (can't delete parent), 1452 (can't add child)
        if (codigo == 1451 || codigo == 1452 || sqlState.equals("23503")) {
            return "errorIntegridadDatos";
        }

        return null;
    }
}