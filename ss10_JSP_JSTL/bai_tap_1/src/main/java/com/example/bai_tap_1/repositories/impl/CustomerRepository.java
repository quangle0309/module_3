package com.example.bai_tap_1.repositories.impl;

import com.example.bai_tap_1.models.Customer;
import com.example.bai_tap_1.repositories.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    private static List<Customer> customers;

    static {
        customers = new ArrayList<Customer>();
        customers.add(new Customer("Hoàng Đình Bảo Kỳ", "01-01-1999", "Huế", "https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/242248504_614643576512009_9207845693112111875_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeH3W9nrPR8kBHsnDETdJgliY-jR_X-uHTJj6NH9f64dMl-AZbdfGnoob1vPaFA7r0-4vj6eM_DEkhlOj-qV84H0&_nc_ohc=DKNdQCs5c4gQ7kNvgH4p1b7&_nc_ht=scontent.fsgn2-7.fna&oh=00_AYChMsfNhxTJMG2oDxzybQY_rJVlOK81Mj8RQjy1_J5ImQ&oe=66843062"));
        customers.add(new Customer("Huỳnh Gia Phúc", "01-01-2001", "Đà Nẵng", "https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/269601184_1318975668549901_7172101431100186166_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEZXyPN7UOhcHqz-5W147jJU14i1g7P_nJTXiLWDs_-cophBlQzOBd0GsTlrhLLZiclMsqDtyCew5BJO8lABrEY&_nc_ohc=wNhAdSZTfxwQ7kNvgGKR_-I&_nc_ht=scontent.fsgn2-5.fna&oh=00_AYDiJDO7jXv27i34oakp7zTPSJJQiVaeGjgwHuLGrPsTJA&oe=6684232E"));
        customers.add(new Customer("Tôn Thất Hoàng Phong", "01-02-1999", "Huế", "https://scontent.fsgn2-3.fna.fbcdn.net/v/t39.30808-6/438224316_2650606225098061_2089393696616429069_n.jpg?stp=cp6_dst-jpg&_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGZfz2v635eddZ9Bvvo9rKlLrcPNOMvpWQutw804y-lZBN5XEbJo0KfAIa3cjeIPmVetWPnm83PZKEFUoK4wnYF&_nc_ohc=w5VoKO3WcTEQ7kNvgESmcvv&_nc_ht=scontent.fsgn2-3.fna&oh=00_AYA-UJ706VeQDcFyl7PUZd4egkyTM_dIBw0rguWSAydWpw&oe=668432B6"));
        customers.add(new Customer("Phan Chí Thanh", "01-01-1992", "Quảng Bình", "https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.18169-9/11150195_1101539359863520_777712925228358600_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=53a332&_nc_eui2=AeEQh3obguDT5_qbJInIMTAKT7I1sFD8AwxPsjWwUPwDDFV0lEq26Tg21YBa1-BK5uCU1hV5OAPf3hxp_70YhrP9&_nc_ohc=Bmq27fCXRxMQ7kNvgEyvZ-u&_nc_ht=scontent.fsgn2-6.fna&oh=00_AYA4vp6PPA0Mg4jGwGdPqXcaCPJ-PaHktYpo_QoCJmIxLA&oe=66A5EE74"));
        customers.add(new Customer("Trần Trung Hiếu", "02-01-2001", "Quảng Trị", "https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.6435-9/73018939_2147202262247474_7739539223534895104_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=53a332&_nc_eui2=AeEtS67KbSQ0qLfov7UiItSCKnhuTP6-HysqeG5M_r4fK5fTfojzJBNTutfUGjQBY4OpAuunkVNE18jOWlxShrPw&_nc_ohc=jIw6pnsfoMkQ7kNvgE-9u_o&_nc_ht=scontent.fsgn2-10.fna&oh=00_AYCJqldEa-U_p-D6iNOuHsRhwCXquMuLFMKKByn64QJU8A&oe=66A5E68E"));
        customers.add(new Customer("Phạm Trường Hội", "02-01-1999", "Quảng Nam", "https://scontent.fdad1-1.fna.fbcdn.net/v/t1.18169-9/12924596_532807200262901_6198129992731074515_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=53a332&_nc_eui2=AeE4jn02I4yftn6BHkeMXmz4cUmECfJBs1VxSYQJ8kGzVcKb5R6MdDCU95c6gXrYK-04b060f25kbnBDLJtAANeu&_nc_ohc=D03daPP2nCsQ7kNvgEHQWEJ&_nc_ht=scontent.fdad1-1.fna&oh=00_AYC9uapE83zoskZa2zPuCbS2QCqW4irkjRL5wRd1rEEZ1A&oe=66A5D8AB"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers);
    }
}
