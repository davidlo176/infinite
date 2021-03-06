/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class txt {

    public static LinkedList<String> lineas = new LinkedList<>();
    static String file_name = "C:\\Users\\user\\Documents\\GitHub\\infinite\\datos.txt";

    public static void read_txt() {
        //solo se pueden leer los archivos que estan en 

        String fname = "datos.txt";

        String line;
        try {
            FileReader archivo = new FileReader(file_name);

            if (archivo.ready()) {
                BufferedReader Reader = new BufferedReader(archivo);
                while ((line = Reader.readLine()) != null) {
                    lineas.add(line);
                    System.out.println(line);
                }

                Reader.close();
            } else {
                System.out.println("El archivo no existe");
            }

        } catch (IOException ex) {
            System.out.println("Error reading file named '" + fname + "'");
        }
    }

    public static void cargar_datos() {
        read_txt();
        int l = lineas.size();
        for (int i = 0; i < l; i++) {
            String[] separados = lineas.get(i).split(";");
            String rol = separados[0];
            user nuevo = new models.user(separados[1], separados[2], separados[3], separados[4], separados[5], separados[6], Double.parseDouble(separados[7]), Boolean.parseBoolean(separados[8]));

        }

    }

    public static void escribir_datos() {
        HashMap<String, models.user> lista = models.user.all_users;

        String str = "Hello";
        BufferedWriter writer;
        try {
            writer = new BufferedWriter(new FileWriter(file_name));
            for (HashMap.Entry<String, user> entry : lista.entrySet()) {
                writer.write(entry.getValue().to_string_txt());
                writer.newLine();
            }
            
            writer.close();
        } catch (IOException ex) {
            Logger.getLogger(txt.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
