package com.mycompany.cep.form.frameworks.dao;

import com.mycompany.cep.form.frameworks.model.CadastroCliente;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CadastroClienteDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public CadastroClienteDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void save(CadastroCliente cadastro) {
        currentSession().save(cadastro);
    }

    @Transactional(readOnly = true)
    public List<CadastroCliente> listAll() {
        return currentSession()
                .createQuery("from CadastroCliente order by id desc", CadastroCliente.class)
                .list();
    }

    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }
}
