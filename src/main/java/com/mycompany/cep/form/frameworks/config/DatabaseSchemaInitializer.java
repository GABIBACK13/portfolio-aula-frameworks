package com.mycompany.cep.form.frameworks.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;

final class DatabaseSchemaInitializer {

    private static final String COLUMNS =
            "nome TEXT NOT NULL, "
                    + "sobrenome TEXT NOT NULL, "
                    + "email TEXT NOT NULL, "
                    + "senha TEXT NOT NULL, "
                    + "cep TEXT NOT NULL, "
                    + "rua TEXT NOT NULL, "
                    + "bairro TEXT NOT NULL, "
                    + "cidade TEXT NOT NULL, "
                    + "estado TEXT NOT NULL, "
                    + "numero TEXT NOT NULL, "
                    + "complemento TEXT";

    private DatabaseSchemaInitializer() {
    }

    static void ensureTables(DataSource dataSource) throws SQLException {
        try (Connection connection = dataSource.getConnection(); Statement statement = connection.createStatement()) {
            statement.execute(
                    "CREATE TABLE IF NOT EXISTS cadastro_usuario ("
                            + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            + COLUMNS
                            + ")");
            statement.execute(
                    "CREATE TABLE IF NOT EXISTS cadastro_cliente ("
                            + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            + COLUMNS
                            + ")");
        }
    }
}
