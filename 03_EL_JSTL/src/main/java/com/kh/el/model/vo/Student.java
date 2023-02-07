package com.kh.el.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class Student {
	
	// 해당 필드에만 getter, setter 생성
	// @Setter
	// @Getter
	private String name;
	
	private int age;
	
	private int math;
	
	private int english;

}