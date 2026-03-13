package es.potter.servicio;

import es.potter.model.Alumno;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Servicio para exportar alumnos a formato CSV.
 * Genera un archivo con cabecera y una fila por alumno.
 * Los campos que puedan contener comas se escapan automáticamente.
 *
 * @author Marco, Wara
 * @version 1.0
 * @since 2026-03-12
 */
public class ExportadorAlumnos {

    /** Logger para registrar el proceso de exportación */
    private static final Logger logger = LoggerFactory.getLogger(ExportadorAlumnos.class);

    /** Cabecera del archivo CSV con los nombres de columna */
    private static final String CABECERA = "id,nombre,apellidos,curso,casa,patronus";

    /**
     * Constructor privado: clase de servicio estático, no se instancia directamente.
     */
    private ExportadorAlumnos() {}

    /**
     * Exporta una lista de alumnos a un archivo CSV.
     * Crea el archivo con cabecera y una fila por cada alumno de la lista.
     *
     * @param alumnos Lista de alumnos a exportar
     * @param destino Archivo de destino donde se escribirá el CSV
     * @throws IOException si ocurre un error al escribir el archivo
     *
     * @author Marco, Wara
     */
    public static void exportarCsv(List<Alumno> alumnos, File destino) throws IOException {
        logger.info("Iniciando exportación de {} alumno(s) a '{}'", alumnos.size(), destino.getAbsolutePath());

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(destino))) {
            // Escribir la cabecera
            writer.write(CABECERA);
            writer.newLine();

            // Escribir una fila por cada alumno
            for (Alumno alumno : alumnos) {
                writer.write(formatearFila(alumno));
                writer.newLine();
                logger.debug("Exportado: {}", alumno.getId());
            }
        }

        logger.info("Exportación completada: {} alumno(s) en '{}'", alumnos.size(), destino.getName());
    }

    /**
     * Convierte un alumno en una línea CSV con sus campos separados por comas.
     *
     * @param alumno Alumno a convertir en fila CSV
     * @return Línea CSV con los datos del alumno
     *
     * @author Marco, Wara
     */
    private static String formatearFila(Alumno alumno) {
        return String.join(",",
                escapar(alumno.getId()),
                escapar(alumno.getNombre()),
                escapar(alumno.getApellidos()),
                String.valueOf(alumno.getCurso()),
                escapar(alumno.getCasa()),
                escapar(alumno.getPatronus())   // puede ser null → se convierte en cadena vacía
        );
    }

    /**
     * Escapa un valor para CSV según la especificación RFC 4180:
     * si contiene comas o comillas dobles, lo envuelve en comillas.
     * Los valores null se exportan como cadena vacía.
     *
     * @param valor Valor a escapar (puede ser null)
     * @return Valor seguro para incluir en CSV
     *
     * @author Marco, Wara
     */
    private static String escapar(String valor) {
        if (valor == null) return "";

        // Si contiene coma o comilla doble, envolver en comillas y escapar las comillas internas
        if (valor.contains(",") || valor.contains("\"")) {
            return "\"" + valor.replace("\"", "\"\"") + "\"";
        }

        return valor;
    }
}