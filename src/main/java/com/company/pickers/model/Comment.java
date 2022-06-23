package com.company.pickers.model;

import lombok.Data;

@Data
public class Comment {
	//Get ResponseBody
	private int seq; //순번
	private int board_seq; //게시글 번호
	private String name; //작성자
	private String password; //비밀번호
	private String comment; //작성글
	private String reg_dt; //게시글 등록일자
	private String update_dt; //게시글 수정일자
	private String ip; //아이피
	private int like;
	private int hate;
}
