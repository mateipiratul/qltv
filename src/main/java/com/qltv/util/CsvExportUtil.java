package com.qltv.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;


public class CsvExportUtil {

    public static <T> void exportToCsv(Stream<T> stream, List<String> headers, Function<T, List<String>> mapper, File targetFile) throws IOException {
        try (stream; FileWriter fw = new FileWriter(targetFile);
             PrintWriter pw = new PrintWriter(fw)) {

            // write headers
            pw.println(String.join(",", headers));

            // write data rows
            stream.forEach(item -> {
                List<String> values = mapper.apply(item);
                String line = values.stream()
                        .map(CsvExportUtil::escapeCsv)
                        .reduce((a, b) -> a + "," + b)
                        .orElse("");
                pw.println(line);
            });
        }
    }

    private static String escapeCsv(String value) {
        if (value == null) return "";
        if (value.contains(",") || value.contains("\"") || value.contains("\n")) {
            return "\"" + value.replace("\"", "\"\"") + "\"";
        }
        return value;
    }
}
