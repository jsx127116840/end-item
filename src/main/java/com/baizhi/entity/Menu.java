package com.baizhi.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ed_menu")
public class Menu {
    private Integer id;
    private String title;
    private String iconcls;
    private String url;
    private Integer parent_id;
}
