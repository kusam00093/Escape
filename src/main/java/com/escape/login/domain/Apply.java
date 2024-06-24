package com.escape.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Apply {
    private int apply_idx;
    private int user_idx;
    private int package_idx;
    private int room_idx;
    private int airplane_time_idx;
    private int apply_su;
    private int state;
    private String created;

}