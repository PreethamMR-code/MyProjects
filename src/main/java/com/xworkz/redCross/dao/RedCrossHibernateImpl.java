package com.xworkz.redCross.dao;

import com.xworkz.redCross.dto.DonarAccountDto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;


import java.util.Optional;

@Repository
public class RedCrossHibernateImpl implements RedCrossDao {


    @Override
    public boolean save(DonarAccountDto donarAccountDto) {

        Configuration configuration = new Configuration();
        configuration.configure();
        configuration.addAnnotatedClass(DonarAccountDto.class);
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(donarAccountDto);
        transaction.commit();
        return true;
    }

    @Override
    public Optional<DonarAccountDto> getDonarByEmail(String email) {

        return Optional.empty();
    }

    @Override
    public boolean update(DonarAccountDto donarAccountDto) {
        return false;
    }

//    @Override
//    public boolean deleteByEmail(int id) {
//
//        boolean isDonarDeleted = false;
//
//        Session session = new Configuration().
//                configure().
//                addAnnotatedClass(DonarAccountDto.class).
//                buildSessionFactory().
//                openSession();
//
//        Transaction transaction = session.beginTransaction();
//        DonarAccountDto donarAccountDto = session.get(DonarAccountDto.class, id);
//
//        if (donarAccountDto != null) {
//            session.save(donarAccountDto);
//            transaction.commit();
//            isDonarDeleted = true;
//        }
//        return true;


        @Override
        public boolean deleteById ( int id){

            boolean isDonorDeleted = false;

            Session session = new Configuration()
                    .configure()
                    .addAnnotatedClass(DonarAccountDto.class)
                    .buildSessionFactory()
                    .openSession();

            Transaction transaction = session.beginTransaction();

            // fetch donor using PRIMARY KEY (id)
            DonarAccountDto donarAccountDto = session.get(DonarAccountDto.class, id);

            if (donarAccountDto != null) {

                // DELETE (not save)
                session.delete(donarAccountDto);

                transaction.commit();
                isDonorDeleted = true;
            } else {
                transaction.rollback();
            }

            session.close();
            return isDonorDeleted;
        }

    }


